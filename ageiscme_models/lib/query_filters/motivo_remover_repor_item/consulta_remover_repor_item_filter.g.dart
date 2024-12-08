// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_remover_repor_item_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaRemoverReporItemFilterImpl
    _$$ConsultaRemoverReporItemFilterImplFromJson(Map json) =>
        _$ConsultaRemoverReporItemFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          startTime: json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          finalTime: json['finalTime'] == null
              ? null
              : DateTime.parse(json['finalTime'] as String),
          codBarraKit: json['codBarraKit'] as String?,
          codBarraKitContem: json['codBarraKitContem'] as String?,
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codBarraItem: json['codBarraItem'] as String?,
          codUsuarioAcao: (json['codUsuarioAcao'] as num?)?.toInt(),
          codMotivo: (json['codMotivo'] as num?)?.toInt(),
          usuario: json['usuario'] == null
              ? null
              : UsuarioDropDownSearchResponseDTO.fromJson(
                  Map<String, Object?>.from(json['usuario'] as Map)),
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaRemoverReporItemFilterImplToJson(
        _$ConsultaRemoverReporItemFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'codBarraKit': instance.codBarraKit,
      'codBarraKitContem': instance.codBarraKitContem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codBarraItem': instance.codBarraItem,
      'codUsuarioAcao': instance.codUsuarioAcao,
      'codMotivo': instance.codMotivo,
      'usuario': instance.usuario?.toJson(),
      'item': instance.item?.toJson(),
    };
