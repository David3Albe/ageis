import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_save_dto.g.dart';
part 'item_save_dto.freezed.dart';

@unfreezed
sealed class ItemSaveDTO with _$ItemSaveDTO {
  factory ItemSaveDTO({
    required bool? atualizarTodosItensZ,
    required ItemModel item,
  }) = _ItemSaveDTO;

  factory ItemSaveDTO.fromJson(Map<String, Object?> json) =>
      _$ItemSaveDTOFromJson(json);
}
