import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_find_one_usuario_response_dto.freezed.dart';
part 'solicitacao_material_find_one_usuario_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialFindOneUsuarioResponseDTO with _$SolicitacaoMaterialFindOneUsuarioResponseDTO {
  factory SolicitacaoMaterialFindOneUsuarioResponseDTO({
    required int cod,
    required String nome,
  }) = _SolicitacaoMaterialFindOneUsuarioResponseDTO;

  factory SolicitacaoMaterialFindOneUsuarioResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialFindOneUsuarioResponseDTOFromJson(json);

  static SolicitacaoMaterialFindOneUsuarioResponseDTO copy(SolicitacaoMaterialFindOneUsuarioResponseDTO obj) =>
      SolicitacaoMaterialFindOneUsuarioResponseDTO.fromJson(obj.toJson());
}
