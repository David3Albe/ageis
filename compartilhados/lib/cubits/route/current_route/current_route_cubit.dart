import 'package:dependencias_comuns/bloc_export.dart';

class CurrentRouteCubit extends Cubit<String> {
  CurrentRouteCubit(String currentRoute) : super(currentRoute);

  void changeRoute(String route) {
    emit(route);
  }
}
