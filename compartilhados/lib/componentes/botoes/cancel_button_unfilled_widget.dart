import 'package:compartilhados/componentes/botoes/button_constraints.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class CancelButtonUnfilledWidget extends StatefulWidget {
  const CancelButtonUnfilledWidget({
    required this.onPressed,
    this.text = 'Cancelar',
    this.elevation,
    this.paddingHeight = 6,
    this.paddingWidth = 8,
    Key? key,
  });

  final double? elevation;
  final double paddingHeight;
  final double paddingWidth;
  final void Function()? onPressed;
  final String text;

  @override
  State<CancelButtonUnfilledWidget> createState() =>
      _CancelButtonUnfilledWidgetState();
}

class _CancelButtonUnfilledWidgetState
    extends State<CancelButtonUnfilledWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    // double scaleH = MediaQuery.of(context).size.height / 1080;
    // double scaleW = MediaQuery.of(context).size.width / 1920;
    return SizedBox(
      width: ButtonConstraints.SMALL_BUTTON_WIDTH,
      height: ButtonConstraints.SMALL_BUTTON_HEIGHT,
      child: ElevatedButton(
        onHover: (bool hover) => setState(() => hovered = hover),
        style: hovered
            ? ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: hovered
                      ? BorderSide.none
                      : const BorderSide(color: Colors.red, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                elevation: widget.elevation,
                backgroundColor: Cores.corBotaoCancelar,
              )
            : ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: hovered
                      ? BorderSide.none
                      : const BorderSide(color: Colors.red, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                elevation: widget.elevation,
                backgroundColor: Colors.white,
              ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Icon(
                  Icons.close,
                  color:
                      hovered ? Cores.corIconeBranco : Cores.corBotaoCancelar,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color:
                        hovered ? Cores.corTextoBranco : Cores.corBotaoCancelar,
                    fontSize: HelperFunctions.calculaFontSize(
                      context,
                      14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// class _CancelButtonUnfilledWidgetState
//     extends State<CancelButtonUnfilledWidget> {
//   bool hovered = false;
//   @override
//   Widget build(BuildContext context) {
//     double scaleH = MediaQuery.of(context).size.height / 1080;
//     double scaleW = MediaQuery.of(context).size.width / 1920;
//     return Material(
//       elevation: widget.elevation,
//       type: MaterialType.transparency,
//       child: InkWell(
//         onTap: widget.onPressed,
//         onHover: (bool hover) => setState(() => hovered = hover),
//         mouseCursor: SystemMouseCursors.click,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(5)),
//             border: Border.all(color: Cores.corBotaoCancelar),
//             color: hovered ? Cores.corBotaoCancelar : Colors.white,
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal:
//                   (widget.paddingWidth * scaleW) + getScaleScreenSize(scaleW),
//               vertical:
//                   widget.paddingHeight * scaleH + getScaleScreenSize(scaleH),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: FittedBox(
//                     fit: BoxFit.fitWidth,
//                     child: Icon(
//                       Icons.close,
//                       size: 20,
//                       color: hovered
//                           ? Cores.corIconeBranco
//                           : Cores.corBotaoCancelar,
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: FittedBox(
//                     fit: BoxFit.fitWidth,
//                     child: Text(
//                       'Cancelar',
//                       style: Fontes.getRoboto(
//                         cor: hovered
//                             ? Cores.corTextoBranco
//                             : Cores.corBotaoCancelar,
//                         fontSize: HelperFunctions.calculaFontSize(context, 14),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  double getScaleScreenSize(double scale) {
    if (scale >= 0.90) return 0;
    if (scale >= 0.85) return 0.3;
    if (scale >= 0.8) return 0.6;
    if (scale >= 0.7) return 1.0;
    return 1.6;
  }
}
