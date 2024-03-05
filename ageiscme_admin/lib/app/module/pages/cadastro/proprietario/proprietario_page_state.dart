import 'package:ageiscme_data/services/proprietario/proprietario_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProprietarioPageCubit extends Cubit<ProprietarioPageState> {
  final ProprietarioService service;
  ProprietarioPageCubit({required this.service})
      : super(
          ProprietarioPageState(
            proprietarios: [],
            loading: false,
          ),
        );

  void loadProprietario() async {
    emit(ProprietarioPageState(loading: true, proprietarios: []));
    try {
      List<ProprietarioModel> proprietarios = await service.GetAll();
      emit(ProprietarioPageState(loading: false, proprietarios: proprietarios));
    } on Exception catch (ex) {
      emit(
        ProprietarioPageState(
          loading: false,
          proprietarios: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ProprietarioModel proprietarios) async {
    try {
      (String, ProprietarioModel)? result = await service.delete(proprietarios);
      if (result == null) return;
      emit(
        ProprietarioPageState(
          loading: false,
          proprietarios: state.proprietarios,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProprietarioPageState(
          loading: false,
          proprietarios: state.proprietarios,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ProprietarioPageState {
  final bool loading;
  final bool deleted;
  final List<ProprietarioModel> proprietarios;
  final String error;
  final String message;

  ProprietarioPageState({
    required this.loading,
    required this.proprietarios,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
