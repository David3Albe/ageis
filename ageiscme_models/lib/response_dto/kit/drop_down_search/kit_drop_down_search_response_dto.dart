import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_drop_down_search_response_dto.freezed.dart';
part 'kit_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class KitDropDownSearchResponseDTO with _$KitDropDownSearchResponseDTO {
  const KitDropDownSearchResponseDTO._();
  factory KitDropDownSearchResponseDTO({
    required int cod,
    required String codBarra,
    String? nomeDescritor,
  }) = _KitDropDownSearchResponseDTO;

  factory KitDropDownSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitDropDownSearchResponseDTOFromJson(json);

  static KitDropDownSearchResponseDTO copy(KitDropDownSearchResponseDTO obj) =>
      KitDropDownSearchResponseDTO.fromJson(obj.toJson());

  String CodBarraDescritorText() {
    return '($codBarra) ${nomeDescritor ?? 'Descritor sem nome'}';
  }
}
