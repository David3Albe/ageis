import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_authorize_response_dto.freezed.dart';
part 'solicitacao_material_authorize_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialAuthorizeResponseDTO
    with _$SolicitacaoMaterialAuthorizeResponseDTO {
  factory SolicitacaoMaterialAuthorizeResponseDTO() =
      _SolicitacaoMaterialAuthorizeResponseDTO;

  factory SolicitacaoMaterialAuthorizeResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$SolicitacaoMaterialAuthorizeResponseDTOFromJson(json);

  static SolicitacaoMaterialAuthorizeResponseDTO copy(
          SolicitacaoMaterialAuthorizeResponseDTO obj) =>
      SolicitacaoMaterialAuthorizeResponseDTO.fromJson(obj.toJson());
}
