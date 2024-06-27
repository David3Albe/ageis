import 'package:ageiscme_data/services/proprietario/proprietario_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProprietarioPageFrmCubit extends Cubit<ProprietarioPageFrmState> {
  final ProprietarioService service;
  final ProprietarioModel proprietarioModel;
  ProprietarioPageFrmCubit({
    required this.service,
    required this.proprietarioModel,
  }) : super(
          ProprietarioPageFrmState(proprietario: proprietarioModel),
        );

  void save(
    ProprietarioModel proprietario,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, ProprietarioModel proprietario)? result =
          await service.save(proprietario);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        ProprietarioPageFrmState(
          message: result.$1,
          saved: true,
          proprietario: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProprietarioPageFrmState(
          error: ex.toString(),
          proprietario: proprietario,
        ),
      );
    }
  }

  void clear() {
    emit(ProprietarioPageFrmState(proprietario: ProprietarioModel.empty()));
  }
}

class ProprietarioPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ProprietarioModel proprietario;

  ProprietarioPageFrmState({
    required this.proprietario,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
