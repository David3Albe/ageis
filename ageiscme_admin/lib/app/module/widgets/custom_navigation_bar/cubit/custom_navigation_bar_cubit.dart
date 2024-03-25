import 'package:dependencias_comuns/bloc_export.dart';

class CustomNavigationBarCubit extends Cubit<CustomNavigationBarState> {
  CustomNavigationBarCubit() : super(CustomNavigationBarState(expanded: true));

  void toogleExpanded() {
    bool expanded = !state.expanded;
    emit(CustomNavigationBarState(expanded: expanded));
  }

  void turnExpandedOff() {
    emit(CustomNavigationBarState(expanded: false));
  }

    void expand() {
    emit(CustomNavigationBarState(expanded: true));
  }
}

class CustomNavigationBarState {
  bool expanded;
  CustomNavigationBarState({required this.expanded});
}
