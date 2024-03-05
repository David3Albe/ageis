import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_save_result_dto.g.dart';
part 'item_save_result_dto.freezed.dart';

@unfreezed
sealed class ItemSaveResultDTO with _$ItemSaveResultDTO {
  factory ItemSaveResultDTO({
    required ItemModel item,
    String? impressaoConsignado,
  }) = _ItemSaveResultDTO;

  factory ItemSaveResultDTO.fromJson(Map<String, Object?> json) =>
      _$ItemSaveResultDTOFromJson(json);
}
