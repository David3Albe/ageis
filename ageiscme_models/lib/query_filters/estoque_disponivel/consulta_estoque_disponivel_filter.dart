import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
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
    required String? codBarraKitContem,
    required int? codItem,
    required String? idEtiquetaContem,
    required int? codProprietario,
    String? tipoEstoque,
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
        codBarraKitContem: null,
        idEtiquetaContem: null,
      );
}

class ConsultaEstoqueDisponivelTipoEstoque with DropDownText {
  final String text;
  final String cod;

  ConsultaEstoqueDisponivelTipoEstoque(this.text, this.cod);

  static final List<ConsultaEstoqueDisponivelTipoEstoque> situacaoOptions = [
    ConsultaEstoqueDisponivelTipoEstoque('Ambos', '0'),
    ConsultaEstoqueDisponivelTipoEstoque('Estoque Disponível', '1'),
    ConsultaEstoqueDisponivelTipoEstoque('Reposição', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<ConsultaEstoqueDisponivelTipoEstoque>? situacao =
        situacaoOptions.where((element) => element.cod.toString() == opcao);

    if (situacao.isEmpty) {
      return '';
    } else {
      return situacao.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
