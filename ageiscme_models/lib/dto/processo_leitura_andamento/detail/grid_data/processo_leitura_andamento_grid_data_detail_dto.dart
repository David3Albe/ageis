import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_andamento_grid_data_detail_dto.freezed.dart';
part 'processo_leitura_andamento_grid_data_detail_dto.g.dart';

@unfreezed
abstract class ProcessoLeituraAndamentoGridDataDetailDTO
    with _$ProcessoLeituraAndamentoGridDataDetailDTO {
  factory ProcessoLeituraAndamentoGridDataDetailDTO({
    int? codKit,
    int? codItem,
    String? idEtiquetaItem,
    String? codBarraKit,
    String? descricaoKit,
    String? descricaoItem,
  }) = _ProcessoLeituraAndamentoGridDataDetailDTO;

  factory ProcessoLeituraAndamentoGridDataDetailDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraAndamentoGridDataDetailDTOFromJson(json);

  static ProcessoLeituraAndamentoGridDataDetailDTO copy(
      ProcessoLeituraAndamentoGridDataDetailDTO solicitacaoMaterial) {
    return ProcessoLeituraAndamentoGridDataDetailDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
