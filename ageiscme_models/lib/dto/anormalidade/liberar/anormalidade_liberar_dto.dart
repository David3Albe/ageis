import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_liberar_dto.g.dart';
part 'anormalidade_liberar_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeLiberarDTO with _$AnormalidadeLiberarDTO {
  factory AnormalidadeLiberarDTO({
    required int cod,
    required String tstamp,
    required String observacaoLiberacao,
  }) = _AnormalidadeLiberarDTO;

  factory AnormalidadeLiberarDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeLiberarDTOFromJson(json);
}
