import 'package:ageiscme_admin/app/module/pages/processo/anormalidade_tipo/states/anormalidade_tipo_frm_state.dart';
import 'package:ageiscme_data/services/anormalidade_tipo/anormalidade_tipo_service.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/query_one/anormalidade_tipo_query_one_dto.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/save/anormalidade_tipo_save_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/save/anormalidade_tipo_save_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeTipoFrmCubit extends Cubit<AnormalidadeTipoFrmState> {
  AnormalidadeTipoFrmCubit() : super(AnormalidadeTipoFrmState());

  FormGroup form = fb.group(
    <String, Object>{
      'nome': ['', Validators.required, Validators.maxLength(50)],
      'bloqueioEtapa': [false],
      'bloqueioItens': [false],
      'bloqueioTotal': [false],
      'ativo': [true],
    },
  );

  void _loadEmpty() {
    AnormalidadeTipoSaveDTO dto = AnormalidadeTipoSaveDTO.empty();
    setForm(dto: dto);
    emit(
      AnormalidadeTipoFrmState(
        dto: dto,
        dtoOriginal: dto,
      ),
    );
  }

  void setForm({
    required AnormalidadeTipoSaveDTO dto,
  }) {
    form.controls['nome']!.value = dto.nome;
    form.controls['bloqueioEtapa']!.value = dto.bloqueioEtapa;
    form.controls['bloqueioItens']!.value = dto.bloqueioItens;
    form.controls['bloqueioTotal']!.value = dto.bloqueioTotal;
    form.controls['ativo']!.value = dto.ativo;
  }

  void load({
    required int? cod,
    required BuildContext context,
  }) async {
    emit(AnormalidadeTipoFrmState(loading: true));
    if (cod == null || cod == -1) {
      _loadEmpty();
      return;
    }
    AnormalidadeTipoService service = Modular.get<AnormalidadeTipoService>();
    (String, AnormalidadeTipoSaveDTO)? result =
        await service.queryOne(dto: AnormalidadeTipoQueryOneDTO(cod: cod));
    if (result == null) {
      emit(AnormalidadeTipoFrmState());
      return;
    }
    emit(AnormalidadeTipoFrmState(dto: result.$2, dtoOriginal: result.$2));
    setForm(dto: result.$2);
  }

  void clear() {
    AnormalidadeTipoSaveDTO saveDTO = AnormalidadeTipoSaveDTO.empty();
    setForm(dto: saveDTO);
    emit(
      AnormalidadeTipoFrmState(
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
    (String, AnormalidadeTipoSaveResponseDTO)? result =
        await Modular.get<AnormalidadeTipoService>().save(state.dto!);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
  }

  void _setDTO() {
    AnormalidadeTipoSaveDTO? dto = state.dto;
    if (dto == null) return;
    dto.ativo = form.controls['ativo']!.value as bool;
    dto.bloqueioEtapa = form.controls['bloqueioEtapa']!.value as bool;
    dto.bloqueioItens = form.controls['bloqueioItens']!.value as bool;
    dto.bloqueioTotal = form.controls['bloqueioTotal']!.value as bool;
    dto.nome = form.controls['nome']!.value as String;
  }
}
