import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'monitoring_print_dto.g.dart';
part 'monitoring_print_dto.freezed.dart';

@unfreezed
sealed class MonitoringPrintDTO with _$MonitoringPrintDTO {
  factory MonitoringPrintDTO({
    required int cod,
    required int companyCod,
    required String companyName,
    required DateTime dataAtual,
    required String userName,
    required String serviceTypeName,
    String? userDocClasse,
    String? equipamentCod,
    String? equipamentName,
    String? itemCod,
    String? itemName,
  }) = _MonitoringPrintDTO;

  factory MonitoringPrintDTO.fromJson(Map<String, Object?> json) =>
      _$MonitoringPrintDTOFromJson(json);

  static MonitoringPrintDTO copy(MonitoringPrintDTO obj) =>
      MonitoringPrintDTO.fromJson(obj.toJson());
}
