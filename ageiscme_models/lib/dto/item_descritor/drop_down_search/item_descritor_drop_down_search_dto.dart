import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_descritor_drop_down_search_dto.g.dart';
part 'item_descritor_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class ItemDescritorDropDownSearchDTO
    with _$ItemDescritorDropDownSearchDTO {
  factory ItemDescritorDropDownSearchDTO({
    required int numeroRegistros,
    String? termoPesquisa,
    bool? apenasAtivos,
  }) = _ItemDescritorDropDownSearchDTO;

  factory ItemDescritorDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$ItemDescritorDropDownSearchDTOFromJson(json);
}
