import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_estoque_disponivel_rotulado_filter.g.dart';
part 'consulta_estoque_disponivel_rotulado_filter.freezed.dart';

@unfreezed
sealed class ConsultaEstoqueDisponivelRotuladoFilter
    with _$ConsultaEstoqueDisponivelRotuladoFilter {
  const ConsultaEstoqueDisponivelRotuladoFilter._();

  factory ConsultaEstoqueDisponivelRotuladoFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codEstoque,
    required int? codItem,
    required String? idEtiqueta,
    required int? codProprietario,
    required bool? entrada,
    required bool? saida,
    ItemModel? item,
  }) = _ConsultaEstoqueDisponivelRotuladoFilter;

  factory ConsultaEstoqueDisponivelRotuladoFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaEstoqueDisponivelRotuladoFilterFromJson(json);

  static ConsultaEstoqueDisponivelRotuladoFilter copy(
      ConsultaEstoqueDisponivelRotuladoFilter obj) {
    return ConsultaEstoqueDisponivelRotuladoFilter.fromJson(obj.toJson());
  }

  factory ConsultaEstoqueDisponivelRotuladoFilter.empty() =>
      ConsultaEstoqueDisponivelRotuladoFilter(
        finalDate: null,
        startDate: null,
        codEstoque: null,
        codItem: null,
        codProprietario: null,
        entrada: null,
        saida: null,
        idEtiqueta: null,
      );
}
