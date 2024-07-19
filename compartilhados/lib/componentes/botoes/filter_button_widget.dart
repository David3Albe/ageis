import 'package:compartilhados/componentes/botoes/button_constraints.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class _HoverCubit extends Cubit<bool> {
  _HoverCubit() : super(false);
  void hover(bool hover) => emit(hover);
}

class FilterButtonWidget extends StatelessWidget {
  FilterButtonWidget({required this.onPressed, Key? key});
  final void Function()? onPressed;
  final _HoverCubit hoverCubit = _HoverCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_HoverCubit, bool>(
      bloc: hoverCubit,
      builder: (context, hovered) => SizedBox(
        width: ButtonConstraints.SMALL_BUTTON_WIDTH,
        height: ButtonConstraints.SMALL_BUTTON_HEIGHT,
        child: ElevatedButton(
          onHover: hoverCubit.hover,
          style: !hovered
              ? ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  backgroundColor: Colors.lightBlue.shade400,
                )
              : ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  backgroundColor: Colors.lightBlue.shade600,
                ),
          onPressed: onPressed,
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
                    'Filtros',
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
