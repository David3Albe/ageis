import 'dart:collection';

import 'package:ageiscme_models/mixins/local_mixin.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_atual/processo_leitura_atual_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_codigo/processo_leitura_codigo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_passos/processo_leitura_passo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_montagem_model.g.dart';
part 'processo_leitura_montagem_model.freezed.dart';

@unfreezed
sealed class ProcessoLeituraMontagemModel with _$ProcessoLeituraMontagemModel {
  const ProcessoLeituraMontagemModel._();

  factory ProcessoLeituraMontagemModel({
    required bool? cancelado,
    required String? maquina,
    required String? tstamp,
    required int? cod,
    required DateTime? dataHora,
    required ProcessoLeituraCodigoModel leituraCodigo,
    required ProcessoLeituraAtualModel leituraAtual,
    required List<String>? filaLeituras,
    required bool automaticReadings,
    required List<ProcessoLeituraPassoModel> passos,
  }) = _ProcessoLeituraMontagemModel;

  factory ProcessoLeituraMontagemModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraMontagemModelFromJson(json);

  static ProcessoLeituraMontagemModel copy(
    ProcessoLeituraMontagemModel processoLeitura,
  ) =>
      ProcessoLeituraMontagemModel.fromJson(processoLeitura.toJson());

  factory ProcessoLeituraMontagemModel.empty() => ProcessoLeituraMontagemModel(
        cancelado: null,
        maquina: null,
        cod: null,
        dataHora: null,
        tstamp: null,
        leituraAtual: ProcessoLeituraAtualModel.empty(),
        leituraCodigo: ProcessoLeituraCodigoModel.empty(),
        filaLeituras: [],
        automaticReadings: false,
        passos: ProcessoLeituraPassoModel.getDefaultSteps(),
      );

  ItemProcessoModel getItemLido() {
    ItemProcessoModel? itemSelecionado = getItemSelecionado();
    ItemProcessoModel? item = leituraAtual.itens
        .where(
          (element) => element.idEtiqueta == itemSelecionado!.idEtiqueta,
        )
        .firstOrNull;
    if (item != null) return item;
    for (KitProcessoModel kit in leituraAtual.kits) {
      item = kit.itensLidos!
          .where(
            (element) => element.idEtiqueta == itemSelecionado!.idEtiqueta,
          )
          .firstOrNull;
      if (item != null) return item;
    }
    throw Exception('Item não foi lido (getItemLido)');
  }

  ItemProcessoModel? getItemSelecionado() {
    ItemProcessoModel? item = leituraAtual.itens
        .where((element) => element.selecionado == true)
        .firstOrNull;
    if (item != null) return item;
    if (leituraAtual.itemEmLeitura?.selecionado == true) {
      return leituraAtual.itemEmLeitura;
    }
    for (KitProcessoModel kit in leituraAtual.kits) {
      if (kit.itens == null) continue;
      for (ItemProcessoModel item in kit.itens!) {
        if (item.selecionado == true) return item;
      }
    }
    return null;
  }

  KitProcessoModel getKitLido() {
    KitProcessoModel? kit = getKitLidoOuNull();
    if (kit != null) return kit;
    throw Exception('Item não foi lido (getItemLido)');
  }

  KitProcessoModel? getKitLidoOuNull() {
    KitProcessoModel? kit = leituraAtual.kits
        .where(
          (element) => element.selecionado == true,
        )
        .firstOrNull;
    return kit;
  }

  LocalMixin? get local =>
      (leituraAtual.equipamento ?? leituraAtual.estoque) as LocalMixin?;
}
