import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_query_one_dto.g.dart';
part 'anormalidade_tipo_query_one_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoQueryOneDTO with _$AnormalidadeTipoQueryOneDTO {
  factory AnormalidadeTipoQueryOneDTO({
    required int cod,
  }) = _AnormalidadeTipoQueryOneDTO;

  factory AnormalidadeTipoQueryOneDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoQueryOneDTOFromJson(json);
}
