import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/acao_ocorrencia_cubit.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/enums/tipo_motivo_ocorrencias.dart';
import 'package:ageiscme_processo/app/module/models/define_acao_ocorrencia/define_acao_ocorrencia_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageActionComplianceDialog extends StatefulWidget {
  const ProcessoPageActionComplianceDialog({
    required this.processoLeitura,
    Key? key,
  });

  final ProcessoLeituraMontagemModel processoLeitura;

  @override
  State<ProcessoPageActionComplianceDialog> createState() =>
      _ProcessoPageActionComplianceDialogDialogState();
}

class _ProcessoPageActionComplianceDialogDialogState
    extends State<ProcessoPageActionComplianceDialog> {
  late final AcaoOcorrenciaCubit acaoOcorrenciaCubit;
  AcaoOcorrenciaModel? motivo;
  late DefineAcaoOcorrenciaModel defineAcaoOcorrencia;

  @override
  void initState() {
    acaoOcorrenciaCubit = AcaoOcorrenciaCubit();
    acaoOcorrenciaCubit.loadAll();
    defineAcaoOcorrencia =
        widget.processoLeitura.leituraAtual.defineAcaoOcorrencia!;
    super.initState();
  }

  @override
  void dispose() {
    acaoOcorrenciaCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Ação de ocorrência'),
      content: Container(
        height: size.height * .4,
        width: size.width * .4,
        child: Column(
          children: [
            BlocBuilder<AcaoOcorrenciaCubit, AcaoOcorrenciaState>(
              bloc: acaoOcorrenciaCubit,
              builder: (context, state) {
                if (state.loading) return const Center(child: LoadingWidget());
                List<AcaoOcorrenciaModel> motivos = state.motivos.toList();
                bool Function(AcaoOcorrenciaModel) query;
                if (defineAcaoOcorrencia.tipoMotivo ==
                    TipoMotivoOcorrencias.AcaoOcorrencias) {
                  query = (AcaoOcorrenciaModel element) =>
                      element.acaoCorretiva == true;
                } else {
                  query = (AcaoOcorrenciaModel element) =>
                      element.motivoNaoCorrecao == true;
                }
                motivos = motivos.where(query).toList();

                return DropDownSearchWidget<AcaoOcorrenciaModel>(
                  expandOnStart: true,
                  textFunction: (item) => item.AcaoOcorrenciaDescricaoText(),
                  initialValue: null,
                  sourceList: motivos,
                  onChanged: (value) {
                    motivo = value;
                  },
                  placeholder: 'Motivo',
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        InsertButtonWidget(
          onPressed: () => selecionarMotivo(context),
        ),
        CancelButtonUnfilledWidget(
          onPressed: () => cancelarSelecao(context),
        ),
      ],
    );
  }

  void cancelarSelecao(BuildContext context) {
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.CancelaAcaoMotivoNaoConformidade;
    processoCubit.readCode('IGNORAR');
    Navigator.of(context).pop();
  }

  void selecionarMotivo(BuildContext context) {
    if (!_validaCampos(context)) return;
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    defineAcaoOcorrencia.codMotivo = motivo?.cod;
    widget.processoLeitura.leituraAtual.adicionarMotivoAcaoOcorrencia(motivo);
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.ConfirmaAcaoMotivoNaoConformidade;
    processoCubit.readCode('IGNORAR');
    Navigator.of(context).pop();
  }

  bool _validaCampos(BuildContext context) {
    if (motivo == null) {
      ToastUtils.showCustomToastError(context, 'Selecione um motivo');
      return false;
    }
    return true;
  }
}
