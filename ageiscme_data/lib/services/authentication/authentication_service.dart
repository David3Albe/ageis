import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/authentication/authentication_dto.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';

class AuthenticationService {
  final CustomDio _client = CustomDio();

  AuthenticationService();

  void DisableThrower() => _client.DisableExceptionService();

  Future<(String message, AuthenticationResultDTO usuario)?> auth(
    AuthenticationDTO obj,
  ) async {
    return await _client.post(
      '/authentication',
      obj,
      (dynamic json) => AuthenticationResultDTO.fromJson(json),
    );
  }
}
