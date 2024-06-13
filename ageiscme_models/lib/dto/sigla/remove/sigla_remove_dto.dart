import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_remove_dto.g.dart';
part 'sigla_remove_dto.freezed.dart';

@unfreezed
sealed class SiglaRemoveDTO with _$SiglaRemoveDTO {
  factory SiglaRemoveDTO({
    required int cod,
    required String tstamp,
  }) = _SiglaRemoveDTO;

  factory SiglaRemoveDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaRemoveDTOFromJson(json);
}
