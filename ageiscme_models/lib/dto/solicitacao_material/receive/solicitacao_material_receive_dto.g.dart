// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_receive_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialReceiveDTOImpl
    _$$SolicitacaoMaterialReceiveDTOImplFromJson(Map json) =>
        _$SolicitacaoMaterialReceiveDTOImpl(
          cod: json['cod'] as int,
          codBarraUsuarioRecebedor: json['codBarraUsuarioRecebedor'] as String,
          codUsuarioEntrega: json['codUsuarioEntrega'] as int,
        );

Map<String, dynamic> _$$SolicitacaoMaterialReceiveDTOImplToJson(
        _$SolicitacaoMaterialReceiveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarraUsuarioRecebedor': instance.codBarraUsuarioRecebedor,
      'codUsuarioEntrega': instance.codUsuarioEntrega,
    };
