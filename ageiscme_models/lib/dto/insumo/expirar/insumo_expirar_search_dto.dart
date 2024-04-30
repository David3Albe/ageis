import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_expirar_search_dto.g.dart';
part 'insumo_expirar_search_dto.freezed.dart';

@unfreezed
sealed class InsumoExpirarSearchDTO with _$InsumoExpirarSearchDTO {
  factory InsumoExpirarSearchDTO() = _InsumoExpirarSearchDTO;

  factory InsumoExpirarSearchDTO.fromJson(Map<String, Object?> json) =>
      _$InsumoExpirarSearchDTOFromJson(json);
}
