import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';

class CustomDiagramLinkModel<T> {
  CustomDiagramRectModel<T> destiny;
  bool? originCircle;
  bool? originCircleFilled;
  bool? destinyCircle;
  bool? destinyCircleFilled;
  bool? midArrow;
  bool? selected;

  CustomDiagramLinkModel({
    required this.destiny,
    this.originCircle,
    this.originCircleFilled,
    this.destinyCircle,
    this.destinyCircleFilled,
    this.midArrow,
  });
}
