import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_find_one_dto.freezed.dart';
part 'solicitacao_material_find_one_dto.g.dart';

@unfreezed
abstract class SolicitacaoMaterialFindOneDTO with _$SolicitacaoMaterialFindOneDTO {
  factory SolicitacaoMaterialFindOneDTO({
    required int cod,
  }) = _SolicitacaoMaterialFindOneDTO;

  factory SolicitacaoMaterialFindOneDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialFindOneDTOFromJson(json);

  static SolicitacaoMaterialFindOneDTO copy(
      SolicitacaoMaterialFindOneDTO solicitacaoMaterial) {
    return SolicitacaoMaterialFindOneDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
