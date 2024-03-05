import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_print_company_response_dto.g.dart';
part 'user_print_company_response_dto.freezed.dart';

@unfreezed
sealed class UserPrintCompanyResponseDTO with _$UserPrintCompanyResponseDTO {
  factory UserPrintCompanyResponseDTO({
    required String name,
  }) = _UserPrintCompanyResponseDTO;

  factory UserPrintCompanyResponseDTO.fromJson(Map<String, Object?> json) =>
      _$UserPrintCompanyResponseDTOFromJson(json);

  static UserPrintCompanyResponseDTO copy(UserPrintCompanyResponseDTO obj) =>
      UserPrintCompanyResponseDTO.fromJson(obj.toJson());
}
