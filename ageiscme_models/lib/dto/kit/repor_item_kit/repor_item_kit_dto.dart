import 'package:freezed_annotation/freezed_annotation.dart';

part 'repor_item_kit_dto.g.dart';
part 'repor_item_kit_dto.freezed.dart';

@unfreezed
sealed class ReporItemKitDTO with _$ReporItemKitDTO {
  factory ReporItemKitDTO({
    required int codKit,
    String? codBarraItem,
    int? codMotivo,
    int? codUsuario,
  }) = _ReporItemKitDTO;

  factory ReporItemKitDTO.fromJson(Map<String, Object?> json) =>
      _$ReporItemKitDTOFromJson(json);
}
