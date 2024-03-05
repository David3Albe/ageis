import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/processo_sequencia/processo_sequencia_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_etapa_model.freezed.dart';
part 'processo_etapa_model.g.dart';

@unfreezed
abstract class ProcessoEtapaModel
    with
        _$ProcessoEtapaModel,
        DropDownText,
        DropDownFilterMixin<ProcessoEtapaModel> {
  const ProcessoEtapaModel._();

  factory ProcessoEtapaModel({
    required int? cod,
    required int? codProcessoTipo,
    required int? codEquipamento,
    required int? codEstoque,
    required int? tempoCicloProcesso,
    required int? codInstituicao,
    required int? codServicoTipo,
    required int? codEstoqueAut,
    required String? nome,
    required String? descricao,
    required String? descricaoEtiquetaPreparo,
    required double? localizacaoX,
    required double? localizacaoY,
    required bool? liberaKitIncompleto,
    required bool? exigeLeituraEntrada,
    required bool? exigeLeituraSaida,
    required bool? usuarioColocaNaoRetira,
    required bool? conferenciaVisualPermitida,
    required bool? imprimirEtiquetaLote,
    required bool? ativo,
    required bool? autorizaQuebraFluxo,
    required bool? exigeTesteIndicador,
    required bool? preparo,
    required bool? areaEsteril,
    required bool? exigeEpcEntrada,
    required bool? exigeEpcSaida,
    required bool? flag1,
    required bool? flag2,
    required bool? transfere,
    required bool? recebe,
    required bool? testeIndicadorEntrada,
    required bool? etiquetaSaida,
    required bool? etiquetaEntrada,
    required bool? testeIndicadorSaida,
    required bool? exigeLoteEquipamento,
    required bool? responsavelLocalNaoCompativel,
    required bool? exigeTesteBiologico,
    required bool? biologicoEntrada,
    required bool? biologicoSaida,
    required bool? testeBiologicoEntrada,
    required bool? testeBiologicoSaida,
    required bool? pacote,
    required bool? relatorioRetiradaMateriais,
    required bool? naoAlterarStatusItemPendente,
    required bool? integradorKit,
    required bool? solicitacaoCirculante,
    required bool? permiteLiberacaoDataMatrixComCrachaPreparo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ProcessoTipoModel? tipoProcesso,
    required EquipamentoModel? equipamento,
    required ArsenalEstoqueModel? arsenal,
    required ServicoTipoModel? servicoTipo,
    required List<ProcessoSequenciaModel>? sequencias,
  }) = _ProcessoEtapaModel;

  factory ProcessoEtapaModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoEtapaModelFromJson(json);

  static ProcessoEtapaModel copy(ProcessoEtapaModel processoEtapa) {
    return ProcessoEtapaModel.fromJson(processoEtapa.toJson());
  }

  factory ProcessoEtapaModel.empty() => ProcessoEtapaModel(
        cod: 0,
        codProcessoTipo: 0,
        codEquipamento: null,
        codEstoque: null,
        tempoCicloProcesso: 0,
        codInstituicao: 0,
        codServicoTipo: 0,
        codEstoqueAut: 0,
        nome: '',
        descricao: '',
        descricaoEtiquetaPreparo: '',
        localizacaoX: 0,
        localizacaoY: 0,
        liberaKitIncompleto: false,
        exigeLeituraEntrada: false,
        exigeLeituraSaida: false,
        usuarioColocaNaoRetira: false,
        conferenciaVisualPermitida: false,
        imprimirEtiquetaLote: false,
        ativo: true,
        autorizaQuebraFluxo: false,
        exigeTesteIndicador: false,
        preparo: false,
        areaEsteril: false,
        exigeEpcEntrada: false,
        exigeEpcSaida: false,
        flag1: false,
        flag2: false,
        transfere: false,
        recebe: false,
        testeIndicadorEntrada: false,
        etiquetaSaida: false,
        etiquetaEntrada: false,
        testeIndicadorSaida: false,
        exigeLoteEquipamento: false,
        responsavelLocalNaoCompativel: false,
        exigeTesteBiologico: false,
        biologicoEntrada: false,
        biologicoSaida: false,
        testeBiologicoEntrada: false,
        testeBiologicoSaida: false,
        pacote: false,
        relatorioRetiradaMateriais: false,
        naoAlterarStatusItemPendente: false,
        integradorKit: false,
        solicitacaoCirculante: false,
        ultimaAlteracao: null,
        tstamp: '',
        tipoProcesso: null,
        equipamento: null,
        arsenal: null,
        servicoTipo: null,
        permiteLiberacaoDataMatrixComCrachaPreparo: false,
        sequencias: null,
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<ProcessoEtapaModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.nome != null &&
              object.nome!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String GetNomeEtapaText() => '($cod) ${nome == null ? '' : nome!}';

  String GetNomeEtapaTipoText() =>
      '${tipoProcesso == null ? '' : tipoProcesso!.nome} / ${nome == null ? '' : nome!}';
}
