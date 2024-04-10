import 'package:ageiscme_models/models/insumo_movimento/insumo_movimento_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insumo_movimento_save_dto.freezed.dart';
part 'insumo_movimento_save_dto.g.dart';

@unfreezed
abstract class InsumoMovimentoSaveDTO with _$InsumoMovimentoSaveDTO {
  factory InsumoMovimentoSaveDTO({
    required InsumoMovimentoModel insumoMovimento,
    int? numeroSolicitacaoItem,
  }) = _InsumoMovimentoSaveDTO;

  factory InsumoMovimentoSaveDTO.fromJson(Map<String, Object?> json) =>
      _$InsumoMovimentoSaveDTOFromJson(json);

  static InsumoMovimentoSaveDTO copy(
      InsumoMovimentoSaveDTO solicitacaoMaterial) {
    return InsumoMovimentoSaveDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
