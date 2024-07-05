import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/states/atestado_saude_ocupacional_exame_page_state.dart';
import 'package:ageiscme_data/services/atestado_saude_ocupacional_exame/atestado_saude_ocupacional_exame_service.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/query/atestado_saude_ocupacional_exame_query_dto.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/query/atestado_saude_ocupacional_exame_query_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';

class AtestadoSaudeOcupacionalExamePageCubit
    extends Cubit<AtestadoSaudeOcupacionalExamePageState> {
  AtestadoSaudeOcupacionalExamePageCubit({
    required this.aso,
  }) : super(AtestadoSaudeOcupacionalExamePageState());

  final AtestadoSaudeOcupacionalModel aso;

  Future load() async {
    emit(
      AtestadoSaudeOcupacionalExamePageState(
        loading: true,
        response: state.response,
      ),
    );
    (String, AtestadoSaudeOcupacionalExameQueryResponseDTO)? result =
        await Modular.get<AtestadoSaudeOcupacionalExameService>().query(
      dto: AtestadoSaudeOcupacionalExameQueryDTO(
        codAsoUsuario: aso.cod,
      ),
    );
    emit(
      AtestadoSaudeOcupacionalExamePageState(
        response: result?.$2,
      ),
    );
  }
}
