import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_descritor_filter.freezed.dart';
part 'item_descritor_filter.g.dart';

@unfreezed
sealed class ItemDescritorFilter with _$ItemDescritorFilter {
  factory ItemDescritorFilter({
    int? cod,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
    bool? carregarItensConsignados,
    bool? apenasConsignados,
    bool? apenasNaoConsignados,
    bool? carregarImagem,
    int? numeroMaximoRegistros,
    String? termoPesquisa,
    String? nomeContem,
    bool? ordenarAtivosPrimeiro,
    bool? ordenarCodigoDesc,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _ItemDescritorFilter;

  factory ItemDescritorFilter.fromJson(Map<String, Object?> json) =>
      _$ItemDescritorFilterFromJson(json);

  static ItemDescritorFilter copy(ItemDescritorFilter filter) {
    return ItemDescritorFilter.fromJson(filter.toJson());
  }
}
