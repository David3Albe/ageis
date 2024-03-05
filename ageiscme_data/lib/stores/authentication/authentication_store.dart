import 'package:ageiscme_data/local_storage/local_storage.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';

class AuthenticationStore {
  final LocalStorageRepository _localStorageRepository;

  AuthenticationStore(this._localStorageRepository);

  Future<bool> SaveAuthentication(
    final AuthenticationResultDTO authentication,
  ) async {
    return await _localStorageRepository.save(
      AuthenticationResultDTO.storageKey,
      authentication,
    );
  }

  Future<bool> ClearAuthentication() async {
    return await _localStorageRepository.delete(
      AuthenticationResultDTO.storageKey,
    );
  }

  Future<AuthenticationResultDTO?> GetAuthenticated() async {
    return await _localStorageRepository.get<AuthenticationResultDTO>(
      AuthenticationResultDTO.storageKey,
      (dynamic json) => AuthenticationResultDTO.fromJson(json),
    );
  }
}
