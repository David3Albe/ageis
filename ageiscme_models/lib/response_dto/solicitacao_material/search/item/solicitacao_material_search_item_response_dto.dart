import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_search_item_response_dto.freezed.dart';
part 'solicitacao_material_search_item_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialSearchItemResponseDTO with _$SolicitacaoMaterialSearchItemResponseDTO {
  factory SolicitacaoMaterialSearchItemResponseDTO({
         required int cod,
         required int itensSolicitados,
         required int itensEntregues,
         required DateTime dataSolicitacao,
         required int codUsuarioSolicitacao,
         int? codUsuarioRecebimento,
         int? codUsuarioEntrega,
         DateTime? dataEntrega,
         int? codUsuarioAutorizacao,
         DateTime? dataAutorizacao,
  }) = _SolicitacaoMaterialSearchItemResponseDTO;

  factory SolicitacaoMaterialSearchItemResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialSearchItemResponseDTOFromJson(json);

  static SolicitacaoMaterialSearchItemResponseDTO copy(
          SolicitacaoMaterialSearchItemResponseDTO obj) =>
      SolicitacaoMaterialSearchItemResponseDTO.fromJson(obj.toJson());
}
