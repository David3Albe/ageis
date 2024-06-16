import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/states/escala_page_grid_state.dart';
import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class EscalaPageGridCubit extends Cubit<EscalaPageGridState> {
  EscalaPageGridCubit() : super(EscalaPageGridState(columns: [], rows: []));

  void montaGrid({required BuildContext context}) {
    EscalaSaveDTO? dto = BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (dto == null) {
      emit(EscalaPageGridState(columns: [], rows: []));
      return;
    }
    List<PlutoColumn> columns = [
      PlutoColumn(
        title: 'Turno',
        field: 'turno',
        type: PlutoColumnType.select(
          enableColumnFilter: true,
          [],
        ),
      ),
      PlutoColumn(
        title: 'Usuário',
        field: 'usuario',
        type: PlutoColumnType.select(
          enableColumnFilter: true,
          [],
        ),
      ),
    ];
    List<DateTime> days = getDaysInMonth(dto.AnoMes.year, dto.AnoMes.month);
    for (DateTime day in days) {
      DateFormat format = DateFormat('dd');
      columns.add(
        PlutoColumn(
          title: format.format(day),
          field: day.day.toString(),
          type: PlutoColumnType.select(
            enableColumnFilter: true,
            [],
            defaultValue: 
          ),
        ),
      );
    }
  }

  List<DateTime> getDaysInMonth(int year, int month) {
    DateTime firstDayOfNextMonth;
    if (month == 12) {
      firstDayOfNextMonth = DateTime(year + 1, 1, 1);
    } else {
      firstDayOfNextMonth = DateTime(year, month + 1, 1);
    }

    DateTime lastDayOfCurrentMonth =
        firstDayOfNextMonth.subtract(const Duration(days: 1));

    List<DateTime> daysInMonth = [];
    for (int i = 0; i < lastDayOfCurrentMonth.day; i++) {
      daysInMonth.add(DateTime(year, month, i + 1));
    }

    return daysInMonth;
  }
}
