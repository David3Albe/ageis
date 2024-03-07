import 'package:ageiscme_impressoes/dto/company_locals_print/company_locals_print_local_dto.dart/company_locals_print_local_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'company_locals_print_dto.g.dart';
part 'company_locals_print_dto.freezed.dart';

@unfreezed
sealed class CompanyLocalsPrintDTO with _$CompanyLocalsPrintDTO {
  factory CompanyLocalsPrintDTO({
    required String companyName,
    required List<CompanyLocalsPrintLocalDTO> locals,
  }) = _CompanyLocalsPrintDTO;

  factory CompanyLocalsPrintDTO.fromJson(Map<String, Object?> json) =>
      _$CompanyLocalsPrintDTOFromJson(json);

  static CompanyLocalsPrintDTO copy(CompanyLocalsPrintDTO obj) =>
      CompanyLocalsPrintDTO.fromJson(obj.toJson());
}
