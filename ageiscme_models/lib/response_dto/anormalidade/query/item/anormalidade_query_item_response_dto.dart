import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_query_item_response_dto.g.dart';
part 'anormalidade_query_item_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeQueryItemResponseDTO
    with _$AnormalidadeQueryItemResponseDTO {
  factory AnormalidadeQueryItemResponseDTO({
    required int cod,
    required DateTime dataHora,
    required String descricao,
    String? tstamp,
    String? idEtiqueta,
    String? nomeItem,
    String? nomeUsuario,
    String? nomeAnormalidadeTipo,
    String? nomeUsuarioLiberacao,
    DateTime? dataLiberacao,
    String? nomeProcessoEtapa,
  }) = _AnormalidadeQueryItemResponseDTO;

  factory AnormalidadeQueryItemResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$AnormalidadeQueryItemResponseDTOFromJson(json);
}
