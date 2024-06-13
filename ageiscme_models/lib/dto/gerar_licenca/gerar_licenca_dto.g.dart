// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gerar_licenca_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GerarLicencaDTOImpl _$$GerarLicencaDTOImplFromJson(Map json) =>
    _$GerarLicencaDTOImpl(
      nomeCliente: json['nomeCliente'] as String?,
      emailCliente: json['emailCliente'] as String?,
      validadeAte: json['validadeAte'] == null
          ? null
          : DateTime.parse(json['validadeAte'] as String),
      servidorPrimario: json['servidorPrimario'] as String?,
      servidorSecundario: json['servidorSecundario'] as String?,
      contemRelatorio: json['contemRelatorio'] as bool?,
      contemAdmin: json['contemAdmin'] as bool?,
      contemProcesso: json['contemProcesso'] as bool?,
      contemAdminV2: json['contemAdminV2'] as bool?,
      contemProcessoV2: json['contemProcessoV2'] as bool?,
    );

Map<String, dynamic> _$$GerarLicencaDTOImplToJson(
        _$GerarLicencaDTOImpl instance) =>
    <String, dynamic>{
      'nomeCliente': instance.nomeCliente,
      'emailCliente': instance.emailCliente,
      'validadeAte': instance.validadeAte?.toIso8601String(),
      'servidorPrimario': instance.servidorPrimario,
      'servidorSecundario': instance.servidorSecundario,
      'contemRelatorio': instance.contemRelatorio,
      'contemAdmin': instance.contemAdmin,
      'contemProcesso': instance.contemProcesso,
      'contemAdminV2': instance.contemAdminV2,
      'contemProcessoV2': instance.contemProcessoV2,
    };
