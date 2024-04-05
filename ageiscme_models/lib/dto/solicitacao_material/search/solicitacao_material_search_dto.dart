import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_search_dto.freezed.dart';
part 'solicitacao_material_search_dto.g.dart';

@unfreezed
abstract class SolicitacaoMaterialSearchDTO
    with _$SolicitacaoMaterialSearchDTO {
  factory SolicitacaoMaterialSearchDTO({
    int? cod,
    bool? apenasPendentes,
    bool? apenasAutorizados,
    bool? apenasEntregues,
    bool? apenasNaoAutorizados,
    int? numeroRegistros,
    bool? ordenarPeloCodigoDecrescente,
  }) = _SolicitacaoMaterialSearchDTO;

  factory SolicitacaoMaterialSearchDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialSearchDTOFromJson(json);

  static SolicitacaoMaterialSearchDTO copy(
      SolicitacaoMaterialSearchDTO solicitacaoMaterial) {
    return SolicitacaoMaterialSearchDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
