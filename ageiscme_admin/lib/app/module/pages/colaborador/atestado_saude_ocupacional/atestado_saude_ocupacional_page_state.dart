import 'package:ageiscme_data/services/atestado_saude_ocupacional/atestado_saude_ocupacional_service.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AtestadoSaudeOcupacionalPageCubit
    extends Cubit<AtestadoSaudeOcupacionalPageState> {
  final AtestadoSaudeOcupacionalService service;
  AtestadoSaudeOcupacionalPageCubit({required this.service})
      : super(
          AtestadoSaudeOcupacionalPageState(
            atestadosSaudeOcupacionais: [],
            loading: false,
          ),
        );

  void loadAtestadoSaudeOcupacional() async {
    emit(
      AtestadoSaudeOcupacionalPageState(
        loading: true,
        atestadosSaudeOcupacionais: [],
      ),
    );
    try {
      List<AtestadoSaudeOcupacionalModel> atestadosSaudeOcupacionais =
          await service.GetAll();
      emit(
        AtestadoSaudeOcupacionalPageState(
          loading: false,
          atestadosSaudeOcupacionais: atestadosSaudeOcupacionais,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AtestadoSaudeOcupacionalPageState(
          loading: false,
          atestadosSaudeOcupacionais: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional) async {
    try {
      (String, AtestadoSaudeOcupacionalModel)? result =
          await service.delete(atestadoSaudeOcupacional);
      if (result == null) return;
      emit(
        AtestadoSaudeOcupacionalPageState(
          loading: false,
          atestadosSaudeOcupacionais: state.atestadosSaudeOcupacionais,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AtestadoSaudeOcupacionalPageState(
          loading: false,
          atestadosSaudeOcupacionais: state.atestadosSaudeOcupacionais,
          error: ex.toString(),
        ),
      );
    }
  }
}

class AtestadoSaudeOcupacionalPageState {
  final bool loading;
  final bool deleted;
  final List<AtestadoSaudeOcupacionalModel> atestadosSaudeOcupacionais;
  final String error;
  final String message;

  AtestadoSaudeOcupacionalPageState({
    required this.loading,
    required this.atestadosSaudeOcupacionais,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
