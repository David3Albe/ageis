import 'package:ageiscme_admin/app/module/pages/colaborador/escala/states/escala_page_state.dart';
import 'package:ageiscme_data/services/escala/escala_service.dart';
import 'package:ageiscme_models/dto/escala/query_one/escala_query_one_dto.dart';
import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';
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
    date = DateTime(date.year, date.month, 1);
    emit(EscalaPageState(loading: true));
    (String, EscalaSaveDTO)? result =
        await Modular.get<EscalaService>().queryOne(
      dto: EscalaQueryOneDTO(
        anoMes: date,
      ),
    );
    emit(EscalaPageState(escala: result?.$2));
  }

  void setData({required DateTime data}) {
    emit(
      EscalaPageState(
        data: data,
        escala: state.escala,
        loading: state.loading,
      ),
    );
  }
}
