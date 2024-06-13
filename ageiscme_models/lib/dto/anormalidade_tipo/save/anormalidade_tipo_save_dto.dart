import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_save_dto.g.dart';
part 'anormalidade_tipo_save_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoSaveDTO with _$AnormalidadeTipoSaveDTO {
  factory AnormalidadeTipoSaveDTO({
    required int cod,
    required String nome,
    required bool ativo,
    required bool bloqueioEtapa,
    required bool bloqueioItens,
    required bool bloqueioTotal,
    DateTime? ultimaAlteracao,
    String? tstamp,
    int? codInstituicao,
  }) = _AnormalidadeTipoSaveDTO;

  factory AnormalidadeTipoSaveDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoSaveDTOFromJson(json);

  factory AnormalidadeTipoSaveDTO.empty() => AnormalidadeTipoSaveDTO(
        ativo: true,
        bloqueioEtapa: false,
        bloqueioItens: false,
        bloqueioTotal: false,
        cod: -1,
        nome: '',
      );
}
