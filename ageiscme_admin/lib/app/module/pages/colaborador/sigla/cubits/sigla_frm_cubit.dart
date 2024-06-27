import 'package:ageiscme_admin/app/module/pages/colaborador/sigla/states/sigla_frm_state.dart';
import 'package:ageiscme_data/services/sigla/sigla_service.dart';
import 'package:ageiscme_models/dto/sigla/query_one/sigla_query_one_dto.dart';
import 'package:ageiscme_models/dto/sigla/save/sigla_save_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/save/sigla_save_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class SiglaFrmCubit extends Cubit<SiglaFrmState> {
  SiglaFrmCubit() : super(SiglaFrmState());

  FormGroup form = fb.group(
    <String, Object>{
      'descricao': ['', Validators.required, Validators.maxLength(50)],
      'sigla': ['', Validators.required, Validators.maxLength(5)],
      'corRGB': FormControl<Color>(value: null),
      'ativo': [true],
    },
  );

  void _loadEmpty() {
    SiglaSaveDTO dto = SiglaSaveDTO.empty();
    setForm(dto: dto);
    emit(
      SiglaFrmState(
        dto: dto,
        dtoOriginal: dto,
      ),
    );
  }

  void setForm({
    required SiglaSaveDTO dto,
  }) {
    form.controls['descricao']!.value = dto.descricao;
    form.controls['sigla']!.value = dto.sigla;
    form.controls['ativo']!.value = dto.ativo;
    form.controls['corRGB']!.value =
        dto.r != null && dto.b != null && dto.g != null && dto.o != null
            ? Color.fromRGBO(dto.r!, dto.g!, dto.b!, dto.o!)
            : null;
  }

  void load({
    required int? cod,
    required BuildContext context,
  }) async {
    emit(SiglaFrmState(loading: true));
    if (cod == null || cod == -1) {
      _loadEmpty();
      return;
    }
    SiglaService service = Modular.get<SiglaService>();
    (String, SiglaSaveDTO)? result =
        await service.queryOne(dto: SiglaQueryOneDTO(cod: cod));
    if (result == null) {
      emit(SiglaFrmState());
      return;
    }
    emit(SiglaFrmState(dto: result.$2, dtoOriginal: result.$2));
    setForm(dto: result.$2);
  }

  void clear() {
    SiglaSaveDTO saveDTO = SiglaSaveDTO.empty();
    setForm(dto: saveDTO);
    emit(
      SiglaFrmState(
        dto: saveDTO,
        dtoOriginal: saveDTO,
      ),
    );
  }

  Future salvar({
    required BuildContext context,
    required void Function() onSaved,
  }) async {
    if (!form.valid) {
      form.markAllAsTouched();
      form.markAsDirty();
      return;
    }
    _setDTO();
    if (state.dto == null) return;
    LoadingController loading = LoadingController(context: context);
    (String, SiglaSaveResponseDTO)? result =
        await Modular.get<SiglaService>().save(state.dto!);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    onSaved();
  }

  void _setDTO() {
    SiglaSaveDTO? dto = state.dto;
    if (dto == null) return;
    dto.ativo = form.controls['ativo']!.value as bool;
    dto.descricao = form.controls['descricao']!.value as String;
    dto.sigla = form.controls['sigla']!.value as String;
    Color? cor = form.controls['corRGB']!.value as Color?;
    if (cor != null) {
      dto.r = cor.red;
      dto.g = cor.green;
      dto.b = cor.blue;
      dto.o = cor.opacity;
    }
  }
}
