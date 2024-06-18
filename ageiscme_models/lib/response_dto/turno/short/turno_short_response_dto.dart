import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_short_response_dto.g.dart';
part 'turno_short_response_dto.freezed.dart';

@unfreezed
sealed class TurnoShortResponseDTO with _$TurnoShortResponseDTO {
  const TurnoShortResponseDTO._();

  factory TurnoShortResponseDTO({
    required int cod,
    required String descricao,
  }) = _TurnoShortResponseDTO;

  factory TurnoShortResponseDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoShortResponseDTOFromJson(json);

  static TurnoShortResponseDTO copy(TurnoShortResponseDTO obj) =>
      TurnoShortResponseDTO.fromJson(obj.toJson());

  String Descricao() => descricao;

  @override
  String toString() => descricao;
}
