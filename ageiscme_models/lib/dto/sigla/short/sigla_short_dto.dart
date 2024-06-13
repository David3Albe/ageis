import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_short_dto.g.dart';
part 'sigla_short_dto.freezed.dart';

@unfreezed
sealed class SiglaShortDTO with _$SiglaShortDTO {
  factory SiglaShortDTO({
    String? termoPesquisa,
    required int numeroRegistros,
    bool? ativosApenas,
  }) = _SiglaShortDTO;

  factory SiglaShortDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaShortDTOFromJson(json);
}
