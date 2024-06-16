import 'package:ageiscme_models/dto/escala/save/turno/usuario/sigla/escala_turno_usuario_sigla_save_dto.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'escala_turno_usuario_save_dto.g.dart';
part 'escala_turno_usuario_save_dto.freezed.dart';

@unfreezed
sealed class EscalaTurnoUsuarioSaveDTO with _$EscalaTurnoUsuarioSaveDTO {
  factory EscalaTurnoUsuarioSaveDTO({
    required DateTime anoMes,
    required int codTurno,
    TurnoShortResponseDTO? turno,
    required int codUsuario,
    UsuarioDropDownSearchResponseDTO? usuario,
    List<EscalaTurnoUsuarioSiglaSaveDTO>? siglas,
  }) = _EscalaTurnoUsuarioSaveDTO;

  factory EscalaTurnoUsuarioSaveDTO.fromJson(Map<String, Object?> json) =>
      _$EscalaTurnoUsuarioSaveDTOFromJson(json);
}
