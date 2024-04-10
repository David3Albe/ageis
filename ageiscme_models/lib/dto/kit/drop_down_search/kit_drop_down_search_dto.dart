import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_drop_down_search_dto.g.dart';
part 'kit_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class KitDropDownSearchDTO with _$KitDropDownSearchDTO {
  factory KitDropDownSearchDTO({
    required int numeroRegistros,
    String? search,
  }) = _KitDropDownSearchDTO;

  factory KitDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$KitDropDownSearchDTOFromJson(json);
}
