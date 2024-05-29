// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'consignments_withdrawal_consignment_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsignmentsWithdrawalConsignmentPrintDTOImpl
    _$$ConsignmentsWithdrawalConsignmentPrintDTOImplFromJson(Map json) =>
        _$ConsignmentsWithdrawalConsignmentPrintDTOImpl(
          prontuary: json['prontuary'] as String?,
          tagId: json['tagId'] as String,
          name: json['name'] as String,
          consignedItemId: json['consignedItemId'] as int,
          consignedItemDescription: json['consignedItemDescription'] as String,
          received: json['received'] as int,
          consumed: json['consumed'] as int,
        );

Map<String, dynamic> _$$ConsignmentsWithdrawalConsignmentPrintDTOImplToJson(
        _$ConsignmentsWithdrawalConsignmentPrintDTOImpl instance) =>
    <String, dynamic>{
      'prontuary': instance.prontuary,
      'tagId': instance.tagId,
      'name': instance.name,
      'consignedItemId': instance.consignedItemId,
      'consignedItemDescription': instance.consignedItemDescription,
      'received': instance.received,
      'consumed': instance.consumed,
    };
