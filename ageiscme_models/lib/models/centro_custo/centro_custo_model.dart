import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'centro_custo_model.g.dart';
part 'centro_custo_model.freezed.dart';

@unfreezed
sealed class CentroCustoModel
    with
        _$CentroCustoModel,
        DropDownText,
        DropDownFilterMixin<CentroCustoModel> {
  const CentroCustoModel._();

  factory CentroCustoModel({
    required int? cod,
    required String? centroCusto, 
    required String? descricao,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _CentroCustoModel;

  factory CentroCustoModel.fromJson(Map<String, Object?> json) =>
      _$CentroCustoModelFromJson(json);

  static CentroCustoModel copy(CentroCustoModel centroCusto) {
    return CentroCustoModel.fromJson(centroCusto.toJson());
  }

  factory CentroCustoModel.empty() => CentroCustoModel(
        cod: 0,
        centroCusto: '',
        descricao: '',
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => descricao == null ? '' : descricao!;

  List<DropDownFilterModel<CentroCustoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.centroCusto != null &&
              object.centroCusto!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.centroCusto == null ||
              object.centroCusto!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String CentroCustoText() => '${centroCusto == null ? '' : centroCusto}';
}
