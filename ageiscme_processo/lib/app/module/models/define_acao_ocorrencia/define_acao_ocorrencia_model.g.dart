// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'define_acao_ocorrencia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefineAcaoOcorrenciaModelImpl _$$DefineAcaoOcorrenciaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DefineAcaoOcorrenciaModelImpl(
      codMaterial: (json['codMaterial'] as num?)?.toInt(),
      tipoMaterial: $enumDecodeNullable(
          _$TipoMaterialAcaoOcorrenciaEnumMap, json['tipoMaterial']),
      tipoMotivo: $enumDecodeNullable(
          _$TipoMotivoOcorrenciasEnumMap, json['tipoMotivo']),
      codMotivo: (json['codMotivo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DefineAcaoOcorrenciaModelImplToJson(
        _$DefineAcaoOcorrenciaModelImpl instance) =>
    <String, dynamic>{
      'codMaterial': instance.codMaterial,
      'tipoMaterial':
          _$TipoMaterialAcaoOcorrenciaEnumMap[instance.tipoMaterial],
      'tipoMotivo': _$TipoMotivoOcorrenciasEnumMap[instance.tipoMotivo],
      'codMotivo': instance.codMotivo,
    };

const _$TipoMaterialAcaoOcorrenciaEnumMap = {
  TipoMaterialAcaoOcorrencia.Item: 1,
  TipoMaterialAcaoOcorrencia.Kit: 2,
};

const _$TipoMotivoOcorrenciasEnumMap = {
  TipoMotivoOcorrencias.AcaoOcorrencias: 1,
  TipoMotivoOcorrencias.MotivoNaoCorrecao: 2,
};
