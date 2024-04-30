import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class CustomOverlayWidget extends StatefulWidget {
  const CustomOverlayWidget({
    required this.child,
    required this.width,
    required this.height,
    required this.onClose,
    this.ofssetBase,
  });
  final Widget child;
  final double height;
  final double width;
  final Function() onClose;
  final Offset? ofssetBase;

  @override
  State<CustomOverlayWidget> createState() => _CustomOverlayWidgetState();
}

class _CustomOverlayWidgetState extends State<CustomOverlayWidget> {
  late Offset offset = widget.ofssetBase ?? Offset.zero;
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            offset = Offset(
              offset.dx + details.delta.dx,
              offset.dy + details.delta.dy,
            );
          });
        },
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: widget.onClose,
                    icon: const Icon(Symbols.close),
                  ),
                ],
              ),
              Container(
                height: widget.height,
                width: widget.width,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
