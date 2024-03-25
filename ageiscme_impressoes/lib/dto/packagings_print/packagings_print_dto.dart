import 'package:ageiscme_impressoes/dto/packagings_print/packaging_print/packagings_packaging_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'packagings_print_dto.g.dart';
part 'packagings_print_dto.freezed.dart';

@unfreezed
sealed class PackagingsPrintDTO with _$PackagingsPrintDTO {
  factory PackagingsPrintDTO({
    required String companyName,
    required int companyCod,
    required List<PackagingsPackagingPrintDTO> packagings,
  }) = _PackagingsPrintDTO;

  factory PackagingsPrintDTO.fromJson(Map<String, Object?> json) =>
      _$PackagingsPrintDTOFromJson(json);

  static PackagingsPrintDTO copy(PackagingsPrintDTO obj) =>
      PackagingsPrintDTO.fromJson(obj.toJson());
}
