import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_estoque_vencido_filter.g.dart';
part 'consulta_estoque_vencido_filter.freezed.dart';

@unfreezed
sealed class ConsultaEstoqueVencidoFilter with _$ConsultaEstoqueVencidoFilter {
  const ConsultaEstoqueVencidoFilter._();

  factory ConsultaEstoqueVencidoFilter({
    required int? codEstoque,
    required int? codLocalEstoque,
    required int? codKit,
    required int? codItem,
    required bool? rotulado,
    ItemModel? item,
  }) = _ConsultaEstoqueVencidoFilter;

  factory ConsultaEstoqueVencidoFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaEstoqueVencidoFilterFromJson(json);

  static ConsultaEstoqueVencidoFilter copy(ConsultaEstoqueVencidoFilter obj) {
    return ConsultaEstoqueVencidoFilter.fromJson(obj.toJson());
  }

  factory ConsultaEstoqueVencidoFilter.empty() => ConsultaEstoqueVencidoFilter(
        codEstoque: null,
        codLocalEstoque: null,
        codKit: null,
        codItem: null,
        rotulado: null,
      );
}
