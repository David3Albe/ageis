import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_receive_dto.freezed.dart';
part 'solicitacao_material_receive_dto.g.dart';

@unfreezed
abstract class SolicitacaoMaterialReceiveDTO
    with _$SolicitacaoMaterialReceiveDTO {
  factory SolicitacaoMaterialReceiveDTO({
    required int cod,
    required String codBarraUsuarioRecebedor,
    required int codUsuarioEntrega,
  }) = _SolicitacaoMaterialReceiveDTO;

  factory SolicitacaoMaterialReceiveDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialReceiveDTOFromJson(json);

  static SolicitacaoMaterialReceiveDTO copy(
      SolicitacaoMaterialReceiveDTO solicitacaoMaterial) {
    return SolicitacaoMaterialReceiveDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
