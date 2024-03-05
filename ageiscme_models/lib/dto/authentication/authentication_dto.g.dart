// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationDTOImpl _$$AuthenticationDTOImplFromJson(Map json) =>
    _$AuthenticationDTOImpl(
      usuario: json['usuario'] as String?,
      senha: json['senha'] as String?,
    );

Map<String, dynamic> _$$AuthenticationDTOImplToJson(
        _$AuthenticationDTOImpl instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'senha': instance.senha,
    };
