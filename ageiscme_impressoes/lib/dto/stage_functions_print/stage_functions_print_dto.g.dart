// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'stage_functions_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StageFunctionsPrintDTOImpl _$$StageFunctionsPrintDTOImplFromJson(Map json) =>
    _$StageFunctionsPrintDTOImpl(
      stageCod: (json['stageCod'] as num).toInt(),
      instituitionName: json['instituitionName'] as String?,
      instituitionCod: (json['instituitionCod'] as num?)?.toInt(),
      localName: json['localName'] as String?,
      localTag: json['localTag'] as String?,
      printTagLocal: json['printTagLocal'] as bool?,
      entry: json['entry'] as bool?,
      exit: json['exit'] as bool?,
      finish: json['finish'] as bool?,
      generateLabel: json['generateLabel'] as bool?,
      cancel1Item: json['cancel1Item'] as bool?,
      cancelReadings: json['cancelReadings'] as bool?,
      yesNo: json['yesNo'] as bool?,
      normalPriority: json['normalPriority'] as bool?,
      urgentPriority: json['urgentPriority'] as bool?,
      transfer: json['transfer'] as bool?,
      receive: json['receive'] as bool?,
      zoom: json['zoom'] as bool?,
    );

Map<String, dynamic> _$$StageFunctionsPrintDTOImplToJson(
        _$StageFunctionsPrintDTOImpl instance) =>
    <String, dynamic>{
      'stageCod': instance.stageCod,
      'instituitionName': instance.instituitionName,
      'instituitionCod': instance.instituitionCod,
      'localName': instance.localName,
      'localTag': instance.localTag,
      'printTagLocal': instance.printTagLocal,
      'entry': instance.entry,
      'exit': instance.exit,
      'finish': instance.finish,
      'generateLabel': instance.generateLabel,
      'cancel1Item': instance.cancel1Item,
      'cancelReadings': instance.cancelReadings,
      'yesNo': instance.yesNo,
      'normalPriority': instance.normalPriority,
      'urgentPriority': instance.urgentPriority,
      'transfer': instance.transfer,
      'receive': instance.receive,
      'zoom': instance.zoom,
    };
