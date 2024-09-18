import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_andamento_item_detail_dto.freezed.dart';
part 'processo_leitura_andamento_item_detail_dto.g.dart';

@unfreezed
abstract class ProcessoLeituraAndamentoItemDetailDTO
    with _$ProcessoLeituraAndamentoItemDetailDTO {
  factory ProcessoLeituraAndamentoItemDetailDTO({
    required int cod,
    required String idEtiqueta,
    required String descricao,
    int? codKit,
  }) = _ProcessoLeituraAndamentoItemDetailDTO;

  factory ProcessoLeituraAndamentoItemDetailDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraAndamentoItemDetailDTOFromJson(json);

  static ProcessoLeituraAndamentoItemDetailDTO copy(
      ProcessoLeituraAndamentoItemDetailDTO solicitacaoMaterial) {
    return ProcessoLeituraAndamentoItemDetailDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
