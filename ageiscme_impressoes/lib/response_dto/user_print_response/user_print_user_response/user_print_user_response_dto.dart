import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_print_user_response_dto.g.dart';
part 'user_print_user_response_dto.freezed.dart';

@unfreezed
sealed class UserPrintUserResponseDTO with _$UserPrintUserResponseDTO {
  factory UserPrintUserResponseDTO({
    required String userName,
    required int rg,
    required int tagId,
  }) = _UserPrintUserResponseDTO;

  factory UserPrintUserResponseDTO.fromJson(Map<String, Object?> json) =>
      _$UserPrintUserResponseDTOFromJson(json);

  static UserPrintUserResponseDTO copy(UserPrintUserResponseDTO obj) =>
      UserPrintUserResponseDTO.fromJson(obj.toJson());
}
