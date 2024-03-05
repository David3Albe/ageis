import 'package:flutter/material.dart';

class MovableDialog extends StatefulWidget {
  const MovableDialog({
    required this.alertDialog,
    this.onPan,
    this.x = 0,
    this.y = 0,
  });
  final AlertDialog alertDialog;
  final double x;
  final double y;
  final void Function({required double x, required double y})? onPan;
  @override
  _MovableDialogState createState() => _MovableDialogState();
}

class _MovableDialogState extends State<MovableDialog> {
  double _x = 0.0;
  double _y = 0.0;

  @override
  void initState() {
    _x = widget.x;
    _y = widget.y;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _x,
          top: _y,
          child: MouseRegion(
            cursor: SystemMouseCursors.move,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _x += details.delta.dx;
                  _y += details.delta.dy;
                  if (widget.onPan != null) {
                    widget.onPan!(x: _x, y: _y);
                  }
                });
              },
              child: Align(
                alignment: Alignment.center,
                child: widget.alertDialog,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
