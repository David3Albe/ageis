import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insumo_expirar_search_response_dto.freezed.dart';
part 'insumo_expirar_search_response_dto.g.dart';

@unfreezed
sealed class InsumoExpirarSearchResponseDTO
    with _$InsumoExpirarSearchResponseDTO {
  const InsumoExpirarSearchResponseDTO._();
  factory InsumoExpirarSearchResponseDTO({
        int? codInsumo,
        required String nome,
        String? lote,
        DateTime? dataValidade,
        double? quantidade,
  }) = _InsumoExpirarSearchResponseDTO;

  factory InsumoExpirarSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$InsumoExpirarSearchResponseDTOFromJson(json);

  static InsumoExpirarSearchResponseDTO copy(
          InsumoExpirarSearchResponseDTO obj) =>
      InsumoExpirarSearchResponseDTO.fromJson(obj.toJson());

}
