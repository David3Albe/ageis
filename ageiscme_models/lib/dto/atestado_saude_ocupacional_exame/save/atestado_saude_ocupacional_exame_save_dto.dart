import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_save_dto.g.dart';
part 'atestado_saude_ocupacional_exame_save_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameSaveDTO
    with _$AtestadoSaudeOcupacionalExameSaveDTO {
  factory AtestadoSaudeOcupacionalExameSaveDTO({
    required int cod,
    required int codAsoUsuario,
    DateTime? dataRealizacao,
    String? exame,
    String? doc,
    String? docNome,
    String? imagemExame,
    String? observacoes,
    String? tStamp,
    DateTime? ultimaAlteracao,
    int? codInstituicao,
    DateTime? dataAso,
    String? nomeUsuarioAso,
  }) = _AtestadoSaudeOcupacionalExameSaveDTO;

  factory AtestadoSaudeOcupacionalExameSaveDTO.fromJson(
          Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameSaveDTOFromJson(json);

  factory AtestadoSaudeOcupacionalExameSaveDTO.withASO(
          AtestadoSaudeOcupacionalModel aso) =>
      AtestadoSaudeOcupacionalExameSaveDTO(
        cod: 0,
        codAsoUsuario: aso.cod!,
        dataRealizacao: DateTime.now(),
        exame: '',
      );
}
