import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_consignado/item_consignado_model.dart';
import 'package:ageiscme_processo/app/module/models/calculadora_item/calculadora_item_model.dart';
import 'package:ageiscme_processo/app/module/models/data_matrix_danificado_processo/data_matrix_danificado_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_processo_model.freezed.dart';
part 'item_processo_model.g.dart';

@unfreezed
abstract class ItemProcessoModel with _$ItemProcessoModel {
  const ItemProcessoModel._();
  factory ItemProcessoModel({
    required int? cod,
    required String? idEtiqueta,
    required String? descricao,
    required String? status,
    required String? informacoesResponsavelPendenteKit,
    required String? restricao,
    required int? codDescritor,
    required int? codProprietario,
    required int? codKit,
    required int? codInstituicao,
    required int? codProcessoLeitura,
    required int? codEmbalagem,
    required int? codEtiqueta,
    required int? pendenteRecepcao,
    required DateTime? dataDescarte,
    required DateTime? rmsValidade,
    required EtiquetaModel? etiqueta,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required int? codMotivoNaoConforme,
    required DateTime? dataValidadeRetornoArsenal,
    required int? codEtapa,
    required List<int> validacoesCompletas,
    required int? codMotivoRetornoArsenal,
    required int? codUsuarioQuebraFluxo,
    required int? codMotivoQuebraFluxo,
    required int? codMotivoRemocaoItemKitArsenal,
    required int? codMotivoRemocaoItemArsenal,
    required CalculadoraItemModel? calculadora,
    required int? prioridade,
    required List<ItemConsignadoModel>? itensConsignados,
    required bool? sequenciaValida,
    required bool? consignadosJaConferidos,
    required bool? lido,
    required bool? selecionado,
    required bool? implantavel,
    required String? refFornecedor,
    required int? responsavelPendenteKit,
    required DateTime? dataHoraPendenteKit,
    required bool? impressaoPreparoRealizada,
    required int? qtdeProcessos,
    required DataMatrixDanificadoProcessoModel? dataMatrixDanificado,
    required int? ordemLeitura,
    required bool? impressaoEtiquetaLoteRealizada,
    required bool? impressaoRelatorioRetiradaRealizada,
    required int? codUsuarioAcaoOcorrencia,
    required int? codAcaoOcorrencia,
  }) = _ItemProcessoModel;

  factory ItemProcessoModel.fromJson(Map<String, Object?> json) =>
      _$ItemProcessoModelFromJson(json);

  ProcessoMotivoModel? getMotivoRemocaoArsenal(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.processoMotivos == null) return null;
    return processoLeitura.leituraAtual.processoMotivos!
        .where((element) => element.cod == codMotivoRemocaoItemArsenal)
        .firstOrNull;
  }

  ProcessoMotivoModel? getMotivoRemocaoItemKitArsenal(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.processoMotivos == null) return null;
    return processoLeitura.leituraAtual.processoMotivos!
        .where((element) => element.cod == codMotivoRemocaoItemKitArsenal)
        .firstOrNull;
  }

  ItemDescritorModel? getDescritor(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.descritores == null) return null;
    return processoLeitura.leituraAtual.descritores
        ?.where((element) => element.cod == codDescritor)
        .firstOrNull;
  }

  
  ProcessoEtapaModel? getEtapa(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.etapas == null) return null;
    return processoLeitura.leituraAtual.etapas
        ?.where((element) => element.cod == codEtapa)
        .firstOrNull;
  }

  ProprietarioModel? getProprietario(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.proprietarios == null) return null;
    return processoLeitura.leituraAtual.proprietarios
        ?.where((element) => element.cod == codProprietario)
        .firstOrNull;
  }

    KitProcessoModel? getKit(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    return processoLeitura.leituraAtual.kits
        .where((element) => element.cod == codKit)
        .firstOrNull;
  }
}
