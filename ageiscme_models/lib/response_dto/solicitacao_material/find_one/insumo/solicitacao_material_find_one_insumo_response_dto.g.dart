// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_find_one_insumo_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialFindOneInsumoResponseDTOImpl
    _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplFromJson(Map json) =>
        _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          nome: json['nome'] as String,
          codBarra: (json['codBarra'] as num).toInt(),
          unidadeMedida: json['unidadeMedida'] as String?,
        );

Map<String, dynamic> _$$SolicitacaoMaterialFindOneInsumoResponseDTOImplToJson(
        _$SolicitacaoMaterialFindOneInsumoResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codBarra': instance.codBarra,
      'unidadeMedida': instance.unidadeMedida,
    };
