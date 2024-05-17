// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraResponseModelImpl
    _$$ConsultaProcessosLeituraResponseModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraResponseModelImpl(
          leituras: (json['leituras'] as List<dynamic>)
              .map((e) => ConsultaProcessosLeituraModel.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
          kits: (json['kits'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraKitModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          prioridades: (json['prioridades'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraPrioridadeModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          tiposProcesso: (json['tiposProcesso'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraTipoProcessoModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          usuarios: (json['usuarios'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraUsuarioModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          items: (json['items'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraItemModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          proprietarios: (json['proprietarios'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraProprietarioModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          etapas: (json['etapas'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraEtapaModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          locais: (json['locais'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraLocalModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          embalagens: (json['embalagens'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraEmbalagemModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          motivos: (json['motivos'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraMotivoModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          motivosQuebraFluxo: (json['motivosQuebraFluxo'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraMotivoQuebraFluxoModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
          equipamentos: (json['equipamentos'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                ConsultaProcessosLeituraEquipamentoModel.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraResponseModelImplToJson(
        _$ConsultaProcessosLeituraResponseModelImpl instance) =>
    <String, dynamic>{
      'leituras': instance.leituras.map((e) => e.toJson()).toList(),
      'kits': instance.kits.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'prioridades': instance.prioridades
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'tiposProcesso': instance.tiposProcesso
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'usuarios':
          instance.usuarios.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'items': instance.items.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'proprietarios': instance.proprietarios
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'etapas':
          instance.etapas.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'locais':
          instance.locais.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'embalagens':
          instance.embalagens.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'motivos':
          instance.motivos.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'motivosQuebraFluxo': instance.motivosQuebraFluxo
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'equipamentos': instance.equipamentos
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
    };
