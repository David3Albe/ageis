import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_tag_print_dto.g.dart';
part 'user_tag_print_dto.freezed.dart';

@unfreezed
sealed class UserTagPrintDTO with _$UserTagPrintDTO {
  factory UserTagPrintDTO({
    required int tagId,
    required String userName,
  }) = _UserTagPrintDTO;

  factory UserTagPrintDTO.fromJson(Map<String, Object?> json) =>
      _$UserTagPrintDTOFromJson(json);

  static UserTagPrintDTO copy(UserTagPrintDTO obj) =>
      UserTagPrintDTO.fromJson(obj.toJson());
}
