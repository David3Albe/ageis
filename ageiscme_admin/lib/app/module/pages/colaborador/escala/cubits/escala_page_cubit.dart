import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_grid_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/states/escala_page_state.dart';
import 'package:ageiscme_data/services/escala/escala_service.dart';
import 'package:ageiscme_models/dto/escala/query_one/escala_query_one_dto.dart';
import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';
import 'package:ageiscme_models/response_dto/escala/save/escala_save_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class EscalaPageCubit extends Cubit<EscalaPageState> {
  EscalaPageCubit() : super(EscalaPageState());

  Future queryOne({
    required BuildContext context,
  }) async {
    DateTime? date = state.data;
    if (date == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Selecione um ano mês para consultar a escala',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);

    date = DateTime(date.year, date.month, 1);
    emit(EscalaPageState(loading: true, data: date));
    (String, EscalaSaveDTO)? result =
        await Modular.get<EscalaService>().queryOne(
      dto: EscalaQueryOneDTO(
        anoMes: date,
      ),
    );
    emit(EscalaPageState(escala: result?.$2, data: date));
    await BlocProvider.of<EscalaPageGridCubit>(context)
        .montaGrid(context: context);
    loading.closeDefault();
  }

  void setData({required DateTime? data}) {
    emit(
      EscalaPageState(
        data: data,
        escala: state.escala,
        loading: state.loading,
      ),
    );
  }

  Future salvar({
    required BuildContext context,
  }) async {
    EscalaSaveDTO? escala = state.escala;
    if (escala == null) {
      ToastUtils.showCustomToastNotice(context, 'Escala não definida');
      return;
    }
    LoadingController loading = LoadingController(context: context);

    escala.turnos =
        BlocProvider.of<EscalaPageGridCubit>(context).getTurnosEscala(
      context: context,
      escala: escala,
    );

    (String, EscalaSaveResponseDTO)? result =
        await Modular.get<EscalaService>().save(escala);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
  }
}
