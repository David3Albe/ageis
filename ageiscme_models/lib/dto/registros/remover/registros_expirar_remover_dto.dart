import 'package:ageiscme_models/dto/registros/remover/registro/registros_expirar_remover_registro_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registros_expirar_remover_dto.g.dart';
part 'registros_expirar_remover_dto.freezed.dart';

@unfreezed
sealed class RegistrosExpirarRemoverDTO with _$RegistrosExpirarRemoverDTO {
  factory RegistrosExpirarRemoverDTO({
    required int codUsuario,
    required List<RegistrosExpirarRemoverRegistroDTO> registros,
  }) = _RegistrosExpirarRemoverDTO;

  factory RegistrosExpirarRemoverDTO.fromJson(Map<String, Object?> json) =>
      _$RegistrosExpirarRemoverDTOFromJson(json);
}
