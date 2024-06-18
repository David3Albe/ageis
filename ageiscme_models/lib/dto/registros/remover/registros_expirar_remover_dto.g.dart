// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registros_expirar_remover_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrosExpirarRemoverDTOImpl _$$RegistrosExpirarRemoverDTOImplFromJson(
        Map json) =>
    _$RegistrosExpirarRemoverDTOImpl(
      codUsuario: (json['codUsuario'] as num).toInt(),
      registros: (json['registros'] as List<dynamic>)
          .map((e) => RegistrosExpirarRemoverRegistroDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$RegistrosExpirarRemoverDTOImplToJson(
        _$RegistrosExpirarRemoverDTOImpl instance) =>
    <String, dynamic>{
      'codUsuario': instance.codUsuario,
      'registros': instance.registros.map((e) => e.toJson()).toList(),
    };
