import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'motivo_quebra_fluxo_model.freezed.dart';
part 'motivo_quebra_fluxo_model.g.dart';

@unfreezed
abstract class MotivoQuebraFluxoModel with _$MotivoQuebraFluxoModel {
  const MotivoQuebraFluxoModel._();
  factory MotivoQuebraFluxoModel({
    required int? cod,
    required String? descricao,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _MotivoQuebraFluxoModel;

  factory MotivoQuebraFluxoModel.fromJson(Map<String, Object?> json) =>
      _$MotivoQuebraFluxoModelFromJson(json);

  static MotivoQuebraFluxoModel copy(
          MotivoQuebraFluxoModel motivoQuebraFluxo) =>
      MotivoQuebraFluxoModel.fromJson(motivoQuebraFluxo.toJson());

  factory MotivoQuebraFluxoModel.empty() => MotivoQuebraFluxoModel(
        cod: 0,
        descricao: '',
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  List<DropDownFilterModel<MotivoQuebraFluxoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel((object) =>
            object.descricao != null && object.descricao!.endsWith(filter)),
      ];

  String DescricaoText() => '${descricao != null ? descricao : ''}';
}
