import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/item/processo_leitura_andamento_item_detail_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_andamento_kit_detail_dto.freezed.dart';
part 'processo_leitura_andamento_kit_detail_dto.g.dart';

@unfreezed
abstract class ProcessoLeituraAndamentoKitDetailDTO
    with _$ProcessoLeituraAndamentoKitDetailDTO {
  factory ProcessoLeituraAndamentoKitDetailDTO({
    required int cod,
    required String codBarra,
    required String descricao,
    required List<ProcessoLeituraAndamentoItemDetailDTO> itens,
  }) = _ProcessoLeituraAndamentoKitDetailDTO;

  factory ProcessoLeituraAndamentoKitDetailDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoLeituraAndamentoKitDetailDTOFromJson(json);

  static ProcessoLeituraAndamentoKitDetailDTO copy(
      ProcessoLeituraAndamentoKitDetailDTO solicitacaoMaterial) {
    return ProcessoLeituraAndamentoKitDetailDTO.fromJson(
        solicitacaoMaterial.toJson());
  }
}
