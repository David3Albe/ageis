// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_kit_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaKitFilterImpl _$$ConsultaKitFilterImplFromJson(Map json) =>
    _$ConsultaKitFilterImpl(
      codKitDescritor: json['codKitDescritor'] as int?,
      codKit: json['codKit'] as int?,
      codSituacao: json['codSituacao'] as String?,
      codProprietario: json['codProprietario'] as int?,
      codBarraKitContem: json['codBarraKitContem'] as String?,
      kitDescritor: json['kitDescritor'] == null
          ? null
          : KitDescritorDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['kitDescritor'] as Map)),
    );

Map<String, dynamic> _$$ConsultaKitFilterImplToJson(
        _$ConsultaKitFilterImpl instance) =>
    <String, dynamic>{
      'codKitDescritor': instance.codKitDescritor,
      'codKit': instance.codKit,
      'codSituacao': instance.codSituacao,
      'codProprietario': instance.codProprietario,
      'codBarraKitContem': instance.codBarraKitContem,
      'kitDescritor': instance.kitDescritor?.toJson(),
    };
