import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'gerar_licenca_dto.g.dart';
part 'gerar_licenca_dto.freezed.dart';

@unfreezed
sealed class GerarLicencaDTO with _$GerarLicencaDTO {
  factory GerarLicencaDTO({
    String? nomeCliente,
    String? emailCliente,
    DateTime? validadeAte,
    String? servidorPrimario,
    String? servidorSecundario,
    bool? contemRelatorio,
    bool? contemAdmin,
    bool? contemProcesso,
    bool? contemAdminV2,
    bool? contemProcessoV2,
  }) = _GerarLicencaDTO;

  factory GerarLicencaDTO.fromJson(Map<String, Object?> json) =>
      _$GerarLicencaDTOFromJson(json);

  static GerarLicencaDTO copy(GerarLicencaDTO gerarLicenca) =>
      GerarLicencaDTO.fromJson(gerarLicenca.toJson());
}
