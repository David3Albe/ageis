import 'package:ageiscme_impressoes/response_dto/user_print_response/user_print_company_response/user_print_company_response_dto.dart';
import 'package:ageiscme_impressoes/response_dto/user_print_response/user_print_user_response/user_print_user_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_print_response_dto.g.dart';
part 'user_print_response_dto.freezed.dart';

@unfreezed
sealed class UserPrintResponseDTO with _$UserPrintResponseDTO {
  factory UserPrintResponseDTO({
    required List<UserPrintUserResponseDTO> users,
    required UserPrintCompanyResponseDTO company,
  }) = _UserPrintResponseDTO;

  factory UserPrintResponseDTO.fromJson(Map<String, Object?> json) =>
      _$UserPrintResponseDTOFromJson(json);

  static UserPrintResponseDTO copy(UserPrintResponseDTO obj) =>
      UserPrintResponseDTO.fromJson(obj.toJson());
}
