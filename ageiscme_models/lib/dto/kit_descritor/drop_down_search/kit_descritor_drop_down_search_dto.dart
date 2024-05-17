import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_descritor_drop_down_search_dto.g.dart';
part 'kit_descritor_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class KitDescritorDropDownSearchDTO
    with _$KitDescritorDropDownSearchDTO {
  factory KitDescritorDropDownSearchDTO({
    required int numeroRegistros,
    String? termoPesquisa,
    bool? apenasAtivos,
  }) = _KitDescritorDropDownSearchDTO;

  factory KitDescritorDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$KitDescritorDropDownSearchDTOFromJson(json);
}
