import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_print_dto.g.dart';
part 'user_print_dto.freezed.dart';

@unfreezed
sealed class UserPrintDTO with _$UserPrintDTO {
  factory UserPrintDTO({
    required bool actives,
    required bool inactives,
  }) = _UserPrintDTO;

  factory UserPrintDTO.fromJson(Map<String, Object?> json) =>
      _$UserPrintDTOFromJson(json);

  static UserPrintDTO copy(UserPrintDTO obj) =>
      UserPrintDTO.fromJson(obj.toJson());
}
