import 'package:freezed_annotation/freezed_annotation.dart';

part 'remover_item_kit_dto.g.dart';
part 'remover_item_kit_dto.freezed.dart';

@unfreezed
sealed class RemoverItemKitDTO with _$RemoverItemKitDTO {
  factory RemoverItemKitDTO({
    required int codKit,
    String? codBarraItem,
    int? codMotivo,
    int? codUsuario,
    int? codEstoque,
  }) = _RemoverItemKitDTO;

  factory RemoverItemKitDTO.fromJson(Map<String, Object?> json) =>
      _$RemoverItemKitDTOFromJson(json);
}
