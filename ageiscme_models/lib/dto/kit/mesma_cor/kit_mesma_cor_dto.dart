import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_mesma_cor_dto.g.dart';
part 'kit_mesma_cor_dto.freezed.dart';

@unfreezed
sealed class KitMesmaCorDTO with _$KitMesmaCorDTO {
  factory KitMesmaCorDTO({
    int? codKit,
    int? codCor1,
    int? codCor2,
    int? codCor3,
    int? codCor4,
  }) = _KitMesmaCorDTO;

  factory KitMesmaCorDTO.fromJson(Map<String, Object?> json) =>
      _$KitMesmaCorDTOFromJson(json);
}
