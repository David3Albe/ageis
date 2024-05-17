import 'package:freezed_annotation/freezed_annotation.dart';

part 'registros_expirar_remover_registro_dto.g.dart';
part 'registros_expirar_remover_registro_dto.freezed.dart';

@unfreezed
sealed class RegistrosExpirarRemoverRegistroDTO
    with _$RegistrosExpirarRemoverRegistroDTO {
  factory RegistrosExpirarRemoverRegistroDTO({
    required int codTabela,
    required String nomeTabela,
  }) = _RegistrosExpirarRemoverRegistroDTO;

  factory RegistrosExpirarRemoverRegistroDTO.fromJson(
          Map<String, Object?> json) =>
      _$RegistrosExpirarRemoverRegistroDTOFromJson(json);
}
