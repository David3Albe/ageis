import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/item/processo_leitura_andamento_item_detail_dto.dart';
import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/kit/processo_leitura_andamento_kit_detail_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_andamento_detail_dto.freezed.dart';
part 'processo_leitura_andamento_detail_dto.g.dart';

@unfreezed
abstract class ProcessoLeituraAndamentoDetailDTO
    with _$ProcessoLeituraAndamentoDetailDTO {
  factory ProcessoLeituraAndamentoDetailDTO({
    required int cod,
    required DateTime dataHora,
    required String maquina,
    required String nomeUsuario,
    required List<ProcessoLeituraAndamentoItemDetailDTO> itens,
    required List<ProcessoLeituraAndamentoKitDetailDTO> kits,
  }) = _ProcessoLeituraAndamentoDetailDTO;

  factory ProcessoLeituraAndamentoDetailDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoLeituraAndamentoDetailDTOFromJson(json);

  static ProcessoLeituraAndamentoDetailDTO copy(
      ProcessoLeituraAndamentoDetailDTO solicitacaoMaterial) {
    return ProcessoLeituraAndamentoDetailDTO.fromJson(
        solicitacaoMaterial.toJson());
  }
}
