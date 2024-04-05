import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_add_dto.freezed.dart';
part 'solicitacao_material_add_dto.g.dart';

@unfreezed
abstract class SolicitacaoMaterialAddDTO with _$SolicitacaoMaterialAddDTO {
  factory SolicitacaoMaterialAddDTO({
    required int codUsuarioSolicitante,
    required int situacao,
    required List<SolicitacaoMaterialItemModel> solicitacoesMateriais,
    String? codBarraUsuarioAutorizacao,
  }) = _SolicitacaoMaterialAddDTO;

  factory SolicitacaoMaterialAddDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialAddDTOFromJson(json);

  static SolicitacaoMaterialAddDTO copy(
      SolicitacaoMaterialAddDTO solicitacaoMaterial) {
    return SolicitacaoMaterialAddDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
