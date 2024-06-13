import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_drop_down_search_dto.g.dart';
part 'item_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class ItemDropDownSearchDTO with _$ItemDropDownSearchDTO {
  factory ItemDropDownSearchDTO({
    required int numeroRegistros,
    String? termoPesquisa,
  }) = _ItemDropDownSearchDTO;

  factory ItemDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$ItemDropDownSearchDTOFromJson(json);
}
