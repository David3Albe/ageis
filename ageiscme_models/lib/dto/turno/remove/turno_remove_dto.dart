import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_remove_dto.g.dart';
part 'turno_remove_dto.freezed.dart';

@unfreezed
sealed class TurnoRemoveDTO with _$TurnoRemoveDTO {
  factory TurnoRemoveDTO({
    required int cod,
    required String tstamp,
  }) = _TurnoRemoveDTO;

  factory TurnoRemoveDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoRemoveDTOFromJson(json);
}
