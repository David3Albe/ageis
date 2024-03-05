import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_motivo_model.freezed.dart';
part 'processo_motivo_model.g.dart';

@unfreezed
abstract class ProcessoMotivoModel
    with _$ProcessoMotivoModel, DropDownFilterMixin<ProcessoMotivoModel> {
  const ProcessoMotivoModel._();
  factory ProcessoMotivoModel({
    required int? cod,
    required String? descricao,
    required int? codInstituicao,
    required bool? ativo,
    required bool? arsenal,
    required bool? preparo,
    required bool? recepcaoExpurgo,
    required bool? bloquearPreparo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ProcessoMotivoModel;

  factory ProcessoMotivoModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoMotivoModelFromJson(json);

  static ProcessoMotivoModel copy(ProcessoMotivoModel processoMotivo) =>
      ProcessoMotivoModel.fromJson(processoMotivo.toJson());

  factory ProcessoMotivoModel.empty() => ProcessoMotivoModel(
        cod: 0,
        descricao: '',
        codInstituicao: 0,
        ativo: true,
        arsenal: false,
        preparo: false,
        recepcaoExpurgo: false,
        bloquearPreparo: false,
        ultimaAlteracao: null,
        tstamp: '',
      );

  List<DropDownFilterModel<ProcessoMotivoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel((object) =>
            object.descricao != null && object.descricao!.endsWith(filter)),
      ];

  String DescricaoText() => '${descricao != null ? descricao : ''}';
}
