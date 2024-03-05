import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';
import 'package:flutter/material.dart';

class CustomDiagramRectWidget extends StatefulWidget {
  final CustomDiagramRectModel object;
  final Color defaultAddedNewRectBackColor;
  final Color defaultAddedNewRectForeColor;
  final void Function() onMove;
  final void Function() onSelected;

  CustomDiagramRectWidget({
    required this.object,
    required this.onMove,
    required this.onSelected,
    required this.defaultAddedNewRectBackColor,
    required this.defaultAddedNewRectForeColor,
  });

  @override
  State<CustomDiagramRectWidget> createState() =>
      _CustomDiagramRectWidgetState();
}

class _CustomDiagramRectWidgetState extends State<CustomDiagramRectWidget> {
  double width = 0;
  double height = 0;

  @override
  void initState() {
    width = widget.object.width;
    height = widget.object.height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.object.locationX,
      top: widget.object.locationY,
      child: widget.object.selected != true
          ? getDragableWidget()
          : getResizableWidget(),
    );
  }

  void toogleSelected() {
    setState(() {
      widget.object.selected = !(widget.object.selected ?? false);
      if (widget.object.selected != true) {
        widget.object.selectedTime = null;
      } else {
        widget.object.selectedTime = DateTime.now();
      }
    });
    widget.onSelected();
  }

  Widget getResizableWidget() {
    return GestureDetector(
      onTap: toogleSelected,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: widget.object.novo == true
              ? widget.defaultAddedNewRectBackColor
              : widget.object.backColor,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              widget.object.text,
              style: TextStyle(
                color: widget.object.novo == true
                    ? widget.object.addedForeColor
                    : widget.object.foreColor,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDragableWidget() {
    return GestureDetector(
      onTap: toogleSelected,
      child: Draggable(
        data: widget.object,
        child: Container(
          decoration: BoxDecoration(
            color: widget.object.novo == true
                ? widget.defaultAddedNewRectBackColor
                : widget.object.backColor,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                widget.object.text,
                style: TextStyle(
                  color: widget.object.novo == true
                      ? widget.object.addedForeColor
                      : widget.object.foreColor,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
        feedback: Material(
          child: Container(
            decoration: BoxDecoration(
              color: widget.object.novo == true
                  ? widget.defaultAddedNewRectBackColor.withOpacity(0.5)
                  : widget.object.backColor.withOpacity(0.5),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  widget.object.text,
                  style: TextStyle(
                    color: widget.object.novo == true
                        ? widget.object.addedForeColor
                        : widget.object.foreColor,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ),
        childWhenDragging: Material(
          child: Container(
            decoration: BoxDecoration(
              color: widget.object.novo == true
                  ? widget.defaultAddedNewRectBackColor.withOpacity(0.5)
                  : widget.object.backColor.withOpacity(0.5),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  widget.object.text,
                  style: TextStyle(
                    color: widget.object.novo == true
                        ? widget.object.addedForeColor
                        : widget.object.foreColor,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ),
        onDragUpdate: (details) {
          setState(() {
            widget.object.locationX += details.delta.dx;
            widget.object.locationY += details.delta.dy;
            widget.onMove();
          });
        },
      ),
    );
  }
}
