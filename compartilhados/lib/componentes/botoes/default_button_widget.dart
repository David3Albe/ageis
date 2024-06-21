import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/easy_debounce_export.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatefulWidget {
  const DefaultButtonWidget({
    required this.text,
    required this.onPressed,
    required this.cor,
    required this.corHovered,
    required this.icon,
    this.elevation,
    this.paddingHeight = 6,
    this.paddingWidth = 12,
    this.readonly,
    this.throtleDuration = const Duration(seconds: 5),
    Key? key,
  });

  final String text;
  final Color cor;
  final Color corHovered;
  final IconData icon;
  final double? elevation;
  final double paddingHeight;
  final double paddingWidth;
  final bool? readonly;
  final void Function()? onPressed;
  final Duration? throtleDuration;

  @override
  State<DefaultButtonWidget> createState() => _DefaultButtonWidgetState();
}

class _DefaultButtonWidgetState extends State<DefaultButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    double scaleH = MediaQuery.of(context).size.height / 1080;
    double scaleW = MediaQuery.of(context).size.width / 1920;
    return ElevatedButton(
      onHover: (bool hover) => setState(() => hovered = hover),
      style: !hovered
          ? ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              elevation: widget.elevation,
              backgroundColor: widget.cor,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              elevation: widget.elevation,
              backgroundColor: widget.corHovered,
            ),
      onPressed: widget.readonly == true ? null : handleClick,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.paddingWidth * scaleW,
          vertical: widget.paddingHeight * scaleH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                child: Icon(
                  widget.icon,
                  color: Cores.corIconeBranco,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Cores.corTextoBranco,
                    fontSize: HelperFunctions.calculaFontSize(context, 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleClick() {
    if (widget.onPressed == null) return;
    EasyThrottle.throttle(
      'save-button',
      const Duration(seconds: 7),
      widget.onPressed!,
    );
  }
}
