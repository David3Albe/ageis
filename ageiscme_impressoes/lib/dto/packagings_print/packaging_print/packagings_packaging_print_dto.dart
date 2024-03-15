import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'packagings_packaging_print_dto.g.dart';
part 'packagings_packaging_print_dto.freezed.dart';

@unfreezed
sealed class PackagingsPackagingPrintDTO with _$PackagingsPackagingPrintDTO {
  factory PackagingsPackagingPrintDTO({
    required String name,
    required int tagId,
    required bool selected,
  }) = _PackagingsPackagingPrintDTO;

  factory PackagingsPackagingPrintDTO.fromJson(Map<String, Object?> json) =>
      _$PackagingsPackagingPrintDTOFromJson(json);

  static PackagingsPackagingPrintDTO copy(PackagingsPackagingPrintDTO obj) =>
      PackagingsPackagingPrintDTO.fromJson(obj.toJson());
}
