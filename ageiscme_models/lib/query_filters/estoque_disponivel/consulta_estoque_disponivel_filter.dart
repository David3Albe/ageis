import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_estoque_disponivel_filter.g.dart';
part 'consulta_estoque_disponivel_filter.freezed.dart';

@unfreezed
sealed class ConsultaEstoqueDisponivelFilter
    with _$ConsultaEstoqueDisponivelFilter {
  const ConsultaEstoqueDisponivelFilter._();

  factory ConsultaEstoqueDisponivelFilter({
    required int? codEstoque,
    required int? codEstoqueLocal,
    required int? codKit,
    required int? codItem,
    required int? codProprietario,
    bool? ignorarRemovidos,
    ItemModel? item,
  }) = _ConsultaEstoqueDisponivelFilter;

  factory ConsultaEstoqueDisponivelFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaEstoqueDisponivelFilterFromJson(json);

  static ConsultaEstoqueDisponivelFilter copy(
      ConsultaEstoqueDisponivelFilter obj) {
    return ConsultaEstoqueDisponivelFilter.fromJson(obj.toJson());
  }

  factory ConsultaEstoqueDisponivelFilter.empty() =>
      ConsultaEstoqueDisponivelFilter(
        codEstoque: null,
        codEstoqueLocal: null,
        codKit: null,
        codItem: null,
        codProprietario: null,
        ignorarRemovidos: null,
      );
}
