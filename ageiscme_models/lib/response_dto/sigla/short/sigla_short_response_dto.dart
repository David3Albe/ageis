import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_short_response_dto.g.dart';
part 'sigla_short_response_dto.freezed.dart';

@unfreezed
sealed class SiglaShortResponseDTO with _$SiglaShortResponseDTO {
  const SiglaShortResponseDTO._();

  factory SiglaShortResponseDTO({
    required int cod,
    required String descricao,
    required String sigla,
    int? r,
    int? g,
    int? b,
    double? o,
  }) = _SiglaShortResponseDTO;

  factory SiglaShortResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaShortResponseDTOFromJson(json);

  static SiglaShortResponseDTO copy(SiglaShortResponseDTO obj) =>
      SiglaShortResponseDTO.fromJson(obj.toJson());

  String Sigla() => sigla;
  String Descricao() => descricao;
  String SiglaDescricao() => '$sigla - $descricao';

  @override
  String toString() => sigla;
}
