import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/motivo_remover_repor_item/motivo_remover_repor_item.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm_remover_item/kit_page_frm_remover_item_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';

import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class KitPageFrmRemoverItemPage extends StatefulWidget {
  const KitPageFrmRemoverItemPage({
    Key? key,
    required this.kit,
  }) : super(key: key);

  final KitModel kit;

  @override
  State<KitPageFrmRemoverItemPage> createState() =>
      _KitPageFrmRemoverItemPageState();
}

class _KitPageFrmRemoverItemPageState extends State<KitPageFrmRemoverItemPage> {
  late final KitPageFrmRemoverItemController _controller;
  late final MotivoRemoverReporItemCubit processoMotivoCubit;
  @override
  void initState() {
    processoMotivoCubit = MotivoRemoverReporItemCubit();
    processoMotivoCubit.loadAll();
    _controller = KitPageFrmRemoverItemController(
      kit: widget.kit,
      context: context,
    );

    super.initState();
  }

  @override
  void dispose() {
    processoMotivoCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Remover Item do Kit'),
      content: RawKeyboardListener(
        onKey: _controller.coletorHelper.handleKey,
        autofocus: true,
        focusNode: _controller.textNode,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxWidth: 600,
            maxHeight: 500,
            minHeight: 400,
          ),
          height: size.height * .4,
          width: size.width * .4,
          child: Column(
            children: [
              BlocBuilder<MotivoRemoverReporItemCubit,
                  MotivoRemoverReporItemState>(
                bloc: processoMotivoCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const LoadingWidget();
                  }
                  List<MotivoRemoverReporItemModel> motivos = state.motivos;
                  motivos.sort(
                    (a, b) => a.descricao!.compareTo(b.descricao!),
                  );
                  return DropDownSearchWidget(
                    expandOnStart: true,
                    textFunction: (motivo) => motivo?.descricao ?? '',
                    initialValue: null,
                    sourceList: motivos
                        .where(
                          (element) =>
                              element.ativo == true && element.remover == true,
                        )
                        .toList(),
                    onChanged: (value) =>
                        _controller.dto.codMotivo = value?.cod,
                    placeholder: 'Motivo Remoção',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              const Text('Leia a etiqueta do Item que deseja remover do kit'),
              const Expanded(child: Center(child: LoadingWidget())),
            ],
          ),
        ),
      ),
      actions: [
        BarcodeWidget(
          data: 'Cancelar',
          barcode: Barcode.dataMatrix(),
          height: 30,
          width: 30,
        ),
        CancelButtonUnfilledWidget(
          onPressed: () => _controller.cancelarRemocao(context),
        ),
      ],
    );
  }
}