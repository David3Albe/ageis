import 'dart:async';

import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/enums/tipo_alerta.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageWarningController extends ChangeNotifier
    implements Disposable {
  static const Color COR_PISCADA_PADRAO = const Color(0xffBFC3DA);
  static const Color COR_TEXTO_VERMELHO = Color.fromARGB(200, 255, 0, 0);
  static const Color COR_TEXTO_LARANJA = Color.fromARGB(200, 228, 99, 0);
  static const Color COR_TEXTO_AMARELO = Color.fromARGB(200, 255, 255, 0);
  static const Color COR_TEXTO_PRETO = Cores.CorTextCards;
  static const Color COR_FUNDO_PRETO = Cores.CorCards;
  static const Color COR_FUNDO_VERMELHO = const Color(0xffBFC3DA);
  static const Color COR_FUNDO_AMARELO = COR_FUNDO_PRETO;

  Color? corTexto;
  Color? corFundo;
  bool mostrarMensagem = true;

  Timer? timerOcultaMensagem;

  void ocultaMensagem() {
    mostrarMensagem = false;
    notifyListeners();
  }

  void reiniciarTimerMensagem(ProcessoLeituraState state) {
    mostrarMensagem = true;
    timerOcultaMensagem?.cancel();
    int? tempoOcultarMensagem = buscarTempoOcultaMensagem(state);
    if (tempoOcultarMensagem == null) return;
    timerOcultaMensagem = Timer(const Duration(seconds: 10), () {
      ocultaMensagem();
      setDefaultColor();
    });
  }

  int? buscarTempoOcultaMensagem(ProcessoLeituraState state) {
    switch (state.processo.leituraAtual.decisao) {
      case DecisaoEnum.DeterminarPriodade:
      case DecisaoEnum.ConfirmarUsoEPCEntrada:
      case DecisaoEnum.ConfirmarUsoEPCSaida:
      case DecisaoEnum.DefinirUsuarioCirculante:
      case DecisaoEnum.DefinirLocalOrigemDestino:
      case DecisaoEnum.DefineExistemKitsItensNaoConforme:
      case DecisaoEnum.ExistemItensNaoConforme:
      case DecisaoEnum.ItemNaoConforme:
      case DecisaoEnum.ExistemKitsNaoConforme:
      case DecisaoEnum.KitNaoConforme:
      case DecisaoEnum.AutorizarQuebraFluxo:
      case DecisaoEnum.DefinirTipoEmbalagemItemZ:
      case DecisaoEnum.DefinirUsoCalculadora:
      case DecisaoEnum.DefinirEmbalagemGeralItem:
      case DecisaoEnum.DefinirEmbalagemGeralKit:
      case DecisaoEnum.DefinirSeIraUsarAMesmaEmbalagemParaTodosItens:
      case DecisaoEnum.DefinirSeIraUsarAMesmaEmbalagemParaTodosKits:
      case DecisaoEnum.DefinirTipoEmbalagemItem:
      case DecisaoEnum.DefinirTipoEmbalagemKit:
      case DecisaoEnum.SolicitaIntegradorKit:
      case DecisaoEnum.RealizarConferenciaVisual:
      case DecisaoEnum.ProsseguirKitImcompleto:
      case DecisaoEnum.AutorizarKitImcompleto:
      case DecisaoEnum.RegistrarIndicador:
      case DecisaoEnum.RegistrarBiologico:
      case DecisaoEnum.ImprimirMaisEtiquetasLote:
      case DecisaoEnum.ImprimirMaisEtiquetasPreparo:
      case DecisaoEnum.ImprimirRelatorioRetirada:
      case DecisaoEnum.DefinirItemDataMatrixDanificado:
      case DecisaoEnum.ProsseguirDatamatrixDanificado:
      case DecisaoEnum.TomarDecisaoAcaoItem:
      case DecisaoEnum.TomarDecisaoAcaoKit:
      case DecisaoEnum.AutorizarAcaoOcorrencias:
      case DecisaoEnum.EquipamentoComRestricaoContinuar:
        return null;
      default:
        return 10;
    }
  }

  void reiniciaTimerCor(ProcessoLeituraState state) {
    setColor(state);
  }

  void setColor(ProcessoLeituraState state) {
    if (state.aviso == null || state.aviso!.isEmpty==true) {
      corTexto = COR_TEXTO_PRETO;
      corFundo = COR_FUNDO_PRETO;
      notifyListeners();
      return;
    }
    TipoAlerta? tipoAlerta = state.processo.leituraCodigo.tipoAlerta;
    switch (tipoAlerta) {
      case TipoAlerta.Vermelho:
        corTexto = COR_TEXTO_PRETO;
        corFundo = COR_TEXTO_VERMELHO;
        break;
      case TipoAlerta.Laranja:
        corTexto = COR_TEXTO_PRETO;
        corFundo = COR_TEXTO_LARANJA;
        break;
      case TipoAlerta.Amarelo:
        corTexto = COR_TEXTO_PRETO;
        corFundo = COR_TEXTO_AMARELO;
        break;
      default:
        corTexto = COR_TEXTO_PRETO;
        corFundo = COR_FUNDO_PRETO;
    }

    notifyListeners();
  }

  void setDefaultColor() {
    corFundo = COR_FUNDO_PRETO;
    notifyListeners();
  }

  @override
  void dispose() {
    timerOcultaMensagem?.cancel();
    super.dispose();
  }
}
