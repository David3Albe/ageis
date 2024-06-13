import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_query_one_dto.g.dart';
part 'sigla_query_one_dto.freezed.dart';

@unfreezed
sealed class SiglaQueryOneDTO with _$SiglaQueryOneDTO {
  factory SiglaQueryOneDTO({
    required int cod,
  }) = _SiglaQueryOneDTO;

  factory SiglaQueryOneDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaQueryOneDTOFromJson(json);
}
