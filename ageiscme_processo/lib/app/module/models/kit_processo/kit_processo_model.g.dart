// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_processo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitProcessoModelImpl _$$KitProcessoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KitProcessoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codBarra: json['codBarra'] as String?,
      codCor1: (json['codCor1'] as num?)?.toInt(),
      codCor2: (json['codCor2'] as num?)?.toInt(),
      codCor3: (json['codCor3'] as num?)?.toInt(),
      codCor4: (json['codCor4'] as num?)?.toInt(),
      status: json['status'] as String?,
      restricao: json['restricao'] as String?,
      codDescritorKit: (json['codDescritorKit'] as num?)?.toInt(),
      codConjunto: (json['codConjunto'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      preparo: json['preparo'] as String?,
      codProcessoLeitura: (json['codProcessoLeitura'] as num?)?.toInt(),
      codEmbalagem: (json['codEmbalagem'] as num?)?.toInt(),
      embalagem: json['embalagem'] == null
          ? null
          : EmbalagemModel.fromJson(json['embalagem'] as Map<String, dynamic>),
      imagem: json['imagem'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tStamp: json['tStamp'] as String?,
      descritor: json['descritor'] == null
          ? null
          : KitDescritorModel.fromJson(
              json['descritor'] as Map<String, dynamic>),
      itens: (json['itens'] as List<dynamic>?)
          ?.map((e) => ItemProcessoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cor1: json['cor1'] == null
          ? null
          : KitCorModel.fromJson(json['cor1'] as Map<String, dynamic>),
      cor2: json['cor2'] == null
          ? null
          : KitCorModel.fromJson(json['cor2'] as Map<String, dynamic>),
      cor3: json['cor3'] == null
          ? null
          : KitCorModel.fromJson(json['cor3'] as Map<String, dynamic>),
      cor4: json['cor4'] == null
          ? null
          : KitCorModel.fromJson(json['cor4'] as Map<String, dynamic>),
      selecionado: json['selecionado'] as bool?,
      statusExpandidos: (json['statusExpandidos'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      codMotivoNaoConforme: (json['codMotivoNaoConforme'] as num?)?.toInt(),
      codEtapa: (json['codEtapa'] as num?)?.toInt(),
      validacoesCompletas: (json['validacoesCompletas'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      codMotivoRetornoArsenal:
          (json['codMotivoRetornoArsenal'] as num?)?.toInt(),
      codUsuarioQuebraFluxo: (json['codUsuarioQuebraFluxo'] as num?)?.toInt(),
      usuarioQuebraFluxo: json['usuarioQuebraFluxo'] == null
          ? null
          : UsuarioModel.fromJson(
              json['usuarioQuebraFluxo'] as Map<String, dynamic>),
      codMotivoQuebraFluxo: (json['codMotivoQuebraFluxo'] as num?)?.toInt(),
      prioridade: (json['prioridade'] as num?)?.toInt(),
      dataValidadeRetornoArsenal: json['dataValidadeRetornoArsenal'] == null
          ? null
          : DateTime.parse(json['dataValidadeRetornoArsenal'] as String),
      preparoInicioLeitura: json['preparoInicioLeitura'] as String?,
      codUsuarioLiberacao: (json['codUsuarioLiberacao'] as num?)?.toInt(),
      conferidoVisualmente: json['conferidoVisualmente'] as bool?,
      liberadoIncompleto: json['liberadoIncompleto'] as bool?,
      impressaoPreparoRealizada: json['impressaoPreparoRealizada'] as bool?,
      sequenciaValida: json['sequenciaValida'] as bool?,
      impressaoEtiquetaLoteRealizada:
          json['impressaoEtiquetaLoteRealizada'] as bool?,
      impressaoRelatorioRetiradaRealizada:
          json['impressaoRelatorioRetiradaRealizada'] as bool?,
      codUsuarioAcaoOcorrencia:
          (json['codUsuarioAcaoOcorrencia'] as num?)?.toInt(),
      codAcaoOcorrencia: (json['codAcaoOcorrencia'] as num?)?.toInt(),
      itensLidosCalculado: (json['itensLidosCalculado'] as num?)?.toInt(),
      itensTotalKitCalculado: (json['itensTotalKitCalculado'] as num?)?.toInt(),
      codLocalizacaoEstoque: (json['codLocalizacaoEstoque'] as num?)?.toInt(),
      confirmouLocalNaoCompativel: json['confirmouLocalNaoCompativel'] as bool?,
    );

Map<String, dynamic> _$$KitProcessoModelImplToJson(
        _$KitProcessoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'codCor1': instance.codCor1,
      'codCor2': instance.codCor2,
      'codCor3': instance.codCor3,
      'codCor4': instance.codCor4,
      'status': instance.status,
      'restricao': instance.restricao,
      'codDescritorKit': instance.codDescritorKit,
      'codConjunto': instance.codConjunto,
      'codInstituicao': instance.codInstituicao,
      'preparo': instance.preparo,
      'codProcessoLeitura': instance.codProcessoLeitura,
      'codEmbalagem': instance.codEmbalagem,
      'embalagem': instance.embalagem,
      'imagem': instance.imagem,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tStamp,
      'descritor': instance.descritor,
      'itens': instance.itens,
      'cor1': instance.cor1,
      'cor2': instance.cor2,
      'cor3': instance.cor3,
      'cor4': instance.cor4,
      'selecionado': instance.selecionado,
      'statusExpandidos': instance.statusExpandidos,
      'codMotivoNaoConforme': instance.codMotivoNaoConforme,
      'codEtapa': instance.codEtapa,
      'validacoesCompletas': instance.validacoesCompletas,
      'codMotivoRetornoArsenal': instance.codMotivoRetornoArsenal,
      'codUsuarioQuebraFluxo': instance.codUsuarioQuebraFluxo,
      'usuarioQuebraFluxo': instance.usuarioQuebraFluxo,
      'codMotivoQuebraFluxo': instance.codMotivoQuebraFluxo,
      'prioridade': instance.prioridade,
      'dataValidadeRetornoArsenal':
          instance.dataValidadeRetornoArsenal?.toIso8601String(),
      'preparoInicioLeitura': instance.preparoInicioLeitura,
      'codUsuarioLiberacao': instance.codUsuarioLiberacao,
      'conferidoVisualmente': instance.conferidoVisualmente,
      'liberadoIncompleto': instance.liberadoIncompleto,
      'impressaoPreparoRealizada': instance.impressaoPreparoRealizada,
      'sequenciaValida': instance.sequenciaValida,
      'impressaoEtiquetaLoteRealizada': instance.impressaoEtiquetaLoteRealizada,
      'impressaoRelatorioRetiradaRealizada':
          instance.impressaoRelatorioRetiradaRealizada,
      'codUsuarioAcaoOcorrencia': instance.codUsuarioAcaoOcorrencia,
      'codAcaoOcorrencia': instance.codAcaoOcorrencia,
      'itensLidosCalculado': instance.itensLidosCalculado,
      'itensTotalKitCalculado': instance.itensTotalKitCalculado,
      'codLocalizacaoEstoque': instance.codLocalizacaoEstoque,
      'confirmouLocalNaoCompativel': instance.confirmouLocalNaoCompativel,
    };
