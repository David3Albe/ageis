import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget_builders/custom_diagram_widget_clear_builder.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget_controller/custom_diagram_widget_controller.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_item_add_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';
import 'package:flutter/material.dart';

class CustomDiagramWidgetPresenter extends StatefulWidget {
  final List<CustomDiagramRectModel> objects;
  final List<CustomDiagramItemAddModel> itemsAddable;
  final double defaultWidth;
  final double defaultHeight;
  final CustomDiagramWidgetClearBuilder clearWidgetBuilder;
  final Color defaultAddedNewRectBackColor;
  final Color defaultAddedNewRectForeColor;
  const CustomDiagramWidgetPresenter({
    required this.objects,
    required this.itemsAddable,
    required this.defaultHeight,
    required this.defaultWidth,
    required this.clearWidgetBuilder,
    required this.defaultAddedNewRectBackColor,
    required this.defaultAddedNewRectForeColor,
  });

  @override
  State<CustomDiagramWidgetPresenter> createState() =>
      _CustomDiagramWidgetState();
}

class _CustomDiagramWidgetState extends State<CustomDiagramWidgetPresenter> {
  late final FocusNode focus;
  late final CustomDiagramWidgetController controller;
  late final ScrollController scrollController;

  @override
  void initState() {
    focus = FocusNode();
    scrollController = ScrollController();
    controller = CustomDiagramWidgetController(
      defaultAddedNewRectBackColor: widget.defaultAddedNewRectBackColor,
      defaultAddedNewRectForeColor: widget.defaultAddedNewRectForeColor,
      defaultHeight: widget.defaultHeight,
      defaultWidth: widget.defaultWidth,
      itemsAddable: widget.itemsAddable,
      objects: widget.objects,
      setState: setState,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.clearWidgetBuilder.call(
      context,
      () => controller.clear(),
    );
    return RawKeyboardListener(
      onKey: controller.handleKey,
      autofocus: true,
      focusNode: focus,
      child: Container(
        height: 850,
        width: 2000,
        child: Row(
          children: [
            widget.itemsAddable.isNotEmpty
                ? Expanded(
                    child: Material(
                      elevation: 5,
                      child: Column(
                        children: controller.getWidgetsToAdd(context),
                      ),
                    ),
                  )
                : const SizedBox(),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: DragTarget(
                      builder: (context, candidateData, rejectedData) {
                        return Stack(
                          children: controller.getWidgets(),
                        );
                      },
                      onAcceptWithDetails: (details) =>
                          controller.addDragabledItem(details, context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
