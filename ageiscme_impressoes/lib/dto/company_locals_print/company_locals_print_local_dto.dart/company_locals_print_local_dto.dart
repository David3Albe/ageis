import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'company_locals_print_local_dto.g.dart';
part 'company_locals_print_local_dto.freezed.dart';

@unfreezed
sealed class CompanyLocalsPrintLocalDTO with _$CompanyLocalsPrintLocalDTO {
  factory CompanyLocalsPrintLocalDTO({
    required String name,
    required String tagId,
    required bool selected,
  }) = _CompanyLocalsPrintLocalDTO;

  factory CompanyLocalsPrintLocalDTO.fromJson(Map<String, Object?> json) =>
      _$CompanyLocalsPrintLocalDTOFromJson(json);

  static CompanyLocalsPrintLocalDTO copy(CompanyLocalsPrintLocalDTO obj) =>
      CompanyLocalsPrintLocalDTO.fromJson(obj.toJson());
}
