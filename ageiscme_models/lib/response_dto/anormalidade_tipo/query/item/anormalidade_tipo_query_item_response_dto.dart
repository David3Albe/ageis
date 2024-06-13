import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_query_item_response_dto.g.dart';
part 'anormalidade_tipo_query_item_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoQueryItemResponseDTO
    with _$AnormalidadeTipoQueryItemResponseDTO {
  factory AnormalidadeTipoQueryItemResponseDTO({
    required int cod,
    required String nome,
    required bool ativo,
    required bool bloqueioEtapa,
    required bool bloqueioItens,
    required bool bloqueioTotal,
    required String tstamp,
  }) = _AnormalidadeTipoQueryItemResponseDTO;

  factory AnormalidadeTipoQueryItemResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$AnormalidadeTipoQueryItemResponseDTOFromJson(json);
}
