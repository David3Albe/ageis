import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_remove_dto.g.dart';
part 'anormalidade_remove_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeRemoveDTO with _$AnormalidadeRemoveDTO {
  factory AnormalidadeRemoveDTO({
    required int cod,
    required String tstamp,
  }) = _AnormalidadeRemoveDTO;

  factory AnormalidadeRemoveDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeRemoveDTOFromJson(json);
}
