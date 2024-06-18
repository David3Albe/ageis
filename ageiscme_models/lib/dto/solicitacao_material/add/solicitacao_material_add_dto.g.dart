// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_add_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialAddDTOImpl _$$SolicitacaoMaterialAddDTOImplFromJson(
        Map json) =>
    _$SolicitacaoMaterialAddDTOImpl(
      codUsuarioSolicitante: (json['codUsuarioSolicitante'] as num).toInt(),
      situacao: (json['situacao'] as num).toInt(),
      solicitacoesMateriais: (json['solicitacoesMateriais'] as List<dynamic>)
          .map((e) => SolicitacaoMaterialItemModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      codBarraUsuarioAutorizacao: json['codBarraUsuarioAutorizacao'] as String?,
    );

Map<String, dynamic> _$$SolicitacaoMaterialAddDTOImplToJson(
        _$SolicitacaoMaterialAddDTOImpl instance) =>
    <String, dynamic>{
      'codUsuarioSolicitante': instance.codUsuarioSolicitante,
      'situacao': instance.situacao,
      'solicitacoesMateriais':
          instance.solicitacoesMateriais.map((e) => e.toJson()).toList(),
      'codBarraUsuarioAutorizacao': instance.codBarraUsuarioAutorizacao,
    };
