// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoFilterImpl _$$InsumoFilterImplFromJson(Map json) => _$InsumoFilterImpl(
      codigos:
          (json['codigos'] as List<dynamic>?)?.map((e) => e as int).toList(),
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeAsc: json['ordenarPorNomeAsc'] as bool?,
    );

Map<String, dynamic> _$$InsumoFilterImplToJson(_$InsumoFilterImpl instance) =>
    <String, dynamic>{
      'codigos': instance.codigos,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeAsc': instance.ordenarPorNomeAsc,
    };
