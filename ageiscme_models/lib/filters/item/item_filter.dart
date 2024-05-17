import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/models/kit/kit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_filter.freezed.dart';
part 'item_filter.g.dart';

@unfreezed
sealed class ItemFilter with _$ItemFilter {
  factory ItemFilter({
    DateTime? startDate,
    DateTime? finalDate,
    int? cod,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
    bool? carregarKit,
    bool? carregarDescritor,
    bool? carregarDescritorResumido,
    bool? carregarUsuarios,
    bool? carregarProprietario,
    bool? apenasItensConsignados,
    bool? apenasItensNaoConsignados,
    bool? carregarItensConsignado,
    int? numeroRegistros,
    String? termoPesquisa,
    String? idEtiquetaComecaCom,
    String? idEtiquetaContem,
    String? codBarraKitContem,
    @JsonKey(name: 'tStamp') String? tStamp,
    ItemModel? itemFilter,
    KitModel? kitFilter,
    int? codKit,
    String? iDEtiqueta,
  }) = _ItemFilter;

  factory ItemFilter.fromJson(Map<String, Object?> json) =>
      _$ItemFilterFromJson(json);

  static ItemFilter copy(ItemFilter filter) {
    return ItemFilter.fromJson(filter.toJson());
  }

  factory ItemFilter.empty() => ItemFilter(
        cod: null,
        apenasAtivos: null,
        ordenarPorNomeCrescente: null,
        tStamp: null,
        startDate: null,
        finalDate: null,
      );
}
