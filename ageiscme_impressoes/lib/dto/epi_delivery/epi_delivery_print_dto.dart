import 'package:ageiscme_impressoes/dto/epi_delivery/epi/epi_delivery_epi_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'epi_delivery_print_dto.g.dart';
part 'epi_delivery_print_dto.freezed.dart';

@unfreezed
sealed class EpiDeliveryPrintDTO with _$EpiDeliveryPrintDTO {
  factory EpiDeliveryPrintDTO({
    required String instituition,
    required String userName,
    required List<EpiDeliveryEpiPrintDTO> epis,
    String? userDoc,
  }) = _EpiDeliveryPrintDTO;

  factory EpiDeliveryPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EpiDeliveryPrintDTOFromJson(json);

  static EpiDeliveryPrintDTO copy(EpiDeliveryPrintDTO obj) =>
      EpiDeliveryPrintDTO.fromJson(obj.toJson());
}
