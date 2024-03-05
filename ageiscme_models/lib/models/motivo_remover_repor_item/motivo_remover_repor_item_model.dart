import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'motivo_remover_repor_item_model.freezed.dart';
part 'motivo_remover_repor_item_model.g.dart';

@unfreezed
abstract class MotivoRemoverReporItemModel
    with
        _$MotivoRemoverReporItemModel,
        DropDownFilterMixin<MotivoRemoverReporItemModel> {
  const MotivoRemoverReporItemModel._();

  factory MotivoRemoverReporItemModel({
    required int? cod,
    required String? descricao,
    required int? codInstituicao,
    required bool? ativo,
    required bool? remover,
    required bool? repor,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _MotivoRemoverReporItemModel;

  factory MotivoRemoverReporItemModel.fromJson(Map<String, Object?> json) =>
      _$MotivoRemoverReporItemModelFromJson(json);

  static MotivoRemoverReporItemModel copy(
          MotivoRemoverReporItemModel motivoRemoverReporItem) =>
      MotivoRemoverReporItemModel.fromJson(motivoRemoverReporItem.toJson());

  factory MotivoRemoverReporItemModel.empty() => MotivoRemoverReporItemModel(
        cod: 0,
        descricao: '',
        codInstituicao: 0,
        ativo: true,
        remover: false,
        repor: false,
        ultimaAlteracao: null,
        tstamp: '',
      );

  List<DropDownFilterModel<MotivoRemoverReporItemModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) => object.cod.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.descricao != null ||
              object.descricao!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String DescricaoText() {
    return descricao ?? '';
  }
}
