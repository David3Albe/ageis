// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_inventario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemInventarioModelImpl _$$ConsultaItemInventarioModelImplFromJson(
        Map json) =>
    _$ConsultaItemInventarioModelImpl(
      codItemDescritor: json['codItemDescritor'] as int?,
      descricaoCurta: json['descricaoCurta'] as String?,
      descricao: json['descricao'] as String?,
      qtdeCodDescritor: json['qtdeCodDescritor'] as int?,
      valorItem: (json['valorItem'] as num?)?.toDouble(),
      nomeGrupo: json['nomeGrupo'] as String?,
      nomeProcessoNormal: json['nomeProcessoNormal'] as String?,
      nomeProcessoUrgencia: json['nomeProcessoUrgencia'] as String?,
      nomeProcessoEmergencia: json['nomeProcessoEmergencia'] as String?,
      nomeProprietario: json['nomeProprietario'] as String?,
      situacao: json['situacao'] as String?,
    );

Map<String, dynamic> _$$ConsultaItemInventarioModelImplToJson(
        _$ConsultaItemInventarioModelImpl instance) =>
    <String, dynamic>{
      'codItemDescritor': instance.codItemDescritor,
      'descricaoCurta': instance.descricaoCurta,
      'descricao': instance.descricao,
      'qtdeCodDescritor': instance.qtdeCodDescritor,
      'valorItem': instance.valorItem,
      'nomeGrupo': instance.nomeGrupo,
      'nomeProcessoNormal': instance.nomeProcessoNormal,
      'nomeProcessoUrgencia': instance.nomeProcessoUrgencia,
      'nomeProcessoEmergencia': instance.nomeProcessoEmergencia,
      'nomeProprietario': instance.nomeProprietario,
      'situacao': instance.situacao,
    };
