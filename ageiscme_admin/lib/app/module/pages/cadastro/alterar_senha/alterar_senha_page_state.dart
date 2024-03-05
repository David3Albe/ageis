import 'package:ageiscme_data/services/alterar_senha/alterar_senha_service.dart';
import 'package:ageiscme_models/dto/alterar_senha/alterar_senha_dto.dart';
import 'package:ageiscme_models/dto/alterar_senha_result/alterar_senha_result_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AlterarSenhaCubit extends Cubit<AlterarSenhaState> {
  final AlterarSenhaService service;
  AlterarSenhaCubit({required this.service})
      : super(
          AlterarSenhaState(),
        );

  Future changePassword(AlterarSenhaDTO dto) async {
    try {
      (String, AlterarSenhaResultDTO)? result =
          await service.changePassword(dto);
      if (result == null) return;
      emit(AlterarSenhaState(saved: true, message: result.$1));
    } on Exception catch (ex) {
      emit(
        AlterarSenhaState(
          error: ex.toString(),
        ),
      );
    }
  }
}

class AlterarSenhaState {
  final bool saved;
  final String error;
  final String message;

  AlterarSenhaState({
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
