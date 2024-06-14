import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_short_dto.g.dart';
part 'turno_short_dto.freezed.dart';

@unfreezed
sealed class TurnoShortDTO with _$TurnoShortDTO {
  factory TurnoShortDTO({
    String? termoPesquisa,
    required int numeroRegistros,
    bool? ativosApenas,
  }) = _TurnoShortDTO;

  factory TurnoShortDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoShortDTOFromJson(json);
}
