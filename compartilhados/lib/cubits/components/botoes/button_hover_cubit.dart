import 'package:dependencias_comuns/bloc_export.dart';

class ButtonHoverCubit extends Cubit<bool> {
  ButtonHoverCubit(bool hover) : super(hover);

  void changeHover(bool hover) {
    emit(hover);
  }
}