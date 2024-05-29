import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'consignments_withdrawal_consignment_print_dto.g.dart';
part 'consignments_withdrawal_consignment_print_dto.freezed.dart';

@unfreezed
sealed class ConsignmentsWithdrawalConsignmentPrintDTO with _$ConsignmentsWithdrawalConsignmentPrintDTO {
  factory ConsignmentsWithdrawalConsignmentPrintDTO({
    String? prontuary,
    required String tagId,
    required String name,
    required int consignedItemId,
    required String consignedItemDescription,
    required int received,
    required int consumed,
  }) = _ConsignmentsWithdrawalConsignmentPrintDTO;

  factory ConsignmentsWithdrawalConsignmentPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ConsignmentsWithdrawalConsignmentPrintDTOFromJson(json);

  static ConsignmentsWithdrawalConsignmentPrintDTO copy(ConsignmentsWithdrawalConsignmentPrintDTO obj) =>
      ConsignmentsWithdrawalConsignmentPrintDTO.fromJson(obj.toJson());
}
