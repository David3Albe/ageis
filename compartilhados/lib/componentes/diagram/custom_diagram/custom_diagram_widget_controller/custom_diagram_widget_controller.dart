import 'package:compartilhados/componentes/diagram/custom_diagram/line_painter/line_painter.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_item_add_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_link_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/objects/custom_diagram_rect_widget.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/selected_process_type_detail/cubits/selected_cubit.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDiagramWidgetController {
  final List<CustomDiagramRectModel> objects;
  final List<CustomDiagramItemAddModel> itemsAddable;
  final double defaultWidth;
  final double defaultHeight;
  final void Function(void Function() fn) setState;
  final Color defaultAddedNewRectBackColor;
  final Color defaultAddedNewRectForeColor;
  final bool canEdit;

  CustomDiagramWidgetController({
    required this.objects,
    required this.itemsAddable,
    required this.setState,
    required this.defaultHeight,
    required this.defaultWidth,
    required this.defaultAddedNewRectBackColor,
    required this.defaultAddedNewRectForeColor,
    required this.canEdit,
  });

  bool removeRect() {
    CustomDiagramRectModel? rectRemove;
    for (CustomDiagramRectModel rect in objects) {
      if (rect.selected != true) continue;
      rectRemove = rect;
      break;
    }
    if (rectRemove == null) return false;
    for (CustomDiagramRectModel rect in objects) {
      if (rect.links == null || rect.links!.isEmpty) continue;
      for (CustomDiagramLinkModel link in rect.links!) {
        if (link.destiny != rectRemove) continue;
        rect.links!.remove(link);
      }
    }
    objects.remove(rectRemove);
    setState(() => {});
    return true;
  }

  void removeLink() {
    CustomDiagramLinkModel? linkRemove;
    CustomDiagramRectModel? rectRemove;
    for (CustomDiagramRectModel rect in objects) {
      if (rect.links == null || rect.links!.isEmpty) continue;
      for (CustomDiagramLinkModel link in rect.links!) {
        if (link.selected != true) continue;
        rectRemove = rect;
        linkRemove = link;
        break;
      }
    }
    if (linkRemove == null || rectRemove == null) return;
    setState(() {
      rectRemove!.links!.remove(linkRemove);
    });
  }

  void handleKey(RawKeyEvent key) {
    if (key is RawKeyUpEvent) return;
    if (key.logicalKey != LogicalKeyboardKey.delete) return;
    bool rectRemoved = removeRect();
    if (rectRemoved) return;
    removeLink();
  }

  void addDragabledItem(DragTargetDetails? itemAdd, BuildContext context) {
    if (itemAdd == null ||
        itemAdd.data == null ||
        itemAdd.data is CustomDiagramRectModel ||
        !(itemAdd.data is CustomDiagramItemAddModel)) return;
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localPosition = renderBox.globalToLocal(itemAdd.offset);
    CustomDiagramRectModel rect = CustomDiagramRectModel(
      id: itemAdd.data.id,
      width: defaultWidth,
      height: defaultHeight,
      locationX: localPosition.dx,
      locationY: localPosition.dy,
      text: itemAdd.data.text,
      novo: true,
    );
    setState(() {
      objects.add(rect);
    });
  }

  void updateStatus() {
    setState(() {});
  }

  void onSelected({required BuildContext context}) {
    for (CustomDiagramRectModel rect in objects) {
      if (rect.links == null) continue;
      for (CustomDiagramLinkModel link in rect.links!) {
        setState(() {
          link.selected = false;
        });
      }
    }
    List<CustomDiagramRectModel> objetosSelecionados =
        objects.where((element) => element.selected == true).toList();
    objetosSelecionados
        .sort((a, b) => a.selectedTime!.compareTo(b.selectedTime!));
    if (!canEdit) {
      CustomDiagramRectModel? rect = objetosSelecionados.lastOrNull;
      if (objetosSelecionados.length > 1) {
        setState(() {
          for (CustomDiagramRectModel recSel in objetosSelecionados) {
            if (recSel.id == rect?.id) continue;
            recSel.selected = false;
          }
        });
      }
      BlocProvider.of<SelectedCubit>(context).select(rect?.id);
      return;
    }
    if (objetosSelecionados.length <= 1) return;

    CustomDiagramRectModel rectOrigin = objetosSelecionados[0];
    CustomDiagramRectModel rectDestiny = objetosSelecionados[1];
    if (rectOrigin.links == null) rectOrigin.links = [];
    if (rectOrigin.links!
            .where((element) => element.destiny.id == rectDestiny.id)
            .firstOrNull ==
        null) {
      rectOrigin.links!.add(CustomDiagramLinkModel(destiny: rectDestiny));
    }
    setState(() {
      rectOrigin.selected = null;
      rectOrigin.selectedTime = null;
      rectDestiny.selected = null;
      rectDestiny.selectedTime = null;
    });
  }

  List<Widget> getWidgets({required BuildContext context}) {
    List<Widget> widgets = [];
    _addLinks(context, objects, widgets);
    for (CustomDiagramRectModel rect in objects) {
      Widget widget = CustomDiagramRectWidget(
        object: rect,
        onMove: updateStatus,
        onSelected: () => onSelected(context: context),
        defaultAddedNewRectBackColor: defaultAddedNewRectBackColor,
        defaultAddedNewRectForeColor: defaultAddedNewRectForeColor,
      );
      widgets.add(widget);
    }
    return widgets;
  }

  void onSelectedLink({required BuildContext context}) {
    if (!canEdit) {
      BlocProvider.of<SelectedCubit>(context).clear();
    }
    for (CustomDiagramRectModel rect in objects) {
      setState(() {
        rect.selected = null;
        rect.selectedTime = null;
      });
    }
  }

  void _addLinks(BuildContext context, List<CustomDiagramRectModel> rects,
      List<Widget> widgets) {
    for (CustomDiagramRectModel rect in rects) {
      if (rect.links == null || rect.links!.isEmpty) continue;
      rect.links!
          .sort((a, b) => a.destiny.locationX.compareTo(b.destiny.locationX));
    }
    Widget widget = LinePainterWidget(
      rects: rects,
      updateState: updateStatus,
      selectedLink: () => onSelectedLink(context: context),
    );
    widgets.add(widget);
  }

  List<Widget> getWidgetsToAdd(BuildContext context) {
    List<Widget> widgets = [];
    double fontSize = getFontSize(context);
    for (CustomDiagramItemAddModel itemAddable in itemsAddable) {
      widgets.add(getWidgetToAdd(itemAddable, fontSize));
    }
    return widgets;
  }

  double getFontSize(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    if (height > 900) {
      return 12;
    } else if (height > 800) {
      return 11;
    } else {
      return 10;
    }
  }

  Widget getWidgetToAdd(
    CustomDiagramItemAddModel itemAddable,
    double fontSize,
  ) {
    return Draggable<CustomDiagramItemAddModel>(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          itemAddable.text,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      data: itemAddable,
      feedback: SizedBox(
        child: Center(
          child: Material(
            child: Text(
              itemAddable.text,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }

  List<CustomDiagramRectModel> getObjects() => objects;

  void clear() => setState(objects.clear);
}
