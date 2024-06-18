// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumos_por_equipamento_simplificado_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumosPorEquipamentoSimplificadoResponseDTOImpl
    _$$InsumosPorEquipamentoSimplificadoResponseDTOImplFromJson(Map json) =>
        _$InsumosPorEquipamentoSimplificadoResponseDTOImpl(
          equipamentoInsumos: (json['equipamentoInsumos'] as Map).map(
            (k, e) => MapEntry(int.parse(k as String),
                (e as List<dynamic>).map((e) => (e as num).toInt()).toList()),
          ),
        );

Map<String, dynamic> _$$InsumosPorEquipamentoSimplificadoResponseDTOImplToJson(
        _$InsumosPorEquipamentoSimplificadoResponseDTOImpl instance) =>
    <String, dynamic>{
      'equipamentoInsumos':
          instance.equipamentoInsumos.map((k, e) => MapEntry(k.toString(), e)),
    };
