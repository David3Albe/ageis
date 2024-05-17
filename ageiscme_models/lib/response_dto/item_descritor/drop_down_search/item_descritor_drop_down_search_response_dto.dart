import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_descritor_drop_down_search_response_dto.freezed.dart';
part 'item_descritor_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class ItemDescritorDropDownSearchResponseDTO
    with _$ItemDescritorDropDownSearchResponseDTO {
  const ItemDescritorDropDownSearchResponseDTO._();
  factory ItemDescritorDropDownSearchResponseDTO({
    required int cod,
    String? nome,
  }) = _ItemDescritorDropDownSearchResponseDTO;

  factory ItemDescritorDropDownSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ItemDescritorDropDownSearchResponseDTOFromJson(json);

  static ItemDescritorDropDownSearchResponseDTO copy(
          ItemDescritorDropDownSearchResponseDTO obj) =>
      ItemDescritorDropDownSearchResponseDTO.fromJson(obj.toJson());

  String Nome() {
    return '${nome ?? ''}';
  }
}
