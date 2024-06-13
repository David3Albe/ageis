import 'package:freezed_annotation/freezed_annotation.dart';

part 'processo_etapa_search_materials_dto.g.dart';
part 'processo_etapa_search_materials_dto.freezed.dart';

@unfreezed
sealed class ProcessoEtapaSearchMaterialsDTO
    with _$ProcessoEtapaSearchMaterialsDTO {
  factory ProcessoEtapaSearchMaterialsDTO({
    required int codEtapaProcesso,
  }) = _ProcessoEtapaSearchMaterialsDTO;

  factory ProcessoEtapaSearchMaterialsDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoEtapaSearchMaterialsDTOFromJson(json);
}
