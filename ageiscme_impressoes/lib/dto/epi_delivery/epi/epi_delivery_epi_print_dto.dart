import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'epi_delivery_epi_print_dto.g.dart';
part 'epi_delivery_epi_print_dto.freezed.dart';

@unfreezed
sealed class EpiDeliveryEpiPrintDTO with _$EpiDeliveryEpiPrintDTO {
  factory EpiDeliveryEpiPrintDTO({
    required String description,
    String? CANumber,
    DateTime? validity,
  }) = _EpiDeliveryEpiPrintDTO;

  factory EpiDeliveryEpiPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EpiDeliveryEpiPrintDTOFromJson(json);

  static EpiDeliveryEpiPrintDTO copy(EpiDeliveryEpiPrintDTO obj) =>
      EpiDeliveryEpiPrintDTO.fromJson(obj.toJson());
}
