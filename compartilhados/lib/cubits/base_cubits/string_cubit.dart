import 'package:dependencias_comuns/bloc_export.dart';

class StringCubit extends Cubit<String> {
  StringCubit() : super('');

  void changeValue(String value) {
    emit(value);
  }
}
