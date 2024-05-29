import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:flutter/material.dart';

class QuantidadeIndicadoresPageFrm extends StatefulWidget {
  const QuantidadeIndicadoresPageFrm({
    Key? key,
  }) : super(key: key);

  @override
  State<QuantidadeIndicadoresPageFrm> createState() =>
      _QuantidadeIndicadoresPageFrmState();
}

class _QuantidadeIndicadoresPageFrmState
    extends State<QuantidadeIndicadoresPageFrm> {
  _QuantidadeIndicadoresPageFrmState();
  int? quantidadeIndicadores = 10;

  late final TextFieldNumberWidget txtQuantidadeIndicadores =
      TextFieldNumberWidget(
    placeholder: 'Quantidade',
    startValue: quantidadeIndicadores,
    onChanged: (String str) {
      quantidadeIndicadores = str.isEmpty ? null : int.parse(str);
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: const EdgeInsets.all(8.0),
      titlePadding: const EdgeInsets.all(8.0),
      actionsPadding: const EdgeInsets.all(8.0),
      title: Row(
        children: [
          const TitleWidget(
            text: 'Impressão - Quantidade de Indicadores',
          ),
          const Spacer(),
          CloseButtonWidget(
            onPressed: () => Navigator.of(context).pop((false, null)),
          ),
        ],
      ),
      content: Container(
        constraints: const BoxConstraints(
          minWidth: 300,
          minHeight: 300,
          maxHeight: 500,
          maxWidth: 500,
        ),
        height: size.height * 0.5,
        width: size.width * 0.5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: txtQuantidadeIndicadores,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SaveButtonWidget(
                onPressed: () =>
                    {Navigator.of(context).pop((true, quantidadeIndicadores))},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CancelButtonUnfilledWidget(
                onPressed: () =>
                    {Navigator.of(context).pop((false, quantidadeIndicadores))},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
