import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_inserir_rapido_search_dto.g.dart';
part 'item_inserir_rapido_search_dto.freezed.dart';

@unfreezed
sealed class ItemInserirRapidoSearchDTO with _$ItemInserirRapidoSearchDTO {
  factory ItemInserirRapidoSearchDTO({
    required int codItem,
    required String idEtiqueta,
  }) = _ItemInserirRapidoSearchDTO;

  factory ItemInserirRapidoSearchDTO.fromJson(Map<String, Object?> json) =>
      _$ItemInserirRapidoSearchDTOFromJson(json);
}
