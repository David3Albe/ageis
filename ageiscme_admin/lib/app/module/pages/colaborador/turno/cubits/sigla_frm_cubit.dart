import 'package:ageiscme_admin/app/module/pages/colaborador/turno/states/turno_frm_state.dart';
import 'package:ageiscme_data/services/turno/sigla_service.dart';
import 'package:ageiscme_models/dto/turno/query_one/turno_query_one_dto.dart';
import 'package:ageiscme_models/dto/turno/save/turno_save_dto.dart';
import 'package:ageiscme_models/response_dto/turno/save/turno_save_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class TurnoFrmCubit extends Cubit<TurnoFrmState> {
  TurnoFrmCubit() : super(TurnoFrmState());

  FormGroup form = fb.group(
    <String, Object>{
      'descricao': ['', Validators.required, Validators.maxLength(50)],
      'ativo': [true],
    },
  );

  void _loadEmpty() {
    TurnoSaveDTO dto = TurnoSaveDTO.empty();
    setForm(dto: dto);
    emit(
      TurnoFrmState(
        dto: dto,
        dtoOriginal: dto,
      ),
    );
  }

  void setForm({
    required TurnoSaveDTO dto,
  }) {
    form.controls['descricao']!.value = dto.descricao;
    form.controls['ativo']!.value = dto.ativo;
  }

  void load({
    required int? cod,
    required BuildContext context,
  }) async {
    emit(TurnoFrmState(loading: true));
    if (cod == null || cod == -1) {
      _loadEmpty();
      return;
    }
    TurnoService service = Modular.get<TurnoService>();
    (String, TurnoSaveDTO)? result =
        await service.queryOne(dto: TurnoQueryOneDTO(cod: cod));
    if (result == null) {
      emit(TurnoFrmState());
      return;
    }
    emit(TurnoFrmState(dto: result.$2, dtoOriginal: result.$2));
    setForm(dto: result.$2);
  }

  void clear() {
    TurnoSaveDTO saveDTO = TurnoSaveDTO.empty();
    setForm(dto: saveDTO);
    emit(
      TurnoFrmState(
        dto: saveDTO,
        dtoOriginal: saveDTO,
      ),
    );
  }

  Future salvar({required BuildContext context}) async {
    if (!form.valid) {
      form.markAllAsTouched();
      form.markAsDirty();
      return;
    }
    _setDTO();
    if (state.dto == null) return;
    LoadingController loading = LoadingController(context: context);
    (String, TurnoSaveResponseDTO)? result =
        await Modular.get<TurnoService>().save(state.dto!);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    Navigator.of(context).pop(true);
  }

  void _setDTO() {
    TurnoSaveDTO? dto = state.dto;
    if (dto == null) return;
    dto.ativo = form.controls['ativo']!.value as bool;
    dto.descricao = form.controls['descricao']!.value as String;
  }
}
