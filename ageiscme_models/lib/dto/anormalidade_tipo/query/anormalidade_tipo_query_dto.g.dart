// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_tipo_query_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeTipoQueryDTOImpl _$$AnormalidadeTipoQueryDTOImplFromJson(
        Map json) =>
    _$AnormalidadeTipoQueryDTOImpl(
      gridFilter: json['gridFilter'] == null
          ? null
          : PlutoGridApiModel.fromJson(
              Map<String, Object?>.from(json['gridFilter'] as Map)),
    );

Map<String, dynamic> _$$AnormalidadeTipoQueryDTOImplToJson(
        _$AnormalidadeTipoQueryDTOImpl instance) =>
    <String, dynamic>{
      'gridFilter': instance.gridFilter?.toJson(),
    };
