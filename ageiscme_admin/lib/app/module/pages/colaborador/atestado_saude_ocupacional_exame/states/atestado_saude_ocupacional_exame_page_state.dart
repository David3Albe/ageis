import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/query/atestado_saude_ocupacional_exame_query_response_dto.dart';

class AtestadoSaudeOcupacionalExamePageState {
  AtestadoSaudeOcupacionalExameQueryResponseDTO? response;
  bool loading;

  AtestadoSaudeOcupacionalExamePageState({
    this.response,
    this.loading = false,
  });
}
