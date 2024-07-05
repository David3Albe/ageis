import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/motivo_remover_repor_item/motivo_remover_repor_item.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm_adicionar_item/kit_page_frm_adicionar_item_controller.dart';
import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/models/kit/kit_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';

import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';
import 'package:dependencias_comuns/provider_export.dart';

class KitPageFrmAdicionarItemPage extends StatefulWidget {
  const KitPageFrmAdicionarItemPage({
    required this.kit,
    Key? key,
  }) : super(key: key);

  final KitModel? kit;
  @override
  State<KitPageFrmAdicionarItemPage> createState() =>
      _KitPageFrmAdicionarItemPageState();
}

class _KitPageFrmAdicionarItemPageState
    extends State<KitPageFrmAdicionarItemPage> {
  late final KitPageFrmAdicionarItemController _controller;
  late final MotivoRemoverReporItemCubit processoMotivoCubit;
  @override
  void initState() {
    _controller = KitPageFrmAdicionarItemController(
      context: context,
      itens: widget.kit?.itens ?? [],
    );
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
      title: const TitleWidget(text: 'Adicionar Itens no Kit'),
      content: KeyboardListener(
        onKeyEvent: _controller.coletorHelper.handleKey,
        autofocus: true,
        focusNode: _controller.textNode,
        child: ChangeNotifierProvider<KitPageFrmAdicionarItemController>.value(
          value: _controller,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 500,
              maxWidth: 600,
              maxHeight: 600,
              minHeight: 500,
            ),
            height: size.height * .5,
            width: size.width * .5,
            child: Column(
              children: [
                const Text(
                  'Leia a etiqueta dos Itens que deseja adicionar no kit',
                ),
                Consumer<KitPageFrmAdicionarItemController>(
                  builder: (context, value, child) {
                    if (value.itens.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: LoadingWidget(),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                        ),
                        const Text('Itens Lidos'),
                        const Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                        ),
                        ListFieldWidget<ItemModel>(
                          onRemove: (item) => _controller.removeItem(item.cod!),
                          sourceList: value.itens,
                          removeButton: true,
                          onItemSelected: (value) {},
                          itemText: (value) =>
                              '${value.descricao}, ${value.idEtiqueta}',
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
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
            const Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            CancelButtonUnfilledWidget(
              onPressed: () => _controller.cancelarAdicao(context),
            ),
            const Spacer(),
            BarcodeWidget(
              data: 'Confirmar',
              barcode: Barcode.dataMatrix(),
              height: 30,
              width: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            ConfirmButtonWidget(
              onPressed: () => _controller.confirmarLeituras(context),
            ),
          ],
        ),
      ],
    );
  }
}
