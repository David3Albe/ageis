import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoPageManualReadingWidgetCubit
    extends Cubit<ProcessoPageManualReadingWidgetState> {
  ProcessoPageManualReadingWidgetCubit()
      : super(ProcessoPageManualReadingWidgetState(visible: false, x: 0, y: 0));

  void toogleVisibility() {
    emit(
      ProcessoPageManualReadingWidgetState(
        visible: !state.visible,
        x: state.x,
        y: state.y,
      ),
    );
  }

  void onPan({required double y, required double x}) {
    emit(
      ProcessoPageManualReadingWidgetState(visible: state.visible, x: x, y: y),
    );
  }
}

class ProcessoPageManualReadingWidgetState {
  bool visible;
  double y;
  double x;
  ProcessoPageManualReadingWidgetState({
    required this.visible,
    required this.y,
    required this.x,
  });
}
