import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:flutter/material.dart';

class ProcessoPageArsenalLocalizationDialog extends StatefulWidget {
  const ProcessoPageArsenalLocalizationDialog({
    required this.processoLeitura,
    Key? key,
  });

  final ProcessoLeituraMontagemModel processoLeitura;

  @override
  State<ProcessoPageArsenalLocalizationDialog> createState() =>
      _ProcessoPageArsenalLocalizationDialogDialogState();
}

class _ProcessoPageArsenalLocalizationDialogDialogState
    extends State<ProcessoPageArsenalLocalizationDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Selecionar localização de estoque'),
      content: Container(
        height: size.height * .4,
        width: size.width * .4,
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: const Text(
                    'Arsenal',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.processoLeitura.leituraAtual.estoque?.nome ??
                        'Estoque sem nome',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomCheckboxWidget(
                    align: MainAxisAlignment.start,
                    text:
                        'Lembrar a seleção desta Localização para todos os Itens',
                    checked: false,
                    onClick: selecionarLembraLocalizacao,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            Row(
              children: [
                Expanded(
                  child: DropDownSearchWidget<LocalizacaoArsenalModel>(
                    expandOnStart: true,
                    textFunction: (item) => item.local ?? 'Sem local',
                    initialValue: null,
                    sourceList: widget
                            .processoLeitura.leituraAtual.estoque?.locaisArs
                            ?.where((element) => element.ativo == true)
                            .toList() ??
                        [],
                    onChanged: trocarLocalizacao,
                    placeholder: 'Localização',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        InsertButtonWidget(
          onPressed: selecionarMotivo,
        ),
        CancelButtonUnfilledWidget(
          onPressed: cancelarSelecao,
        ),
      ],
    );
  }

  void trocarLocalizacao(LocalizacaoArsenalModel? localizacao) {
    if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoItem) {
      widget.processoLeitura.leituraAtual.localizacaoEstoque
          .codLocalizacaoItem = localizacao?.cod;
    } else if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoKit) {
      widget.processoLeitura.leituraAtual.localizacaoEstoque.codLocalizacaoKit =
          localizacao?.cod;
    }
  }

  void selecionarLembraLocalizacao(bool value) {
    if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoItem) {
      widget.processoLeitura.leituraAtual.localizacaoEstoque
          .utilizarLocalizacaoItens = value;
    } else if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoKit) {
      widget.processoLeitura.leituraAtual.localizacaoEstoque
          .utilizarLocalizacaoKits = value;
    }
  }

  void cancelarSelecao() {
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.DefinirLocalizacaoCancela;
    Navigator.of(context).pop();
  }

  void selecionarMotivo() {
    if (!_validaCampos()) return;
    if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoItem) {
      widget.processoLeitura.leituraAtual.decisao =
          DecisaoEnum.DefinirLocalizacaoConfirmaItem;
    } else if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoKit) {
      widget.processoLeitura.leituraAtual.decisao =
          DecisaoEnum.DefinirLocalizacaoConfirmaItem;
    }
    Navigator.of(context).pop();
  }

  bool _validaCampos() {
    int? local;
    if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoItem) {
      local = widget
          .processoLeitura.leituraAtual.localizacaoEstoque.codLocalizacaoItem;
    } else if (widget.processoLeitura.leituraAtual.decisao ==
        DecisaoEnum.DefinirLocalizacaoKit) {
      local = widget
          .processoLeitura.leituraAtual.localizacaoEstoque.codLocalizacaoKit;
    }
    if (local == null) {
      ToastUtils.showCustomToastError(context, 'Selecione uma localização');
      return false;
    }
    return true;
  }
}
