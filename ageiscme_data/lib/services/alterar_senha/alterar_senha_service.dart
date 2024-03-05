import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/alterar_senha/alterar_senha_dto.dart';
import 'package:ageiscme_models/dto/alterar_senha_result/alterar_senha_result_dto.dart';

class AlterarSenhaService {
  final CustomDio _client = CustomDio();

  AlterarSenhaService();

  void DisableThrower() => _client.DisableExceptionService();

  Future<(String message, AlterarSenhaResultDTO usuario)?> changePassword(
    AlterarSenhaDTO obj,
  ) async {
    return await _client.post(
      '/alterar-senha',
      obj,
      (dynamic json) => AlterarSenhaResultDTO.fromJson(json),
    );
  }
}
