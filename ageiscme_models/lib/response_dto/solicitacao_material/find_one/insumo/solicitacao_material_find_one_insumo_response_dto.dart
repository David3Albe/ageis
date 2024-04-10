import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_find_one_insumo_response_dto.freezed.dart';
part 'solicitacao_material_find_one_insumo_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialFindOneInsumoResponseDTO with _$SolicitacaoMaterialFindOneInsumoResponseDTO {
  factory SolicitacaoMaterialFindOneInsumoResponseDTO({
    required int cod,
    required String nome,
    required int codBarra,
    String? unidadeMedida,
  }) = _SolicitacaoMaterialFindOneInsumoResponseDTO;

  factory SolicitacaoMaterialFindOneInsumoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialFindOneInsumoResponseDTOFromJson(json);

  static SolicitacaoMaterialFindOneInsumoResponseDTO copy(SolicitacaoMaterialFindOneInsumoResponseDTO obj) =>
      SolicitacaoMaterialFindOneInsumoResponseDTO.fromJson(obj.toJson());
}
