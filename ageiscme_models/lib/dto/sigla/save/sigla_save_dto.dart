import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_save_dto.g.dart';
part 'sigla_save_dto.freezed.dart';

@unfreezed
sealed class SiglaSaveDTO with _$SiglaSaveDTO {
  factory SiglaSaveDTO({
    required int cod,
    required String descricao,
    required String sigla,
    required bool ativo,
    int? corRGB,
    DateTime? ultimaAlteracao,
    String? tstamp,
    int? codInstituicao,
  }) = _SiglaSaveDTO;

  factory SiglaSaveDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaSaveDTOFromJson(json);

  factory SiglaSaveDTO.empty() => SiglaSaveDTO(
        ativo: true,
        descricao: '',
        sigla: '',
        cod: -1,
      );
}
