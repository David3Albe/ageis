// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_codigo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraCodigoModelImpl _$$ProcessoLeituraCodigoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProcessoLeituraCodigoModelImpl(
      codigoLido: json['codigoLido'] as String?,
      avisosSonoro:
          (json['avisosSonoro'] as List<dynamic>).map((e) => e as int).toList(),
      cancelarLeituras: json['cancelarLeituras'] as bool?,
      leituraFinalizada: json['leituraFinalizada'] as bool?,
      alertaVermelho: json['alertaVermelho'] as bool?,
      fecharTelaExtra: json['fecharTelaExtra'] as bool?,
      tipoAlerta: $enumDecodeNullable(_$TipoAlertaEnumMap, json['tipoAlerta']),
    );

Map<String, dynamic> _$$ProcessoLeituraCodigoModelImplToJson(
        _$ProcessoLeituraCodigoModelImpl instance) =>
    <String, dynamic>{
      'codigoLido': instance.codigoLido,
      'avisosSonoro': instance.avisosSonoro,
      'cancelarLeituras': instance.cancelarLeituras,
      'leituraFinalizada': instance.leituraFinalizada,
      'alertaVermelho': instance.alertaVermelho,
      'fecharTelaExtra': instance.fecharTelaExtra,
      'tipoAlerta': _$TipoAlertaEnumMap[instance.tipoAlerta],
    };

const _$TipoAlertaEnumMap = {
  TipoAlerta.Vermelho: 1,
  TipoAlerta.Laranja: 2,
  TipoAlerta.Amarelo: 3,
};
