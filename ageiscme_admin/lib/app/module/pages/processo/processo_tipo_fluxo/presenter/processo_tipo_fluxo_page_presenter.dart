import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_fluxo/controller/processo_tipo_fluxo_page_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/custom_default_button_widget.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoTipoFluxoPagePresenter extends StatefulWidget {
  final ProcessoTipoModel processoTipo;
  final bool canEdit;
  final int? initialClickOn;
  final Future<List<String>> Function({required int id})? onDetailSearchItems;

  const ProcessoTipoFluxoPagePresenter({
    required this.processoTipo,
    required this.canEdit,
    this.initialClickOn,
    this.onDetailSearchItems,
  });

  @override
  State<ProcessoTipoFluxoPagePresenter> createState() =>
      _ProcessoTipoFluxoPagePresenterState();
}

class _ProcessoTipoFluxoPagePresenterState
    extends State<ProcessoTipoFluxoPagePresenter> {
  late final ProcessoTipoFluxoPageController controller;

  @override
  void initState() {
    controller =
        ProcessoTipoFluxoPageController(processoTipo: widget.processoTipo);
    controller.inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(4.0),
      titlePadding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
      actionsPadding: const EdgeInsets.only(bottom: 4.0, right: 8),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: Row(
        children: [
          Expanded(
            child: TitleWidget(
              text: 'Tipo Fluxo ' + widget.processoTipo.nome,
            ),
          ),
          const Spacer(),
          CloseButtonWidget(
            onPressed: () => Navigator.of(context).pop((false, '')),
          ),
        ],
      ),
      content: Column(
        children: [
          CustomDiagramWidget(
            onDetailSearchItems: widget.onDetailSearchItems,
            canEdit: widget.canEdit,
            objects: controller.getRects,
            defaultHeight: 40,
            defaultWidth: 70,
            initialClickOn: widget.initialClickOn,
            itemsAddable: controller.getItemAddable,
            clearWidgetBuilder: (context, clearMethod) =>
                controller.clearMethod = clearMethod,
          ),
        ],
      ),
      actions: [
        CustomDefaultButtonWidget(
          icon: Symbols.cancel,
          text: widget.canEdit ? 'Cancelar' : 'Fechar',
          onPressed: Navigator.of(context).pop,
          cor: Colors.red.shade400,
          corHovered: Colors.red.shade500,
        ),
        if (widget.canEdit)
          CustomDefaultButtonWidget(
            icon: Symbols.cleaning,
            text: 'Limpar',
            onPressed: controller.clear,
            cor: Colors.grey.shade400,
            corHovered: Colors.grey.shade500,
          ),
        if (widget.canEdit)
          CustomDefaultButtonWidget(
            icon: Icons.save,
            text: 'Confirmar Edição',
            onPressed: () {
              controller.save();
              Navigator.of(context).pop();
            },
            cor: Colors.green.shade400,
            corHovered: Colors.green.shade500,
          ),
      ],
    );
  }
}
