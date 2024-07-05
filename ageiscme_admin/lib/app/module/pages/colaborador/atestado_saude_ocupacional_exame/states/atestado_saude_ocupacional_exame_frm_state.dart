import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/save/atestado_saude_ocupacional_exame_save_dto.dart';

class AtestadoSaudeOcupacionalExameFrmState {
  bool loading;
  AtestadoSaudeOcupacionalExameSaveDTO? dto;
  AtestadoSaudeOcupacionalExameSaveDTO? dtoOriginal;

  AtestadoSaudeOcupacionalExameFrmState({
    this.dto,
    this.dtoOriginal,
    this.loading = false,
  });
}
