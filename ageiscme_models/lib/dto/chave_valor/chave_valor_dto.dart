import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chave_valor_dto.freezed.dart';
part 'chave_valor_dto.g.dart';

@unfreezed
abstract class ChaveValorDTO
    with _$ChaveValorDTO {
  factory ChaveValorDTO({
    required String chave,
    required String valor,
  }) = _ChaveValorDTO;

  factory ChaveValorDTO.fromJson(Map<String, Object?> json) =>
      _$ChaveValorDTOFromJson(json);

  static ChaveValorDTO copy(
      ChaveValorDTO obj) {
    return ChaveValorDTO.fromJson(obj.toJson());
  }
}
