import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_link_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LinePainterWidget extends StatefulWidget {
  final List<CustomDiagramRectModel> rects;
  final void Function() updateState;
  final void Function() selectedLink;

  LinePainterWidget({
    required this.rects,
    required this.updateState,
    required this.selectedLink,
  });

  @override
  State<LinePainterWidget> createState() => _LinePainterWidgetState();
}

class _LinePainterWidgetState extends State<LinePainterWidget> {
  List<Line> lines = [];
  @override
  void initState() {
    super.initState();
  }

  void toogleSelected(Line line) {
    for (Line lineOld in lines) {
      if (lineOld.link.selected == false) continue;
      if (lineOld != line) lineOld.link.selected = false;
    }
    line.link.selected = !(line.link.selected ?? false);
    widget.updateState();
    widget.selectedLink();
  }

  void setLineSelected(TapDownDetails detail, List<Line> lines) {
    Line? line;
    double? minValue;
    for (Line entry in lines) {
      double? distance = entry.getDistance(detail.localPosition);
      if (distance == null) continue;
      if (minValue == null || minValue > distance) {
        minValue = distance;
        line = entry;
      }
    }
    if (line == null) return;
    toogleSelected(line);
  }

  @override
  Widget build(BuildContext context) {
    criarLinhas();
    return GestureDetector(
      onTapDown: (details) => setLineSelected(details, lines),
      child: CustomPaint(
        size: Size.infinite,
        painter: _LinePainter(lines: lines),
      ),
    );
  }

  void criarLinhas() {
    lines = [];
    for (CustomDiagramRectModel rect in widget.rects) {
      if (rect.links == null || rect.links!.isEmpty) continue;
      for (CustomDiagramLinkModel link in rect.links!) {
        int index = rect.links!.indexOf(link);
        Offset location1 = Offset(
          rect.locationX + (index * 5) + 20,
          rect.locationY + (rect.height),
        );
        Offset location2 = Offset(
          link.destiny.locationX + (index * 5) + 20,
          link.destiny.locationY + 1,
        );
        Line line = Line(
          location1,
          location2,
          link: link,
        );
        lines.add(line);
      }
    }
  }
}

class _LinePainter extends CustomPainter {
  final List<Line> lines;
  _LinePainter({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    Paint paintSelected = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    for (Line line in lines) {
      paintCircleAtStart(
        canvas,
        line.start,
        line.end,
        line,
      );
      paintArrow(canvas, line.start, line.end, line);
      paintCircleAtEnd(
        canvas,
        line.start,
        line.end,
        line,
      );
      canvas.drawLine(
        line.start,
        line.end,
        line.link.selected == true ? paintSelected : paint,
      );
    }
  }

  void paintCircleAtStart(
    Canvas canvas,
    Offset start,
    Offset end,
    Line line,
  ) {
    if (line.link.originCircle != true) return;
    Paint paint = Paint()
      ..color = Colors.black
      ..style = line.link.originCircleFilled == true
          ? PaintingStyle.fill
          : PaintingStyle.stroke
      ..strokeWidth = 2.0;

    double startX = start.dx;
    double startY = start.dy;
    double endX = end.dx;
    double endY = end.dy;

    double margin = 20.0;

    double almostStartX = startX +
        margin * (endX - startX) / distance(startX, startY, endX, endY);
    double almostStartY = startY +
        margin * (endY - startY) / distance(startX, startY, endX, endY);

    drawCircleAtAlmostStart(canvas, almostStartX, almostStartY, paint);
  }

  void drawCircleAtAlmostStart(
    Canvas canvas,
    double almostStartX,
    double almostStartY,
    Paint paint,
  ) {
    double circleRadius = 7.0;

    canvas.drawCircle(Offset(almostStartX, almostStartY), circleRadius, paint);
  }

  void paintCircleAtEnd(Canvas canvas, Offset start, Offset end, Line line) {
    if (line.link.destinyCircle != true) return;
    Paint paint = Paint()
      ..color = Colors.black
      ..style = line.link.destinyCircleFilled == true
          ? PaintingStyle.fill
          : PaintingStyle.stroke
      ..strokeWidth = 2.0;

    double startX = start.dx;
    double startY = start.dy;
    double endX = end.dx;
    double endY = end.dy;
    double margin = 22.0;
    double almostEndX =
        endX - margin * (endX - startX) / distance(startX, startY, endX, endY);
    double almostEndY =
        endY - margin * (endY - startY) / distance(startX, startY, endX, endY);
    drawCircleAtAlmostEnd(canvas, almostEndX, almostEndY, paint);
  }

  void drawCircleAtAlmostEnd(
    Canvas canvas,
    double almostEndX,
    double almostEndY,
    Paint paint,
  ) {
    canvas.drawCircle(
      Offset(almostEndX, almostEndY),
      6.0,
      paint,
    );
  }

  double distance(double x1, double y1, double x2, double y2) {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }

  void paintArrow(Canvas canvas, Offset start, Offset end, Line line) {
    if (line.link.midArrow != true) return;
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5;

    double startX = start.dx;
    double startY = start.dy;
    double endX = end.dx;
    double endY = end.dy;

    double midX = (startX + endX) / 2;
    double midY = (startY + endY) / 2;

    drawArrowhead(canvas, midX, midY, endX, endY, paint);
  }

  void drawArrowhead(
    Canvas canvas,
    double midX,
    double midY,
    double endX,
    double endY,
    Paint paint,
  ) {
    double arrowSize = 10.0;

    double angle = atan2(endY - midY, endX - midX);

    double arrowhead1X = midX - arrowSize * cos(angle + 0.5);
    double arrowhead1Y = midY - arrowSize * sin(angle + 0.5);

    double arrowhead2X = midX - arrowSize * cos(angle - 0.5);
    double arrowhead2Y = midY - arrowSize * sin(angle - 0.5);

    canvas.drawLine(
      Offset(midX, midY),
      Offset(arrowhead1X, arrowhead1Y),
      paint,
    );
    canvas.drawLine(
      Offset(midX, midY),
      Offset(arrowhead2X, arrowhead2Y),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Line {
  final Offset start;
  final Offset end;
  final double tolerance = 10.0;
  final CustomDiagramLinkModel link;

  Line(this.start, this.end, {required this.link});

  double? getDistance(Offset tapPoint) {
    bool isNear = isClickNearLine(tapPoint);
    if (!isNear) return null;
    return 0;
  }

  double calculateDistance(Offset point1, Offset point2) {
    double deltaX = point2.dx - point1.dx;
    double deltaY = point2.dy - point1.dy;

    return sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  bool isClickNearLine(Offset clickOffset) {
    double distance = pointLineDistance(clickOffset, start, end);

    double tolerance = 7.0;

    return distance <= tolerance;
  }

  double pointLineDistance(Offset point, Offset lineStart, Offset lineEnd) {
    double a = point.dx - lineStart.dx;
    double b = point.dy - lineStart.dy;
    double c = lineEnd.dx - lineStart.dx;
    double d = lineEnd.dy - lineStart.dy;

    double dot = a * c + b * d;
    double lenSq = c * c + d * d;
    double param = (lenSq != 0) ? dot / lenSq : -1;

    double xx, yy;

    if (param < 0) {
      xx = lineStart.dx;
      yy = lineStart.dy;
    } else if (param > 1) {
      xx = lineEnd.dx;
      yy = lineEnd.dy;
    } else {
      xx = lineStart.dx + param * c;
      yy = lineStart.dy + param * d;
    }

    double dx = point.dx - xx;
    double dy = point.dy - yy;

    return sqrt(dx * dx + dy * dy);
  }
}
