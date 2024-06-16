import 'package:ageiscme_models/response_dto/sigla/short/sigla_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'escala_turno_usuario_sigla_save_dto.g.dart';
part 'escala_turno_usuario_sigla_save_dto.freezed.dart';

@unfreezed
sealed class EscalaTurnoUsuarioSiglaSaveDTO
    with _$EscalaTurnoUsuarioSiglaSaveDTO {
  factory EscalaTurnoUsuarioSiglaSaveDTO({
    required DateTime anoMes,
    required int codTurno,
    TurnoShortResponseDTO? turno,
    required int codUsuario,
    UsuarioDropDownSearchResponseDTO? usuario,
    required DateTime data,
    required int codSigla,
    SiglaShortResponseDTO? sigla,
  }) = _EscalaTurnoUsuarioSiglaSaveDTO;

  factory EscalaTurnoUsuarioSiglaSaveDTO.fromJson(Map<String, Object?> json) =>
      _$EscalaTurnoUsuarioSiglaSaveDTOFromJson(json);
}
