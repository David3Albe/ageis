import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_andamento_detail_filter_dto.freezed.dart';
part 'processo_leitura_andamento_detail_filter_dto.g.dart';

@unfreezed
abstract class ProcessoLeituraAndamentoDetailFilterDTO
    with _$ProcessoLeituraAndamentoDetailFilterDTO {
  factory ProcessoLeituraAndamentoDetailFilterDTO({
    required int cod,
    required int codUsuario,
  }) = _ProcessoLeituraAndamentoDetailFilterDTO;

  factory ProcessoLeituraAndamentoDetailFilterDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraAndamentoDetailFilterDTOFromJson(json);

  static ProcessoLeituraAndamentoDetailFilterDTO copy(
      ProcessoLeituraAndamentoDetailFilterDTO solicitacaoMaterial) {
    return ProcessoLeituraAndamentoDetailFilterDTO.fromJson(solicitacaoMaterial.toJson());
  }
}
