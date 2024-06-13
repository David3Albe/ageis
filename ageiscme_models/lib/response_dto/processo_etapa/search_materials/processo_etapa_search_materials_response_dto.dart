import 'package:freezed_annotation/freezed_annotation.dart';

part 'processo_etapa_search_materials_response_dto.g.dart';
part 'processo_etapa_search_materials_response_dto.freezed.dart';

@unfreezed
sealed class ProcessoEtapaSearchMaterialsResponseDTO
    with _$ProcessoEtapaSearchMaterialsResponseDTO {
  factory ProcessoEtapaSearchMaterialsResponseDTO({
    required List<String> materiais,
  }) = _ProcessoEtapaSearchMaterialsResponseDTO;

  factory ProcessoEtapaSearchMaterialsResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoEtapaSearchMaterialsResponseDTOFromJson(json);
}
