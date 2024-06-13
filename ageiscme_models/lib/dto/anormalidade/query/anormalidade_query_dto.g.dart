// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_query_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeQueryDTOImpl _$$AnormalidadeQueryDTOImplFromJson(Map json) =>
    _$AnormalidadeQueryDTOImpl(
      gridFilter: json['gridFilter'] == null
          ? null
          : PlutoGridApiModel.fromJson(
              Map<String, Object?>.from(json['gridFilter'] as Map)),
    );

Map<String, dynamic> _$$AnormalidadeQueryDTOImplToJson(
        _$AnormalidadeQueryDTOImpl instance) =>
    <String, dynamic>{
      'gridFilter': instance.gridFilter?.toJson(),
    };
