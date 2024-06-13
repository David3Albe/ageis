import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class _AddButtonWidgetHoveredCubit extends Cubit<bool> {
  _AddButtonWidgetHoveredCubit() : super(false);
  void hover(bool hover) => emit(hover);
}

class AddButtonWidget extends StatelessWidget {
  AddButtonWidget({
    required this.onPressed,
    this.readonly,
    Key? key,
  });
  final void Function()? onPressed;
  final bool? readonly;
  final _AddButtonWidgetHoveredCubit hoverCubit =
      _AddButtonWidgetHoveredCubit();

  @override
  Widget build(BuildContext context) {
    double scaleH = MediaQuery.of(context).size.height / 1080;
    double scaleW = MediaQuery.of(context).size.width / 1920;
    return BlocBuilder<_AddButtonWidgetHoveredCubit, bool>(
      bloc: hoverCubit,
      builder: (context, hovered) => ElevatedButton(
        onHover: hoverCubit.hover,
        style: !hovered
            ? ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                backgroundColor: Cores.corBotaoVerde,
              )
            : ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                backgroundColor: Cores.corBotaoVerdeSelecionado,
              ),
        onPressed: readonly == true ? null : onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0 * scaleW,
            vertical: 6.0 * scaleH,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Flexible(
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    Symbols.add,
                    color: Cores.corIconeBranco,
                    size: 20,
                  ),
                ),
              ),
              Flexible(
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Adicionar',
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
      ),
    );
  }
}
