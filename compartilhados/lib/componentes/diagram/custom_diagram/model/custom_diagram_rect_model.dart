import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_link_model.dart';
import 'package:flutter/material.dart';

class CustomDiagramRectModel<T> {
  int id;
  double width;
  double height;
  double locationX;
  double locationY;
  String text;
  Color backColor;
  Color foreColor;
  Color addedBackColor;
  Color addedForeColor;
  T? objectBase;
  List<CustomDiagramLinkModel<T>>? links;
  bool? selected;
  bool? novo;
  DateTime? selectedTime;

  CustomDiagramRectModel({
    required this.id,
    required this.width,
    required this.locationX,
    required this.locationY,
    required this.height,
    required this.text,
    this.objectBase,
    this.links,
    this.backColor = Colors.lightGreen,
    this.foreColor = Colors.black,
    this.addedBackColor = Colors.lightGreen,
    this.addedForeColor = Colors.black,
    this.novo = false,
  });
}
