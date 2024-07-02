import 'package:ageiscme_data/services/processo_leitura_andamento/processo_leitura_andamento_service.dart';
import 'package:ageiscme_models/enums/command_result_alert_type.dart';
import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/mixins/local_mixin.dart';
import 'package:ageiscme_models/models/instituicao/instituicao_model.dart';
import 'package:ageiscme_models/models/processo_leitura_acao/processo_leitura_acao_model.dart';
import 'package:ageiscme_models/models/processo_leitura_andamento/processo_leitura_andamento_model.dart';
import 'package:ageiscme_processo/app/module/enums/tipo_selecao.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_codigo/processo_leitura_codigo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/models/selecao_kit_item/selecao_kit_item_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_close_screen/processo_page_close_screen_page.dart';
import 'package:ageiscme_processo/app/module/services/processo_leitura/processo_leitura_service.dart';
import 'package:ageiscme_processo/app/module/services/processo_navigator_service.dart';
import 'package:ageiscme_processo/app/module/web_sockets/processo_leitura/processo_leitura_web_socket.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/functions/window_manager/window_manager_helper.dart';
import 'package:compartilhados/version/version.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class ProcessoLeituraCubit extends Cubit<ProcessoLeituraState> {
  final LoadingController loadingController;
  late final FocusNode focus;
  final List<String> filaLeituras = [];
  late final ProcessoLeituraService service =
      ProcessoLeituraService(loading: loadingController);

  DateTime? dataUltimaLeitura;
  ProcessoLeituraWebSocket? webSocket;
  bool aviso15MinutosApareceu = false;
  bool aviso5MinutosApareceu = false;
  bool first = true;

  ProcessoLeituraCubit({
    required this.loadingController,
  }) : super(
          ProcessoLeituraState(
            processo: ProcessoLeituraMontagemModel.empty(),
          ),
        );

  void setHandleKey(dynamic Function(String) onEnter) {
    loadingController.setHandleKeyFunction(onEnter);
  }

  void setFocus(FocusNode focus){
    this.focus = focus;
  }

  void adicionarItemAFila(String? codigo) {
    if (codigo == null) return;
    filaLeituras.add(codigo);
  }

  void sendMessage(ProcessoLeituraMontagemModel leitura) {
    webSocket?.sendMessage(leitura);
  }

  Future<String?> getComputerNameIfWindows() async {
    if (kIsWeb) return null;
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    switch (defaultTargetPlatform) {
      case TargetPlatform.windows:
        return _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
      default:
        return null;
    }
  }

  String _readWindowsDeviceInfo(WindowsDeviceInfo data) => data.computerName;

  Future fecharTela(BuildContext context) async {
    int? tempoMinTela = state.processo.leituraAtual.instituicao?.tempoMin;
    if (tempoMinTela == null) return;
    if (dataUltimaLeitura == null) return;
    int tempoUltimaLeitura =
        DateTime.now().difference(dataUltimaLeitura!).inMinutes;
    int tempoFechamento = tempoMinTela - tempoUltimaLeitura;
    if (tempoFechamento > 15) {
      aviso15MinutosApareceu = false;
    }
    if (tempoFechamento > 5) {
      aviso5MinutosApareceu = false;
    }
    if (tempoFechamento <= 15 && aviso15MinutosApareceu != true) {
      aviso15MinutosApareceu = true;
      await abrirTelaFechamento(
        tempoFechamento: 15,
        context: context,
      );
    }
    if (tempoFechamento <= 5 && aviso5MinutosApareceu != true) {
      aviso5MinutosApareceu = true;
      await abrirTelaFechamento(
        tempoFechamento: 5,
        context: context,
      );
    }
    if (tempoFechamento <= 0) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      ProcessoNavigatorService.ToUserScreen();
    }
  }

  Future abrirTelaFechamento({
    required int tempoFechamento,
    required BuildContext context,
  }) async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageCloseScreenPage(
          tempoFecharTela: tempoFechamento,
        );
      },
    );
  }

  Future readCode(
    String? codigoLido, {
    bool pularAdicaoFilaLeituras = false,
  }) async {
    if (codigoLido == null || codigoLido.isEmpty || codigoLido.length <= 2) {
      return;
    }
    dataUltimaLeitura = DateTime.now();
    try {
      if (loadingController.isOpen && pularAdicaoFilaLeituras == false) {
        adicionarItemAFila(codigoLido);
        return;
      }
      if (validateZoom(codigoLido)) return;
      emitLoading();
      if (state.processo.maquina == null) {
        String? maquina = await getComputerNameIfWindows();
        state.processo.maquina = maquina;
      }
      sendMessage(
        ProcessoLeituraMontagemModel(
          cancelado: null,
          maquina: state.processo.maquina,
          cod: state.processo.cod,
          dataHora: state.processo.dataHora,
          tstamp: state.processo.tstamp,
          versao: Version.ACTUAL,
          leituraCodigo: ProcessoLeituraCodigoModel(
            codigoLido: codigoLido,
            avisosSonoro: [],
            alertaVermelho: null,
            cancelarLeituras: null,
            leituraFinalizada: null,
            tipoAlerta: null,
            fecharTelaExtra: null,
          ),
          leituraAtual: state.processo.leituraAtual,
          filaLeituras: state.processo.filaLeituras,
          automaticReadings: state.processo.automaticReadings,
          passos: state.processo.passos,
        ),
      );
    } on Exception catch (ex) {
      closeLoading();
      emit(
        ProcessoLeituraState(
          processo: state.processo,
          aviso: ex.toString(),
        ),
      );
    }
  }

  void setException(String error, CommandResultAlertType? alertType) {
    closeLoading();
    if (alertType == null || alertType == CommandResultAlertType.Error) {
      ErrorUtils.showErrorDialog(null, [
        'ERRO: ' + error,
      ]);
      return;
    }
    if (alertType == CommandResultAlertType.Warning) {
      WarningUtils.showWarningDialog(
        null,
        error,
      );
    }
  }

  Future onMessage(
    (String, ProcessoLeituraMontagemModel)? result,
    BuildContext context,
  ) async {
    if (result == null) return;

    bool leiturasCanceladas = cancelReadings(result.$2, result.$1, context);
    if (leiturasCanceladas) return;

    bool leituraFinalizada = endReading(result.$2, result.$1, context);
    if (leituraFinalizada) return;

    if (first) {
      await WindowManagerHelper.setTitle(
        result.$2.leituraAtual.instituicao?.nome,
      );
    }
    first = false;

    if (result.$2.leituraAtual.decisao != null) filaLeituras.clear();
    if (filaLeituras.isNotEmpty) {
      String lastCode = filaLeituras.removeAt(0);
      state.processo = result.$2;
      state.aviso = result.$1;
      await readCode(lastCode, pularAdicaoFilaLeituras: true);
      return;
    }
    closeLoading();

    fecharTelaExtra(result.$2, context);

    emit(
      ProcessoLeituraState(
        processo: result.$2,
        aviso: result.$1,
      ),
    );
  }

  void fecharTelaExtra(
    ProcessoLeituraMontagemModel state,
    BuildContext context,
  ) {
    if (state.leituraCodigo.fecharTelaExtra == true) {
      Navigator.of(context).pop();
    }
  }

  void updateLastRefreshTimeOfReading(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (loadingController.isOpen) return;
    if (processoLeitura.cod == null ||
        processoLeitura.leituraAtual.usuario?.cod == null) return;
    ProcessoLeituraAndamentoService andamentoService =
        ProcessoLeituraAndamentoService();
    andamentoService.disableThrowException();
    ProcessoLeituraAndamentoModel andamento =
        ProcessoLeituraAndamentoModel.atualizarRefreshTimeDTO(
      cod: processoLeitura.cod!,
      codUsuario: processoLeitura.leituraAtual.usuario!.cod!,
    );
    andamentoService.atualizarTempoUltimaAtualizaoLeituraAndamento(andamento);
  }

  bool validateZoom(String? codigoLido) {
    if (codigoLido == null) return false;
    if (state.processo.leituraAtual.instituicao == null) return false;
    InstituicaoModel instituicao = state.processo.leituraAtual.instituicao!;
    String codigo = ProcessoLeituraAcaoModel.zoomCode.toString() +
        instituicao.cod.toString().padLeft(3, '0');
    if (!codigoLido.startsWith(codigo)) return false;
    emit(
      ProcessoLeituraState(
        processo: state.processo,
        rebuildType: ProcessoLeituraRebuildType.Zoom,
      ),
    );
    return true;
  }

  bool cancelReadings(
    ProcessoLeituraMontagemModel processo,
    String? aviso,
    BuildContext context,
  ) {
    bool? cancelarLeituras = processo.leituraCodigo.cancelarLeituras;
    if (cancelarLeituras == true) {
      closeLoading();
      fecharTelaExtra(processo, context);
      List<int> avisosSonoro = processo.leituraCodigo.avisosSonoro;
      processo = ProcessoLeituraMontagemModel.empty();
      processo.leituraCodigo.avisosSonoro = avisosSonoro;
      emit(
        ProcessoLeituraState(
          processo: processo,
          aviso: aviso,
          cancelouLeitura: true,
        ),
      );
      return true;
    }
    return false;
  }

  bool endReading(
    ProcessoLeituraMontagemModel processo,
    String? aviso,
    BuildContext context,
  ) {
    bool? leituraFinalizada = processo.leituraCodigo.leituraFinalizada;
    if (leituraFinalizada == true) {
      closeLoading();
      fecharTelaExtra(processo, context);
      List<int> avisosSonoro = processo.leituraCodigo.avisosSonoro;
      processo = ProcessoLeituraMontagemModel.empty();
      processo.leituraCodigo.avisosSonoro = avisosSonoro;
      emit(
        ProcessoLeituraState(
          processo: processo,
          aviso: aviso,
          finalizouLeitura: true,
        ),
      );
      return true;
    }
    return false;
  }

  void reset() {
    // removeReadingInProcess(state.processo);
    emit(
      ProcessoLeituraState(
        processo: ProcessoLeituraMontagemModel.empty(),
      ),
    );
  }

  void clearReadings(ProcessoLeituraMontagemModel processo) {
    ProcessoLeituraMontagemModel novaLeitura =
        ProcessoLeituraMontagemModel.empty();
    novaLeitura.leituraCodigo.avisosSonoro =
        processo.leituraCodigo.avisosSonoro;
    emit(
      ProcessoLeituraState(
        processo: processo,
        aviso: state.aviso,
      ),
    );
  }

  Future readManualCode(String codigoLido) async {
    state.processo.automaticReadings = false;
    await readCode(codigoLido);
  }

  Future readActionCode(int codigoLido) async {
    state.processo.automaticReadings = false;
    if (state.processo.leituraAtual.instituicao == null) return;
    LocalMixin? local = state.processo.local;
    InstituicaoModel instituicao = state.processo.leituraAtual.instituicao!;
    ProcessoLeituraAcaoModel acao =
        ProcessoLeituraAcaoModel.getActionFromCodeBase(codigoLido);

    if (acao.precisaConterLocal && local?.codBarra == null) return;
    String codigo =
        codigoLido.toString() + instituicao.cod.toString().padLeft(3, '0');

    if (acao.precisaConterLocal) codigo += local!.codBarra!.substring(6);
    await readCode(codigo);
  }

  Future readPriority(int codigoLido) async {
    state.processo.automaticReadings = false;
    if (codigoLido == 0) return;
    if (state.processo.leituraAtual.instituicao == null ||
        state.processo.local == null) return;
    LocalMixin local = state.processo.local!;
    InstituicaoModel instituicao = state.processo.leituraAtual.instituicao!;
    if (local.codBarra == null) return;
    String codigo = codigoLido.toString() +
        instituicao.cod.toString().padLeft(3, '0') +
        local.codBarra!.substring(6);
    await readCode(codigo);
  }

  void toogleSelectedKit(KitProcessoModel kit) {
    bool selecionado = !(kit.selecionado == true);
    for (KitProcessoModel kitProcesso in state.processo.leituraAtual.kits) {
      if (kitProcesso.selecionado == true) kitProcesso.selecionado = false;
      if (kitProcesso.cod == kit.cod) kitProcesso.selecionado = selecionado;
    }
    emit(
      ProcessoLeituraState(
        processo: state.processo,
        aviso: state.aviso,
        rebuildType: ProcessoLeituraRebuildType.Kit,
      ),
    );
    focus.requestFocus();
  }

  void toogleStatusKit(KitProcessoModel kit, int status) {
    KitProcessoModel? kitProcesso = state.processo.leituraAtual.kits
        .where((element) => element.cod == kit.cod)
        .firstOrNull;
    if (kitProcesso == null) return;
    if (kitProcesso.statusExpandidos == null) kitProcesso.statusExpandidos = [];
    if (kitProcesso.statusExpandidos!.contains(status)) {
      kitProcesso.statusExpandidos!.remove(status);
    } else {
      kitProcesso.statusExpandidos!.add(status);
    }
    emit(
      ProcessoLeituraState(
        processo: state.processo,
        aviso: state.aviso,
        rebuildType: ProcessoLeituraRebuildType.Kit,
      ),
    );
    focus.requestFocus();
  }

  Future showKit(KitProcessoModel kit) async {
    ProcessoLeituraMontagemModel montagem = state.processo;
    if (kit.cod == null) return;
    int? decisao = montagem.leituraAtual.decisao;
    montagem.leituraAtual.selecaoKitItem = SelecaoKitItemModel(
      cod: kit.cod!,
      tipoSelecao: TipoSelecao.Kit,
      decisao: decisao,
      mensagem: state.aviso,
    );
    montagem.leituraAtual.decisao = DecisaoEnum.SelecionouKitItemLista;
    await readCode('SELECAOKIT');
    focus.requestFocus();
  }

  Future showItem(ItemProcessoModel item) async {
    ProcessoLeituraMontagemModel montagem = state.processo;
    if (item.cod == null) return;
    int? decisao = montagem.leituraAtual.decisao;
    montagem.leituraAtual.selecaoKitItem = SelecaoKitItemModel(
      cod: item.cod!,
      tipoSelecao: TipoSelecao.Item,
      decisao: decisao,
      mensagem: state.aviso,
    );
    montagem.leituraAtual.decisao = DecisaoEnum.SelecionouKitItemLista;
    await readCode('SELECAOITEM');
    focus.requestFocus();
  }

  void emitLoading() {
    if (loadingController.isOpen) return;
    loadingController.show(null);
  }

  void closeLoading() => loadingController.closeDefault();

  Future readReadings(List<String> readings) async {
    state.processo.automaticReadings = true;
    state.processo.filaLeituras = [];
    state.processo.filaLeituras!.addAll(readings.reversed);
    String code = state.processo.filaLeituras!.removeLast();
    await readCode(code);
  }
}

class ProcessoLeituraState {
  ProcessoLeituraMontagemModel processo;
  String? aviso;
  ProcessoLeituraRebuildType rebuildType;
  bool loading;
  bool cancelouLeitura;
  bool finalizouLeitura;

  ProcessoLeituraState({
    required this.processo,
    this.rebuildType = ProcessoLeituraRebuildType.All,
    this.aviso,
    this.loading = false,
    this.cancelouLeitura = false,
    this.finalizouLeitura = false,
  });
}

enum ProcessoLeituraRebuildType {
  All,
  Kit,
  Loading,
  Zoom,
}
