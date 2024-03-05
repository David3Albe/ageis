// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_remover_repor_item_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaRemoverReporItemFilterImpl
    _$$ConsultaRemoverReporItemFilterImplFromJson(Map json) =>
        _$ConsultaRemoverReporItemFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codBarraKit: json['codBarraKit'] as String?,
          codBarraItem: json['codBarraItem'] as String?,
          codUsuarioAcao: json['codUsuarioAcao'] as int?,
          codMotivo: json['codMotivo'] as int?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaRemoverReporItemFilterImplToJson(
        _$ConsultaRemoverReporItemFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codBarraKit': instance.codBarraKit,
      'codBarraItem': instance.codBarraItem,
      'codUsuarioAcao': instance.codUsuarioAcao,
      'codMotivo': instance.codMotivo,
      'item': instance.item?.toJson(),
    };
