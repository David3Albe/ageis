import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments/consignments_withdrawal_consignment_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'consignments_withdrawal_print_dto.g.dart';
part 'consignments_withdrawal_print_dto.freezed.dart';

@unfreezed
sealed class ConsignmentsWithdrawalPrintDTO with _$ConsignmentsWithdrawalPrintDTO {
  factory ConsignmentsWithdrawalPrintDTO({
    required String instituitionName,
    required String doctorName,
    required String deliveryResponsibleName,
    required String withdrawalResponsibleName,
    required Iterable<ConsignmentsWithdrawalConsignmentPrintDTO> items,
  }) = _ConsignmentsWithdrawalPrintDTO;

  factory ConsignmentsWithdrawalPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ConsignmentsWithdrawalPrintDTOFromJson(json);

  static ConsignmentsWithdrawalPrintDTO copy(ConsignmentsWithdrawalPrintDTO obj) =>
      ConsignmentsWithdrawalPrintDTO.fromJson(obj.toJson());
}
