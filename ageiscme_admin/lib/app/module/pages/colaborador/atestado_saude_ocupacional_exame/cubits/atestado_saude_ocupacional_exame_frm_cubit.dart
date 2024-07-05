import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/states/atestado_saude_ocupacional_exame_frm_state.dart';
import 'package:ageiscme_data/services/atestado_saude_ocupacional_exame/atestado_saude_ocupacional_exame_service.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/query_one/atestado_saude_ocupacional_exame_query_one_dto.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/save/atestado_saude_ocupacional_exame_save_dto.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/save/atestado_saude_ocupacional_exame_save_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalExameFrmCubit
    extends Cubit<AtestadoSaudeOcupacionalExameFrmState> {
  AtestadoSaudeOcupacionalExameFrmCubit({
    required this.aso,
  }) : super(AtestadoSaudeOcupacionalExameFrmState());

  final AtestadoSaudeOcupacionalModel aso;

  Future _loadEmpty() async {
    AtestadoSaudeOcupacionalExameSaveDTO dto = await _getEmptyDTO();

    emit(
      AtestadoSaudeOcupacionalExameFrmState(
        dto: dto,
        dtoOriginal: dto,
      ),
    );
  }

  Future<AtestadoSaudeOcupacionalExameSaveDTO> _getEmptyDTO() async {
    return AtestadoSaudeOcupacionalExameSaveDTO(
      cod: 0,
      codAsoUsuario: aso.cod!,
    );
  }

  void load({
    required int? cod,
    required BuildContext context,
  }) async {
    emit(AtestadoSaudeOcupacionalExameFrmState(loading: true));
    if (cod == null || cod == 0) {
      await _loadEmpty();
      return;
    }
    (String, AtestadoSaudeOcupacionalExameSaveDTO)? result =
        await Modular.get<AtestadoSaudeOcupacionalExameService>().queryOne(
      dto: AtestadoSaudeOcupacionalExameQueryOneDTO(
        cod: cod,
      ),
    );
    if (result == null) {
      emit(AtestadoSaudeOcupacionalExameFrmState());
      return;
    }
    emit(
      AtestadoSaudeOcupacionalExameFrmState(
        dto: result.$2,
        dtoOriginal: result.$2,
      ),
    );
  }

  Future clear() async {
    AtestadoSaudeOcupacionalExameSaveDTO? dto = state.dto;
    if (dto == null) return;
    dto.cod = 0;
    dto.dataRealizacao = null;
    dto.exame = null;
    dto.dataAso = null;
    dto.doc = null;
    dto.docNome = null;
    dto.imagemExame = null;
    emit(
      AtestadoSaudeOcupacionalExameFrmState(
        dto: dto,
        dtoOriginal: dto,
      ),
    );
  }

  Future salvar({
    required BuildContext context,
    required void Function() onSaved,
  }) async {
    if (state.dto == null) return;
    LoadingController loading = LoadingController(context: context);
    (String, AtestadoSaudeOcupacionalExameSaveResponseDTO)? result =
        await Modular.get<AtestadoSaudeOcupacionalExameService>()
            .save(state.dto!);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    onSaved();
  }

  void _change({
    required AtestadoSaudeOcupacionalExameSaveDTO dto,
  }) {
    emit(
      AtestadoSaudeOcupacionalExameFrmState(
        dto: dto,
        dtoOriginal: state.dtoOriginal,
      ),
    );
  }

  void changeExame(
    String? exame,
  ) {
    if (state.dto == null) return;
    state.dto!.exame = exame;
    _change(dto: state.dto!);
  }

  void changeDataRealizacao(
    DateTime? dataRealizacao,
  ) {
    if (state.dto == null) return;
    state.dto!.dataRealizacao = dataRealizacao;
    _change(dto: state.dto!);
  }
}
