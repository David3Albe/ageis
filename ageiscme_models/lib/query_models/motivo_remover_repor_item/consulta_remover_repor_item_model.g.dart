// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_remover_repor_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaRemoverReporItemModelImpl
    _$$ConsultaRemoverReporItemModelImplFromJson(Map json) =>
        _$ConsultaRemoverReporItemModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          kit: json['kit'] == null
              ? null
              : KitModel.fromJson(
                  Map<String, Object?>.from(json['kit'] as Map)),
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
          usuario: json['usuario'] == null
              ? null
              : UsuarioModel.fromJson(
                  Map<String, Object?>.from(json['usuario'] as Map)),
          autorizadoPor: json['autorizadoPor'] == null
              ? null
              : UsuarioModel.fromJson(
                  Map<String, Object?>.from(json['autorizadoPor'] as Map)),
          motivoReporRemoverItem: MotivoRemoverReporItemModel.fromJson(
              Map<String, Object?>.from(json['motivoReporRemoverItem'] as Map)),
          tipo: json['tipo'] as String?,
        );

Map<String, dynamic> _$$ConsultaRemoverReporItemModelImplToJson(
        _$ConsultaRemoverReporItemModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'kit': instance.kit?.toJson(),
      'item': instance.item?.toJson(),
      'usuario': instance.usuario?.toJson(),
      'autorizadoPor': instance.autorizadoPor?.toJson(),
      'motivoReporRemoverItem': instance.motivoReporRemoverItem.toJson(),
      'tipo': instance.tipo,
    };
