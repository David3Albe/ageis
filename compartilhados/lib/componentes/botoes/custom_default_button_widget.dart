import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomDefaultButtonWidget extends StatefulWidget {
  const CustomDefaultButtonWidget({
    required this.text,
    required this.onPressed,
    required this.cor,
    required this.corHovered,
    this.icon,
    this.corTexto = Colors.white,
    this.iconColor = Colors.white,
    this.elevation,
    this.paddingHeight = 6,
    this.paddingWidth = 12,
    Key? key,
    this.readonly,
  });

  final String text;
  final Color corTexto;
  final Color cor;
  final Color corHovered;
  final double? elevation;
  final double paddingHeight;
  final double paddingWidth;
  final IconData? icon;
  final Color iconColor;
  final void Function()? onPressed;
  final bool? readonly;

  @override
  State<CustomDefaultButtonWidget> createState() =>
      _CustomDefaultButtonWidgetState();
}

class _CustomDefaultButtonWidgetState extends State<CustomDefaultButtonWidget> {
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
      onPressed: widget.readonly == true ? null : widget.onPressed,
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
            widget.icon != null
                ? Flexible(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      child: Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: 20,
                      ),
                    ),
                  )
                : const SizedBox(),
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
}
