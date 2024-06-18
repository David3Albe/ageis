// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_etapa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraEtapaModelImpl
    _$$ConsultaProcessosLeituraEtapaModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraEtapaModelImpl(
          cod: (json['cod'] as num).toInt(),
          nome: json['nome'] as String?,
          codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
          codTipoProcesso: (json['codTipoProcesso'] as num?)?.toInt(),
          imprimirEtiquetaLote: json['imprimirEtiquetaLote'] as bool?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraEtapaModelImplToJson(
        _$ConsultaProcessosLeituraEtapaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codEquipamento': instance.codEquipamento,
      'codTipoProcesso': instance.codTipoProcesso,
      'imprimirEtiquetaLote': instance.imprimirEtiquetaLote,
    };
