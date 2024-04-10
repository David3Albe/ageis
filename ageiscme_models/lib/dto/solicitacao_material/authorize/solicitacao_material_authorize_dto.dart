import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_authorize_dto.freezed.dart';
part 'solicitacao_material_authorize_dto.g.dart';

@unfreezed
abstract class SolicitacaoMaterialAuthorizeDTO
    with _$SolicitacaoMaterialAuthorizeDTO {
  factory SolicitacaoMaterialAuthorizeDTO({
    required int cod,
    required String codBarraUsuario,
  }) = _SolicitacaoMaterialAuthorizeDTO;

  factory SolicitacaoMaterialAuthorizeDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialAuthorizeDTOFromJson(json);

  static SolicitacaoMaterialAuthorizeDTO copy(
      SolicitacaoMaterialAuthorizeDTO solicitacaoMaterial) {
    return SolicitacaoMaterialAuthorizeDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
