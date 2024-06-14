import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_save_dto.g.dart';
part 'turno_save_dto.freezed.dart';

@unfreezed
sealed class TurnoSaveDTO with _$TurnoSaveDTO {
  factory TurnoSaveDTO({
    required int cod,
    required String descricao,
    required bool ativo,
    DateTime? ultimaAlteracao,
    String? tstamp,
    int? codInstituicao,
  }) = _TurnoSaveDTO;

  factory TurnoSaveDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoSaveDTOFromJson(json);

  factory TurnoSaveDTO.empty() => TurnoSaveDTO(
        ativo: true,
        descricao: '',
        cod: -1,
      );
}
