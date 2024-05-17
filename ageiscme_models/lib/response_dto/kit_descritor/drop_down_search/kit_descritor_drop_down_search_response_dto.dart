import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_descritor_drop_down_search_response_dto.freezed.dart';
part 'kit_descritor_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class KitDescritorDropDownSearchResponseDTO
    with _$KitDescritorDropDownSearchResponseDTO {
  const KitDescritorDropDownSearchResponseDTO._();
  factory KitDescritorDropDownSearchResponseDTO({
    required int cod,
    String? nome,
  }) = _KitDescritorDropDownSearchResponseDTO;

  factory KitDescritorDropDownSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$KitDescritorDropDownSearchResponseDTOFromJson(json);

  static KitDescritorDropDownSearchResponseDTO copy(
          KitDescritorDropDownSearchResponseDTO obj) =>
      KitDescritorDropDownSearchResponseDTO.fromJson(obj.toJson());

  String Nome() {
    return '${nome ?? ''}';
  }
}
