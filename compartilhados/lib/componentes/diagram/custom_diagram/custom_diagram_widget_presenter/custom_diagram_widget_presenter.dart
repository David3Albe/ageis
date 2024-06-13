import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget_builders/custom_diagram_widget_clear_builder.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget_controller/custom_diagram_widget_controller.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_item_add_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/selected_process_type_detail/cubits/selected_cubit.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/selected_process_type_detail/selected_process_type_detail_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CustomDiagramWidgetPresenter extends StatefulWidget {
  final List<CustomDiagramRectModel> objects;
  final List<CustomDiagramItemAddModel> itemsAddable;
  final double defaultWidth;
  final double defaultHeight;
  final CustomDiagramWidgetClearBuilder clearWidgetBuilder;
  final Color defaultAddedNewRectBackColor;
  final Color defaultAddedNewRectForeColor;
  final int? initialClickOn;
  final bool canEdit;
  const CustomDiagramWidgetPresenter({
    required this.canEdit,
    required this.objects,
    required this.itemsAddable,
    required this.defaultHeight,
    required this.defaultWidth,
    required this.clearWidgetBuilder,
    required this.defaultAddedNewRectBackColor,
    required this.defaultAddedNewRectForeColor,
    required this.initialClickOn,
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
    if (widget.initialClickOn != null) {
      CustomDiagramRectModel? rect = widget.objects
          .where((element) => element.id == widget.initialClickOn)
          .firstOrNull;
      if (rect == null) return;
      rect.selected = true;
      rect.selectedTime = DateTime.now();
    }
    controller = CustomDiagramWidgetController(
      canEdit: widget.canEdit,
      defaultAddedNewRectBackColor: widget.defaultAddedNewRectBackColor,
      defaultAddedNewRectForeColor: widget.defaultAddedNewRectForeColor,
      defaultHeight: widget.defaultHeight,
      defaultWidth: widget.defaultWidth,
      itemsAddable: widget.itemsAddable,
      objects: widget.objects,
      setState: setState,
    );
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SelectedCubit>(context).select(widget.initialClickOn);
    });
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
        constraints: const BoxConstraints(minWidth: 500, minHeight: 600),
        height: MediaQuery.sizeOf(context).height - 100,
        child: Row(
          children: [
            widget.itemsAddable.isNotEmpty
                ? Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Material(
                            elevation: 5,
                            child: SingleChildScrollView(
                              controller: ScrollController(),
                              child: Column(
                                children: controller.getWidgetsToAdd(context),
                              ),
                            ),
                          ),
                        ),
                        if (!widget.canEdit) ...[
                          const Padding(padding: EdgeInsets.only(top: 16)),
                          const Expanded(
                            child: SelectedProcessTypeDetailWidget(),
                          ),
                        ]
                      ],
                    ),
                  )
                : const SizedBox(),
            Expanded(
              flex: 7,
              child: InteractiveViewer(
                constrained: false,
                minScale: 0.1,
                maxScale: 3,
                child: Container(
                  width: 2000,
                  height: 1200,
                  child: Column(
                    children: [
                      Expanded(
                        child: DragTarget(
                          builder: (context, candidateData, rejectedData) {
                            return Stack(
                              children: controller.getWidgets(context: context),
                            );
                          },
                          onAcceptWithDetails: (details) =>
                              controller.addDragabledItem(details, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
