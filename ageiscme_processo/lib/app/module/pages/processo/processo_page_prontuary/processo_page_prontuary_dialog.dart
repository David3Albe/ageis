import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/local_instituicao_cubit.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/models/usuario_processo/usuario_processo_model.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageProntuaryDialog extends StatefulWidget {
  const ProcessoPageProntuaryDialog({required this.processoLeitura, Key? key});

  final ProcessoLeituraMontagemModel processoLeitura;

  @override
  State<ProcessoPageProntuaryDialog> createState() =>
      _ProcessoPageProntuaryDialogState();
}

class _ProcessoPageProntuaryDialogState
    extends State<ProcessoPageProntuaryDialog> {
  late final LocalInstituicaoCubit localInstituicaoCubit;
  late final ColetoresHelper coletorHelper = ColetoresHelper(
    onEnter: handleKey,
  );
  FocusNode _textNode = FocusNode();
  FocusNode _observationNode = FocusNode();

  @override
  void initState() {
    localInstituicaoCubit = LocalInstituicaoCubit();
    localInstituicaoCubit.loadAll();
    super.initState();
  }

  @override
  void dispose() {
    localInstituicaoCubit.close();
    super.dispose();
  }

  Future handleKey(String barCode) async {
    if (barCode.startsWith('999')) {
      InserirProntuario(barCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RawKeyboardListener(
      onKey: coletorHelper.handleKey,
      focusNode: _textNode,
      child: AlertDialog(
        titlePadding: const EdgeInsets.all(16),
        actionsPadding: const EdgeInsets.all(16),
        contentPadding: const EdgeInsets.all(16),
        title: const TitleWidget(text: 'Registro de Prontuário'),
        content: Container(
          constraints: BoxConstraints(
            minHeight: size.height * 0.4,
            minWidth: size.width * .4,
          ),
          child: Column(
            children: [
              DropDownWidget<UsuarioProcessoModel>(
                initialValue: widget.processoLeitura.leituraAtual.circulante,
                sourceList: [widget.processoLeitura.leituraAtual.circulante!],
                placeholder: 'Circulante',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4),
              ),
              BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
                bloc: localInstituicaoCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(child: LoadingWidget());
                  }
                  List<LocalInstituicaoModel> locais = state.locais;
                  LocalInstituicaoModel? local = locais
                      .where(
                        (element) =>
                            element.cod ==
                            widget.processoLeitura.leituraAtual.local!.cod,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<LocalInstituicaoModel>(
                    initialValue: local,
                    sourceList: locais,
                    onChanged: (value) =>
                        widget.processoLeitura.leituraAtual.local = value,
                    placeholder: 'Local de Origem ou Destino',
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4),
              ),
              TextFieldStringWidget(
                autoFocus: true,
                onEditComplete: () {
                  String? prontuario = widget.processoLeitura.leituraAtual
                      .processoDetalheRegistro!.prontuarioRetirada;
                  if (prontuario == null) return;
                  if (prontuario.contains('999')) {
                    _textNode.requestFocus();
                    return;
                  }
                  _observationNode.requestFocus();
                },
                onTapOutside: (event) => _textNode.requestFocus(),
                placeholder: 'Número do Prontuário',
                onChanged: (str) => widget.processoLeitura.leituraAtual
                    .processoDetalheRegistro!.prontuarioRetirada = str,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4),
              ),
              TextFieldStringAreaWidget(
                focus: _observationNode,
                onEditComplete: () => _textNode.requestFocus(),
                onTapOutside: (event) => _textNode.requestFocus(),
                placeholder: 'Observação',
                onChanged: (str) => widget.processoLeitura.leituraAtual
                    .processoDetalheRegistro!.observacao = str,
              ),
            ],
          ),
        ),
        actions: [
          InsertButtonWidget(
            onPressed: () => InserirProntuario(null),
          ),
          CancelButtonUnfilledWidget(
            onPressed: cancelarLeituraProntuario,
          ),
        ],
      ),
    );
  }

  void cancelarLeituraProntuario() {
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.MontagemProntuarioCancelada;
    Navigator.of(context).pop();
  }

  void InserirProntuario(String? removerDoCodigo) {
    if (!_validaCampos()) return;
    removerCodigo(removerDoCodigo);
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.MontagemProntuarioConfirmada;
    Navigator.of(context).pop();
  }

  void removerCodigo(String? removerDoCodigo) {
    if (removerDoCodigo == null) return;
    String? textoObservacao =
        widget.processoLeitura.leituraAtual.processoDetalheRegistro!.observacao;
    String? textoProntuario = widget.processoLeitura.leituraAtual
        .processoDetalheRegistro!.prontuarioRetirada;
    if (textoObservacao != null) {
      widget.processoLeitura.leituraAtual.processoDetalheRegistro!.observacao =
          textoObservacao.replaceAll(textoObservacao, removerDoCodigo);
    }
    if (textoProntuario != null) {
      widget.processoLeitura.leituraAtual.processoDetalheRegistro!
              .prontuarioRetirada =
          textoProntuario.replaceAll(textoProntuario, removerDoCodigo);
    }
  }

  bool _validaCampos() {
    if (widget.processoLeitura.leituraAtual.local == null) {
      ToastUtils.showCustomToastWarning(context, 'Selecione um local');
      return false;
    }
    return true;
  }
}
