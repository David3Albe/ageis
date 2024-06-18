import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'escala_save_response_dto.freezed.dart';
part 'escala_save_response_dto.g.dart';

@unfreezed
abstract class EscalaSaveResponseDTO with _$EscalaSaveResponseDTO {
  EscalaSaveResponseDTO._();

  factory EscalaSaveResponseDTO() = _EscalaSaveResponseDTO;

  factory EscalaSaveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EscalaSaveResponseDTOFromJson(json);

  static EscalaSaveResponseDTO copy(EscalaSaveResponseDTO escala) =>
      EscalaSaveResponseDTO.fromJson(escala.toJson());
}
