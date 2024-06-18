import 'package:ageiscme_models/dto/escala/save/turno/usuario/escala_turno_usuario_save_dto.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'escala_turno_save_dto.g.dart';
part 'escala_turno_save_dto.freezed.dart';

@unfreezed
sealed class EscalaTurnoSaveDTO with _$EscalaTurnoSaveDTO {
  factory EscalaTurnoSaveDTO({
    required DateTime anoMes,
    required int codTurno,
    TurnoShortResponseDTO? turno,
    List<EscalaTurnoUsuarioSaveDTO>? usuarios,
  }) = _EscalaTurnoSaveDTO;

  factory EscalaTurnoSaveDTO.fromJson(Map<String, Object?> json) =>
      _$EscalaTurnoSaveDTOFromJson(json);
}
