// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_tipo_model.freezed.dart';
part 'processo_tipo_model.g.dart';

@unfreezed
abstract class ProcessoTipoModel
    with
        _$ProcessoTipoModel,
        DropDownText,
        DropDownFilterMixin<ProcessoTipoModel> {
  const ProcessoTipoModel._();

  factory ProcessoTipoModel({
    required int? cod,
    required int? codEtapaProcessoInicial,
    required String nome,
    required String? descricao,
    required int? prazoValidade,
    required String tipoValidade,
    required String nivelPrioridade,
    required DateTime? limiteVigencia,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    required ProcessoEtapaModel? etapaInicial,
    required List<ProcessoEtapaModel>? etapas,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ProcessoTipoModel;

  factory ProcessoTipoModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoTipoModelFromJson(json);

  static ProcessoTipoModel copy(ProcessoTipoModel processoTipo) {
    return ProcessoTipoModel.fromJson(processoTipo.toJson());
  }

  factory ProcessoTipoModel.empty() => ProcessoTipoModel(
        ativo: true,
        cod: 0,
        codEtapaProcessoInicial: null,
        codInstituicao: 0,
        descricao: '',
        limiteVigencia: null,
        nivelPrioridade: '',
        nome: '',
        prazoValidade: 0,
        tipoValidade: '0',
        tstamp: '',
        etapas: null,
        ultimaAlteracao: null,
        etapaInicial: null,
      );

  String GetDropDownText() => nome == null ? '' : nome;

  List<DropDownFilterModel<ProcessoTipoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome.toUpperCase().contains(filter.toUpperCase()),
        ),
         DropDownFilterModel(
          (object) =>
              object.descricao == null ||
              object.descricao!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];
}

class ProcessoTipoPrioriodadeOption with DropDownText {
  final String text;
  final int cod;

  ProcessoTipoPrioriodadeOption(this.text, this.cod);

  static final List<ProcessoTipoPrioriodadeOption> prioridadeOptions = [
    ProcessoTipoPrioriodadeOption('Normal', 1),
    ProcessoTipoPrioriodadeOption('Urgência', 2),
    ProcessoTipoPrioriodadeOption('Emergência', 3),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<ProcessoTipoPrioriodadeOption>? prioridade =
        prioridadeOptions.where((element) => element.cod.toString() == opcao);

    if (prioridade.isEmpty) {
      return '';
    } else {
      return prioridade.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
