import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/find_one/usuario/solicitacao_material_find_one_usuario_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_find_one_response_dto.freezed.dart';
part 'solicitacao_material_find_one_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialFindOneResponseDTO with _$SolicitacaoMaterialFindOneResponseDTO {
  factory SolicitacaoMaterialFindOneResponseDTO({
    SolicitacaoMaterialModel? solicitacao,
    required Map<int, SolicitacaoMaterialFindOneUsuarioResponseDTO> usuarios,
  }) = _SolicitacaoMaterialFindOneResponseDTO;

  factory SolicitacaoMaterialFindOneResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialFindOneResponseDTOFromJson(json);

  static SolicitacaoMaterialFindOneResponseDTO copy(SolicitacaoMaterialFindOneResponseDTO obj) =>
      SolicitacaoMaterialFindOneResponseDTO.fromJson(obj.toJson());
}
