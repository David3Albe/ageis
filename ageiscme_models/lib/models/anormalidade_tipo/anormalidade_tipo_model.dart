import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'anormalidade_tipo_model.freezed.dart';
part 'anormalidade_tipo_model.g.dart';

@unfreezed
abstract class AnormalidadeTipoModel
    with _$AnormalidadeTipoModel, DropDownFilterMixin<AnormalidadeTipoModel> {
  const AnormalidadeTipoModel._();

  factory AnormalidadeTipoModel({
    required int cod,
    required String nome,
    required bool ativo,
    required bool bloqueioEtapa,
    required bool bloqueioItens,
    required bool bloqueioTotal,
    DateTime? ultimaAlteracao,
    String? tstamp,
    int? codInstituicao,
  }) = _AnormalidadeTipoModel;

  factory AnormalidadeTipoModel.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoModelFromJson(json);

  static AnormalidadeTipoModel copy(AnormalidadeTipoModel obj) =>
      AnormalidadeTipoModel.fromJson(obj.toJson());

  List<DropDownFilterModel<AnormalidadeTipoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) => object.cod.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) => object.nome.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String AcaoOcorrenciaDescricaoText() => nome;
}
