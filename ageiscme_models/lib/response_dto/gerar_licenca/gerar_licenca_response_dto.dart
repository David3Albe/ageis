import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'gerar_licenca_response_dto.g.dart';
part 'gerar_licenca_response_dto.freezed.dart';

@unfreezed
sealed class GerarLicencaResponseDTO with _$GerarLicencaResponseDTO {
  factory GerarLicencaResponseDTO({
    String? licenca,
  }) = _GerarLicencaResponseDTO;

  factory GerarLicencaResponseDTO.fromJson(Map<String, Object?> json) =>
      _$GerarLicencaResponseDTOFromJson(json);

  static GerarLicencaResponseDTO copy(GerarLicencaResponseDTO gerarLicenca) =>
      GerarLicencaResponseDTO.fromJson(gerarLicenca.toJson());
}
