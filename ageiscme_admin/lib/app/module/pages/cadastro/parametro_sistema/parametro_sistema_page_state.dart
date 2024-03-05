import 'package:ageiscme_data/services/parametro_sistema/parametro_sistema_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ParametroSistemaPageCubit extends Cubit<ParametroSistemaPageState> {
  final ParametroSistemaService service;
  ParametroSistemaPageCubit({required this.service})
      : super(
          ParametroSistemaPageState(
            parametrosSistema: [],
            loading: false,
          ),
        );

  void loadParametroSistema() async {
    emit(ParametroSistemaPageState(loading: true, parametrosSistema: []));
    try {
      List<ParametroSistemaModel> parametrosSistema = await service.GetAll();
      emit(
        ParametroSistemaPageState(
          loading: false,
          parametrosSistema: parametrosSistema,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ParametroSistemaPageState(
          loading: false,
          parametrosSistema: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ParametroSistemaModel parametroSistema) async {
    try {
      (String, ParametroSistemaModel)? result =
          await service.delete(parametroSistema);
      if (result == null) return;
      emit(
        ParametroSistemaPageState(
          loading: false,
          parametrosSistema: state.parametrosSistema,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ParametroSistemaPageState(
          loading: false,
          parametrosSistema: state.parametrosSistema,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ParametroSistemaPageState {
  final bool loading;
  final bool deleted;
  final List<ParametroSistemaModel> parametrosSistema;
  final String error;
  final String message;

  ParametroSistemaPageState({
    required this.loading,
    required this.parametrosSistema,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
