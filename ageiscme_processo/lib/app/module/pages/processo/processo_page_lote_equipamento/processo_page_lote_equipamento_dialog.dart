import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:flutter/material.dart';

class ProcessoPageLoteEquipamentoDialog extends StatefulWidget {
  const ProcessoPageLoteEquipamentoDialog({
    required this.processoLeitura,
    Key? key,
  });

  final ProcessoLeituraMontagemModel processoLeitura;

  @override
  State<ProcessoPageLoteEquipamentoDialog> createState() =>
      _ProcessoPageLoteEquipamentoDialogState();
}

class _ProcessoPageLoteEquipamentoDialogState
    extends State<ProcessoPageLoteEquipamentoDialog> {
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
      title: const TitleWidget(text: 'Informe o lote do equipamento'),
      content: Container(
        constraints: const BoxConstraints(
          minHeight: 500,
          minWidth: 500,
        ),
        width: size.width * 0.5,
        height: size.height * 0.5,
        child: Column(
          children: [
            TextFieldStringWidget(
              placeholder: 'Lote',
              onChanged: (str) => widget
                  .processoLeitura.leituraAtual.loteEquipamento.codLote = str,
            ),
          ],
        ),
      ),
      actions: [
        InsertButtonWidget(
          onPressed: inserirLote,
        ),
        CancelButtonUnfilledWidget(
          onPressed: cancelaLote,
        ),
      ],
    );
  }

  void cancelaLote() {
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.CancelaInformaLoteEquipamento;
    Navigator.of(context).pop();
  }

  void inserirLote() {
    if (!_validaCampos()) return;
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.ConfirmaInformaLoteEquipamento;
    Navigator.of(context).pop();
  }

  bool _validaCampos() {
    String? codLote =
        widget.processoLeitura.leituraAtual.loteEquipamento.codLote;
    if (codLote == null || codLote.trim().isEmpty) {
      ToastUtils.showCustomToastWarning(context, 'O Loté é obrigátorio');
      return false;
    } else if (codLote.length > 20) {
      ToastUtils.showCustomToastWarning(
        context,
        'O Lote pode conter até 20 Letras',
      );
      return false;
    }
    return true;
  }
}
