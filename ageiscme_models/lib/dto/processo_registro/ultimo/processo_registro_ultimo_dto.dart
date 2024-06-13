import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_registro_ultimo_dto.freezed.dart';
part 'processo_registro_ultimo_dto.g.dart';

@unfreezed
abstract class ProcessoRegistroUltimoDTO with _$ProcessoRegistroUltimoDTO {
  factory ProcessoRegistroUltimoDTO({
    int? codItem,
    int? codEtapa,
    bool? incluirEstoque,
    bool? carregarEtapa,
  }) = _ProcessoRegistroUltimoDTO;

  factory ProcessoRegistroUltimoDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoRegistroUltimoDTOFromJson(json);
}
