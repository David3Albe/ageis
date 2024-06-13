import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/authentication/authentication_dto.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:compartilhados/exceptions/custom_base_exception.dart';

class AuthenticationService {
  final CustomDio _client = CustomDio();
  static const String BASE_ROUTE = '/authentication/';

  AuthenticationService();

  void DisableThrower() => _client.DisableExceptionService();
  void DisableAuthorization() => _client.DisableAuthorization();
  void EnableEncryptPayload() => _client.EnableEncryptPayload();

  Future<(String message, AuthenticationResultDTO usuario)?> auth(
    AuthenticationDTO obj,
  ) async {
    return await _client.post(
      BASE_ROUTE,
      obj,
      (dynamic json) => AuthenticationResultDTO.fromJson(json),
    );
  }

  Future<bool?> hasRight(
    int right,
  ) async {
    dynamic resp = await _client.getOne(
      BASE_ROUTE + 'has-right/$right',
    );
    if (resp is bool) return resp;
    throw CustomBaseException('Erro: $resp');
  }
}
