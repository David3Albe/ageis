import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_impressoes/dto/user_print/user_print_dto.dart';
import 'package:ageiscme_impressoes/response_dto/user_print_response/user_print_response_dto.dart';

class UserPrintService {
  final CustomDio _client = CustomDio();

  UserPrintService();

  Future<(String message, UserPrintResponseDTO usuario)?> findData(
    UserPrintDTO obj,
  ) async {
    return await _client.post(
      '/user-print',
      obj,
      (dynamic json) => UserPrintResponseDTO.fromJson(json),
    );
  }
}
