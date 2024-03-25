// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'folha_rotulado_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolhaRotuladoPrintDTOImpl _$$FolhaRotuladoPrintDTOImplFromJson(Map json) =>
    _$FolhaRotuladoPrintDTOImpl(
      itensPorTipo: (json['itensPorTipo'] as Map).map(
        (k, e) => MapEntry(
            k as String,
            (e as List<dynamic>)
                .map((e) => FolhaRotuladoItemPrintDTO.fromJson(
                    Map<String, Object?>.from(e as Map)))
                .toList()),
      ),
    );

Map<String, dynamic> _$$FolhaRotuladoPrintDTOImplToJson(
        _$FolhaRotuladoPrintDTOImpl instance) =>
    <String, dynamic>{
      'itensPorTipo': instance.itensPorTipo
          .map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
    };
