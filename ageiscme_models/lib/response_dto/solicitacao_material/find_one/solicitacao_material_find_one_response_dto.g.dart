// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_find_one_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialFindOneResponseDTOImpl
    _$$SolicitacaoMaterialFindOneResponseDTOImplFromJson(Map json) =>
        _$SolicitacaoMaterialFindOneResponseDTOImpl(
          solicitacao: json['solicitacao'] == null
              ? null
              : SolicitacaoMaterialModel.fromJson(
                  Map<String, Object?>.from(json['solicitacao'] as Map)),
          usuarios: (json['usuarios'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                SolicitacaoMaterialFindOneUsuarioResponseDTO.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          equipamentos: (json['equipamentos'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                SolicitacaoMaterialFindOneEquipamentoResponseDTO.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          insumos: (json['insumos'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                SolicitacaoMaterialFindOneInsumoResponseDTO.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
        );

Map<String, dynamic> _$$SolicitacaoMaterialFindOneResponseDTOImplToJson(
        _$SolicitacaoMaterialFindOneResponseDTOImpl instance) =>
    <String, dynamic>{
      'solicitacao': instance.solicitacao?.toJson(),
      'usuarios':
          instance.usuarios.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'equipamentos': instance.equipamentos
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'insumos':
          instance.insumos.map((k, e) => MapEntry(k.toString(), e.toJson())),
    };
