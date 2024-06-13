import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_short_response_dto.g.dart';
part 'anormalidade_tipo_short_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoShortResponseDTO
    with _$AnormalidadeTipoShortResponseDTO {
  const AnormalidadeTipoShortResponseDTO._();

  factory AnormalidadeTipoShortResponseDTO({
    required int cod,
    required String nome,
  }) = _AnormalidadeTipoShortResponseDTO;

  factory AnormalidadeTipoShortResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$AnormalidadeTipoShortResponseDTOFromJson(json);

        static AnormalidadeTipoShortResponseDTO copy(
          AnormalidadeTipoShortResponseDTO obj) =>
      AnormalidadeTipoShortResponseDTO.fromJson(obj.toJson());

  String Nome() => nome;
}
