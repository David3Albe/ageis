import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget_builders/custom_diagram_widget_clear_builder.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget_presenter/custom_diagram_widget_presenter.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_item_add_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';
import 'package:flutter/material.dart';

class CustomDiagramWidget extends StatelessWidget {
  final List<CustomDiagramRectModel> objects;
  final List<CustomDiagramItemAddModel> itemsAddable;
  final double defaultWidth;
  final double defaultHeight;
  final CustomDiagramWidgetClearBuilder clearWidgetBuilder;
  final Color defaultAddedNewRectBackColor;
  final Color defaultAddedNewRectForeColor;
  const CustomDiagramWidget({
    required this.objects,
    required this.itemsAddable,
    required this.defaultHeight,
    required this.defaultWidth,
    required this.clearWidgetBuilder,
    this.defaultAddedNewRectBackColor = const Color.fromARGB(255, 3, 169, 244),
    this.defaultAddedNewRectForeColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDiagramWidgetPresenter(
      defaultAddedNewRectBackColor: defaultAddedNewRectBackColor,
      defaultAddedNewRectForeColor: defaultAddedNewRectForeColor,
      objects: objects,
      itemsAddable: itemsAddable,
      defaultHeight: defaultHeight,
      defaultWidth: defaultWidth,
      clearWidgetBuilder: clearWidgetBuilder,
    );
  }
}
