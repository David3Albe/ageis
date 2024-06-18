// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_kit_inventario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaKitInventarioModelImpl _$$ConsultaKitInventarioModelImplFromJson(
        Map json) =>
    _$ConsultaKitInventarioModelImpl(
      codDescritorKit: (json['codDescritorKit'] as num?)?.toInt(),
      qtdeKits: (json['qtdeKits'] as num?)?.toInt(),
      qtdeItensPadrao: (json['qtdeItensPadrao'] as num?)?.toInt(),
      qtdeItensFisico: (json['qtdeItensFisico'] as num?)?.toInt(),
      kitDescritor: json['kitDescritor'] == null
          ? null
          : KitDescritorModel.fromJson(
              Map<String, Object?>.from(json['kitDescritor'] as Map)),
    );

Map<String, dynamic> _$$ConsultaKitInventarioModelImplToJson(
        _$ConsultaKitInventarioModelImpl instance) =>
    <String, dynamic>{
      'codDescritorKit': instance.codDescritorKit,
      'qtdeKits': instance.qtdeKits,
      'qtdeItensPadrao': instance.qtdeItensPadrao,
      'qtdeItensFisico': instance.qtdeItensFisico,
      'kitDescritor': instance.kitDescritor?.toJson(),
    };
