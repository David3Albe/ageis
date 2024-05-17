import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_inserir_rapido_gerar_inserir_dto.g.dart';
part 'item_inserir_rapido_gerar_inserir_dto.freezed.dart';

@unfreezed
sealed class ItemInserirRapidoGerarInserirDTO with _$ItemInserirRapidoGerarInserirDTO {
  factory ItemInserirRapidoGerarInserirDTO({
    String? idEtiqueta,
    int? quantidade,
    int? quantidadeExistente,
    int? quantidadeMaxima,
    int? tamanho,
    String? idEtiquetaBase,
  }) = _ItemInserirRapidoGerarInserirDTO;

  factory ItemInserirRapidoGerarInserirDTO.fromJson(Map<String, Object?> json) =>
      _$ItemInserirRapidoGerarInserirDTOFromJson(json);
}
