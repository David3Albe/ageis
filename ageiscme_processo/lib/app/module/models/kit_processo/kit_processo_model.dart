import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_processo_model.freezed.dart';
part 'kit_processo_model.g.dart';

@unfreezed
abstract class KitProcessoModel with _$KitProcessoModel {
  const KitProcessoModel._();
  factory KitProcessoModel({
    required int? cod,
    required String? codBarra,
    required int? codCor1,
    required int? codCor2,
    required int? codCor3,
    required int? codCor4,
    required String? status,
    required String? restricao,
    required int? codDescritorKit,
    required int? codConjunto,
    required int? codInstituicao,
    required String? preparo,
    required int? codProcessoLeitura,
    required int? codEmbalagem,
    required EmbalagemModel? embalagem,
    required String? imagem,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tStamp,
    required KitDescritorModel? descritor,
    required List<ItemProcessoModel>? itens,
    required KitCorModel? cor1,
    required KitCorModel? cor2,
    required KitCorModel? cor3,
    required KitCorModel? cor4,
    required bool? selecionado,
    required List<int>? statusExpandidos,
    required int? codMotivoNaoConforme,
    required int? codEtapa,
    required List<int> validacoesCompletas,
    required int? codMotivoRetornoArsenal,
    required int? codUsuarioQuebraFluxo,
    required UsuarioModel? usuarioQuebraFluxo,
    required int? codMotivoQuebraFluxo,
    required int? prioridade,
    required DateTime? dataValidadeRetornoArsenal,
    required String? preparoInicioLeitura,
    required int? codUsuarioLiberacao,
    required bool? conferidoVisualmente,
    required bool? liberadoIncompleto,
    required bool? impressaoPreparoRealizada,
    required bool? sequenciaValida,
    required bool? impressaoEtiquetaLoteRealizada,
    required bool? impressaoRelatorioRetiradaRealizada,
    required int? codUsuarioAcaoOcorrencia,
    required int? codAcaoOcorrencia,
    required int? itensLidosCalculado,
    required int? itensTotalKitCalculado,
    int? codLocalizacaoEstoque,
    bool? confirmouLocalNaoCompativel,
  }) = _KitProcessoModel;

  factory KitProcessoModel.fromJson(Map<String, Object?> json) =>
      _$KitProcessoModelFromJson(json);

  Color getCor1() {
    if (cor1 == null) return Colors.transparent;
    return Color.fromRGBO(cor1!.red ?? 0, cor1!.green ?? 0, cor1!.blue ?? 0, 1);
  }

  Color getCor2() {
    if (cor2 == null) return Colors.transparent;
    return Color.fromRGBO(cor2!.red ?? 0, cor2!.green ?? 0, cor2!.blue ?? 0, 1);
  }

  Color getCor3() {
    if (cor3 == null) return Colors.transparent;
    return Color.fromRGBO(cor3!.red ?? 0, cor3!.green ?? 0, cor3!.blue ?? 0, 1);
  }

  Color getCor4() {
    if (cor4 == null) return Colors.transparent;
    return Color.fromRGBO(cor4!.red ?? 0, cor4!.green ?? 0, cor4!.blue ?? 0, 1);
  }

  List<Color> getAllCores() {
    List<Color> cores = [];
    cores.add(getCor1());
    cores.add(getCor2());
    cores.add(getCor3());
    cores.add(getCor4());
    return cores;
  }

  ProcessoEtapaModel? getEtapa(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.etapas == null) return null;
    return processoLeitura.leituraAtual.etapas
        ?.where((element) => element.cod == codEtapa)
        .firstOrNull;
  }

  List<ItemProcessoModel>? get itensLidos =>
      itens?.where((element) => element.lido == true).toList();

  bool get preparado => preparo == '1';
}
