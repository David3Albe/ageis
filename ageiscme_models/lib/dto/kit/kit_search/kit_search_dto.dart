import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_search_dto.g.dart';
part 'kit_search_dto.freezed.dart';

@unfreezed
sealed class KitSearchDTO with _$KitSearchDTO {
  factory KitSearchDTO() = _KitSearchDTO;

  factory KitSearchDTO.fromJson(Map<String, Object?> json) =>
      _$KitSearchDTOFromJson(json);
}
