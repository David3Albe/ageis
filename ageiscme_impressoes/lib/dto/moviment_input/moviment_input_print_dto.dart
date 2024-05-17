import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'moviment_input_print_dto.g.dart';
part 'moviment_input_print_dto.freezed.dart';

@unfreezed
sealed class MovimentInputPrintDTO with _$MovimentInputPrintDTO {
  factory MovimentInputPrintDTO({
    required DateTime dataHora,
    required String companyName,
    required String inputName,
    required String entryOut,
    DateTime? validity,
    String? nroNotaFiscal,
    String? equipamentName,
    String? batch,
  }) = _MovimentInputPrintDTO;

  factory MovimentInputPrintDTO.fromJson(Map<String, Object?> json) =>
      _$MovimentInputPrintDTOFromJson(json);

  static MovimentInputPrintDTO copy(MovimentInputPrintDTO obj) =>
      MovimentInputPrintDTO.fromJson(obj.toJson());
}
