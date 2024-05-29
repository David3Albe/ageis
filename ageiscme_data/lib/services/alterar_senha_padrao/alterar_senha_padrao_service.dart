import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/alterar_senha_padrao/alterar_senha_padrao_dto.dart';
import 'package:ageiscme_models/response_dto/alterar_senha_padrao/alterar_senha_padrao_response_dto.dart';

class AlterarSenhaPadraoService {
  final CustomDio _client = CustomDio();

  AlterarSenhaPadraoService();

  Future<(String message, AlterarSenhaPadraoResponseDTO senhaPadrao)?> changePassword(
    AlterarSenhaPadraoDTO obj,
  ) async {
    return await _client.post(
      '/alterar-senha-padrao',
      obj,
      (dynamic json) => AlterarSenhaPadraoResponseDTO.fromJson(json),
    );
  }
}
