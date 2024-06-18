// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_entrada_automatica_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraEntradaAutomaticaModelImpl
    _$$ConsultaProcessosLeituraEntradaAutomaticaModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraEntradaAutomaticaModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
          codEntradaAut: (json['codEntradaAut'] as num?)?.toInt(),
          situacao: json['situacao'] as String?,
          observacao: json['observacao'] as String?,
          codBarraKit: json['codBarraKit'] as String?,
          nomeKit: json['nomeKit'] as String?,
          idEtiqueta: json['idEtiqueta'] as String?,
          descricaoItem: json['descricaoItem'] as String?,
          nomeProprietario: json['nomeProprietario'] as String?,
          entradaSaida: json['entradaSaida'] as String?,
          nomeEquipamento: json['nomeEquipamento'] as String?,
          nomeEtapaProcesso: json['nomeEtapaProcesso'] as String?,
          nomeTipoProcesso: json['nomeTipoProcesso'] as String?,
          nivelPrioridade: json['nivelPrioridade'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
          prontuario: json['prontuario'] as String?,
          origem: json['origem'] as String?,
          destino: json['destino'] as String?,
          circulante: json['circulante'] as String?,
          confVisual: json['confVisual'] as String?,
          nomeRespLibKitIncomp: json['nomeRespLibKitIncomp'] as String?,
          nomeRespLibQuebFluxo: json['nomeRespLibQuebFluxo'] as String?,
          indicador: json['indicador'] as String?,
          lote: json['lote'] as String?,
          embalagem: json['embalagem'] as String?,
          codItem: (json['codItem'] as num?)?.toInt(),
          codKit2: (json['codKit2'] as num?)?.toInt(),
          codEtapaProcesso: (json['codEtapaProcesso'] as num?)?.toInt(),
          codLeitura: (json['codLeitura'] as num?)?.toInt(),
          motivo: json['motivo'] as String?,
          motivoQuebraFluxo: json['motivoQuebraFluxo'] as String?,
          observacoes: json['observacoes'] as String?,
          cancelar: json['cancelar'] as bool?,
        );

Map<String, dynamic>
    _$$ConsultaProcessosLeituraEntradaAutomaticaModelImplToJson(
            _$ConsultaProcessosLeituraEntradaAutomaticaModelImpl instance) =>
        <String, dynamic>{
          'dataHora': instance.dataHora?.toIso8601String(),
          'codRegistroProcesso': instance.codRegistroProcesso,
          'codEntradaAut': instance.codEntradaAut,
          'situacao': instance.situacao,
          'observacao': instance.observacao,
          'codBarraKit': instance.codBarraKit,
          'nomeKit': instance.nomeKit,
          'idEtiqueta': instance.idEtiqueta,
          'descricaoItem': instance.descricaoItem,
          'nomeProprietario': instance.nomeProprietario,
          'entradaSaida': instance.entradaSaida,
          'nomeEquipamento': instance.nomeEquipamento,
          'nomeEtapaProcesso': instance.nomeEtapaProcesso,
          'nomeTipoProcesso': instance.nomeTipoProcesso,
          'nivelPrioridade': instance.nivelPrioridade,
          'nomeUsuario': instance.nomeUsuario,
          'prontuario': instance.prontuario,
          'origem': instance.origem,
          'destino': instance.destino,
          'circulante': instance.circulante,
          'confVisual': instance.confVisual,
          'nomeRespLibKitIncomp': instance.nomeRespLibKitIncomp,
          'nomeRespLibQuebFluxo': instance.nomeRespLibQuebFluxo,
          'indicador': instance.indicador,
          'lote': instance.lote,
          'embalagem': instance.embalagem,
          'codItem': instance.codItem,
          'codKit2': instance.codKit2,
          'codEtapaProcesso': instance.codEtapaProcesso,
          'codLeitura': instance.codLeitura,
          'motivo': instance.motivo,
          'motivoQuebraFluxo': instance.motivoQuebraFluxo,
          'observacoes': instance.observacoes,
          'cancelar': instance.cancelar,
        };
