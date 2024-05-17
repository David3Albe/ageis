// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_historico_colaborador_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaHistoricoColaboradorFilterImpl
    _$$ConsultaHistoricoColaboradorFilterImplFromJson(Map json) =>
        _$ConsultaHistoricoColaboradorFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codUsuario: json['codUsuario'] as int?,
          usuario: json['usuario'] == null
              ? null
              : UsuarioDropDownSearchResponseDTO.fromJson(
                  Map<String, Object?>.from(json['usuario'] as Map)),
        );

Map<String, dynamic> _$$ConsultaHistoricoColaboradorFilterImplToJson(
        _$ConsultaHistoricoColaboradorFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codUsuario': instance.codUsuario,
      'usuario': instance.usuario?.toJson(),
    };
