import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_receive_response_dto.freezed.dart';
part 'solicitacao_material_receive_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialReceiveResponseDTO
    with _$SolicitacaoMaterialReceiveResponseDTO {
  factory SolicitacaoMaterialReceiveResponseDTO() =
      _SolicitacaoMaterialReceiveResponseDTO;

  factory SolicitacaoMaterialReceiveResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$SolicitacaoMaterialReceiveResponseDTOFromJson(json);

  static SolicitacaoMaterialReceiveResponseDTO copy(
          SolicitacaoMaterialReceiveResponseDTO obj) =>
      SolicitacaoMaterialReceiveResponseDTO.fromJson(obj.toJson());
}
