import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/etiqueta_lida_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/trocar_etiqueta_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/page/widgets/etiqueta_lida_widget.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';

import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class TrocarEtiquetaPageWidget extends StatelessWidget {
  const TrocarEtiquetaPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColetoresHelper coletorHelper = ColetoresHelper(
      onEnter: (str) => context.read<EtiquetaLidaCubit>().setEtiqueta(
            str,
            context,
          ),
    );
    final FocusNode focusNode = FocusNode();
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const Row(
        children: [
          const TitleWidget(text: 'Trocar etiqueta item'),
        ],
      ),
      content: RawKeyboardListener(
        onKey: coletorHelper.handleKey,
        autofocus: true,
        focusNode: focusNode,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 600,
            maxWidth: 800,
            maxHeight: 700,
            minHeight: 400,
          ),
          height: size.height * .5,
          width: size.width * .5,
          child: const Column(
            children: [
              const Text('Leia a nova etiqueta do Item'),
              const Padding(padding: EdgeInsets.only(top: 4)),
              EtiquetaLidaWidget(),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            BarcodeWidget(
              data: 'Cancelar',
              barcode: Barcode.dataMatrix(),
              height: 30,
              width: 30,
            ),
            const Padding(padding: EdgeInsets.only(left: 8)),
            CancelButtonUnfilledWidget(
              onPressed: () => Navigator.of(context).pop((false, '', null)),
            ),
            const Spacer(),
            BarcodeWidget(
              data: 'Confirmar',
              barcode: Barcode.dataMatrix(),
              height: 30,
              width: 30,
            ),
            const Padding(padding: EdgeInsets.only(left: 8)),
            ConfirmButtonWidget(
              onPressed: () =>
                  context.read<TrocarEtiquetaCubit>().trocarEtiqueta(
                        context,
                      ),
            ),
          ],
        ),
      ],
    );
  }
}
