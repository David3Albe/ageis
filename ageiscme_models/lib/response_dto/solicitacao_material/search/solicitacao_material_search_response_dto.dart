import 'package:ageiscme_models/response_dto/solicitacao_material/search/item/solicitacao_material_search_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/search/usuario/solicitacao_material_search_usuario_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_search_response_dto.freezed.dart';
part 'solicitacao_material_search_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialSearchResponseDTO with _$SolicitacaoMaterialSearchResponseDTO {
  factory SolicitacaoMaterialSearchResponseDTO({
    required List<SolicitacaoMaterialSearchItemResponseDTO> itens,
    required Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> usuarios,
  }) = _SolicitacaoMaterialSearchResponseDTO;

  factory SolicitacaoMaterialSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialSearchResponseDTOFromJson(json);

  static SolicitacaoMaterialSearchResponseDTO copy(SolicitacaoMaterialSearchResponseDTO obj) =>
      SolicitacaoMaterialSearchResponseDTO.fromJson(obj.toJson());
}
