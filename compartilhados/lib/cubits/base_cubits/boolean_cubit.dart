import 'package:dependencias_comuns/bloc_export.dart';

class BooleanCubit extends Cubit<bool> {
  BooleanCubit({bool value = false}) : super(value);

  void change(bool value) {
    emit(value);
  }

  void toogle() {
    emit(!state);
  }
}
