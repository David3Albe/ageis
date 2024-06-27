import 'package:ageiscme_data/services/parametro_sistema/parametro_sistema_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ParametroSistemaPageFrmCubit extends Cubit<ParametroSistemaPageFrmState> {
  final ParametroSistemaService service;
  final ParametroSistemaModel parametroSistemaModel;
  ParametroSistemaPageFrmCubit({
    required this.service,
    required this.parametroSistemaModel,
  }) : super(
          ParametroSistemaPageFrmState(parametroSistema: parametroSistemaModel),
        );

  void save(
    ParametroSistemaModel parametroSistema,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, ParametroSistemaModel parametroSistema)? result =
          await service.save(parametroSistema);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        ParametroSistemaPageFrmState(
          message: result.$1,
          saved: true,
          parametroSistema: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ParametroSistemaPageFrmState(
          error: ex.toString(),
          parametroSistema: parametroSistema,
        ),
      );
    }
  }

  void clear() {
    emit(
      ParametroSistemaPageFrmState(
        parametroSistema: ParametroSistemaModel.empty(),
      ),
    );
  }
}

class ParametroSistemaPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ParametroSistemaModel parametroSistema;

  ParametroSistemaPageFrmState({
    required this.parametroSistema,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
