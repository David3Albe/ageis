// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationResultDTOImpl _$$AuthenticationResultDTOImplFromJson(
        Map json) =>
    _$AuthenticationResultDTOImpl(
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      instituicao: json['instituicao'] == null
          ? null
          : InstituicaoModel.fromJson(
              Map<String, Object?>.from(json['instituicao'] as Map)),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$AuthenticationResultDTOImplToJson(
        _$AuthenticationResultDTOImpl instance) =>
    <String, dynamic>{
      'usuario': instance.usuario?.toJson(),
      'instituicao': instance.instituicao?.toJson(),
      'token': instance.token,
    };
