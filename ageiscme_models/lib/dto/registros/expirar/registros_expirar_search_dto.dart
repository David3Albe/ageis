import 'package:freezed_annotation/freezed_annotation.dart';

part 'registros_expirar_search_dto.g.dart';
part 'registros_expirar_search_dto.freezed.dart';

@unfreezed
sealed class RegistrosExpirarSearchDTO with _$RegistrosExpirarSearchDTO {
  factory RegistrosExpirarSearchDTO() = _RegistrosExpirarSearchDTO;

  factory RegistrosExpirarSearchDTO.fromJson(Map<String, Object?> json) =>
      _$RegistrosExpirarSearchDTOFromJson(json);
}
