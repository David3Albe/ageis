import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_query_one_dto.g.dart';
part 'anormalidade_query_one_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeQueryOneDTO with _$AnormalidadeQueryOneDTO {
  factory AnormalidadeQueryOneDTO({
    required int cod,
  }) = _AnormalidadeQueryOneDTO;

  factory AnormalidadeQueryOneDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeQueryOneDTOFromJson(json);
}
