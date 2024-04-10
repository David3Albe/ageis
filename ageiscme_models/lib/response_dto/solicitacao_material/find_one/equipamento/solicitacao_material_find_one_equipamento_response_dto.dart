import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_find_one_equipamento_response_dto.freezed.dart';
part 'solicitacao_material_find_one_equipamento_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialFindOneEquipamentoResponseDTO with _$SolicitacaoMaterialFindOneEquipamentoResponseDTO {
  factory SolicitacaoMaterialFindOneEquipamentoResponseDTO({
    required int cod,
    required String nome,
  }) = _SolicitacaoMaterialFindOneEquipamentoResponseDTO;

  factory SolicitacaoMaterialFindOneEquipamentoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialFindOneEquipamentoResponseDTOFromJson(json);

  static SolicitacaoMaterialFindOneEquipamentoResponseDTO copy(SolicitacaoMaterialFindOneEquipamentoResponseDTO obj) =>
      SolicitacaoMaterialFindOneEquipamentoResponseDTO.fromJson(obj.toJson());
}
