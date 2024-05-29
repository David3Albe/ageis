// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'consignments_withdrawal_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsignmentsWithdrawalPrintDTOImpl
    _$$ConsignmentsWithdrawalPrintDTOImplFromJson(Map json) =>
        _$ConsignmentsWithdrawalPrintDTOImpl(
          instituitionName: json['instituitionName'] as String,
          doctorName: json['doctorName'] as String,
          deliveryResponsibleName: json['deliveryResponsibleName'] as String,
          withdrawalResponsibleName:
              json['withdrawalResponsibleName'] as String,
          items: (json['items'] as List<dynamic>).map((e) =>
              ConsignmentsWithdrawalConsignmentPrintDTO.fromJson(
                  Map<String, Object?>.from(e as Map))),
        );

Map<String, dynamic> _$$ConsignmentsWithdrawalPrintDTOImplToJson(
        _$ConsignmentsWithdrawalPrintDTOImpl instance) =>
    <String, dynamic>{
      'instituitionName': instance.instituitionName,
      'doctorName': instance.doctorName,
      'deliveryResponsibleName': instance.deliveryResponsibleName,
      'withdrawalResponsibleName': instance.withdrawalResponsibleName,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
