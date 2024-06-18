import 'package:ageiscme_models/dto/escala/save/turno/escala_turno_save_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'escala_save_dto.g.dart';
part 'escala_save_dto.freezed.dart';

@unfreezed
sealed class EscalaSaveDTO with _$EscalaSaveDTO {
  factory EscalaSaveDTO({
   required DateTime anoMes,
   String? tstamp,
   List<EscalaTurnoSaveDTO>? turnos,
  }) = _EscalaSaveDTO;

  factory EscalaSaveDTO.fromJson(Map<String, Object?> json) =>
      _$EscalaSaveDTOFromJson(json);
}
