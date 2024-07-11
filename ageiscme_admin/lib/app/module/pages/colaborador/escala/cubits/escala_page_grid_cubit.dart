import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/sigla/sigla_short_response_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/turno/turno_short_response_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_drop_down_search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/sigla_drop_down_search_widget.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/states/escala_page_grid_state.dart';
import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';
import 'package:ageiscme_models/dto/escala/save/turno/escala_turno_save_dto.dart';
import 'package:ageiscme_models/dto/escala/save/turno/usuario/escala_turno_usuario_save_dto.dart';
import 'package:ageiscme_models/dto/escala/save/turno/usuario/sigla/escala_turno_usuario_sigla_save_dto.dart';
import 'package:ageiscme_models/dto/sigla/short/sigla_short_dto.dart';
import 'package:ageiscme_models/dto/turno/short/turno_short_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/short/sigla_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/pluto_grid_data_export.dart' as pluto;
import 'package:flutter/material.dart';

class EscalaPageGridCubit extends Cubit<EscalaPageGridState> {
  EscalaPageGridCubit()
      : super(
          EscalaPageGridState(
            groups: [],
            columns: [],
            rows: [],
            stateManager: null,
          ),
        );

  void setStateManager({
    required PlutoGridStateManager stateManager,
  }) {
    emit(
      EscalaPageGridState(
        groups: [],
        columns: state.columns,
        rows: state.rows,
        stateManager: stateManager,
      ),
    );
  }

  Future montaGrid({required BuildContext context}) async {
    EscalaSaveDTO? dto = BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (dto == null) {
      emit(
        EscalaPageGridState(
          columns: [],
          groups: [],
          rows: [],
          stateManager: state.stateManager,
        ),
      );
      return;
    }
    await Future.wait(getFutures(context: context));

    List<PlutoColumn> columns = [
      PlutoColumn(
        title: 'Turno',
        field: 'turno',
        frozen: PlutoColumnFrozen.start,
        width: 150,
        readOnly: true,
        type: PlutoColumnType.select(
          enableColumnFilter: true,
          BlocProvider.of<TurnoShortResponseCubit>(context).state.turnos,
        ),
      ),
      PlutoColumn(
        title: 'Usuário',
        field: 'usuario',
        frozen: PlutoColumnFrozen.start,
        type: PlutoColumnType.select(
          enableColumnFilter: true,
          BlocProvider.of<UsuarioDropDownSearchCubit>(context).state.usuarios,
        ),
      ),
      PlutoColumn(
        title: 'Doc. Classe',
        width: 120,
        field: 'docClasse',
        readOnly: true,
        frozen: PlutoColumnFrozen.start,
        type: PlutoColumnType.text(),
      ),
    ];

    List<DateTime> days = getDaysInMonth(dto.anoMes.year, dto.anoMes.month);
    List<PlutoColumnGroup> groups = [];
    PlutoColumnGroup group = PlutoColumnGroup(
      title: 'Turno / Funcionário',
      fields: [
        'usuario',
        'turno',
        'docClasse',
      ],
    );
    groups.add(group);
    for (DateTime day in days) {
      PlutoColumnGroup group = PlutoColumnGroup(
        title: getDayNameByDate(day),
        backgroundColor: isWekendDay(day) ? Colors.yellow.shade200 : null,
        fields: [
          day.day.toString(),
        ],
      );
      groups.add(group);
      DateFormat format = DateFormat('dd');
      PlutoColumn clm = PlutoColumn(
        enableColumnDrag: false,
        backgroundColor: isWekendDay(day) ? Colors.yellow.shade200 : null,
        width: 115,
        enableEditingMode: false,
        title: format.format(day),
        field: day.day.toString(),
        renderer: (renderer) => getCustomRenderer(renderer, context),
        type: PlutoColumnType.text(),
      );
      columns.add(clm);
    }
    emit(
      EscalaPageGridState(
        groups: groups,
        columns: columns,
        stateManager: state.stateManager,
        rows: montaLinhas(
          context: context,
          dto: dto,
          columns: columns,
        ),
      ),
    );
  }

  String getDayNameByDate(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Segunda';
      case 2:
        return 'Terça';
      case 3:
        return 'Quarta';
      case 4:
        return 'Quinta';
      case 5:
        return 'Sexta';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
    }
    return '';
  }

  bool isWekendDay(DateTime data) {
    return data.weekday == 6 || data.weekday == 7;
  }

  List<Future> getFutures({
    required BuildContext context,
  }) {
    List<Future> futures = [];
    futures.add(
      BlocProvider.of<SiglaShortResponseCubit>(context).load(
        SiglaShortDTO(
          numeroRegistros: 99999999,
        ),
      ),
    );
    futures.add(
      BlocProvider.of<TurnoShortResponseCubit>(context).load(
        TurnoShortDTO(
          numeroRegistros: 99999999,
        ),
      ),
    );
    futures.add(
      BlocProvider.of<UsuarioDropDownSearchCubit>(context).loadDropDownSearch(
        UsuarioDropDownSearchDTO(
          numeroRegistros: 99999999,
        ),
      ),
    );
    return futures;
  }

  pluto.PdfColor? getColorByColumn(
    PlutoColumn column,
    PlutoGridStateManager state,
    DateTime dataBase,
  ) {
    int? field = int.tryParse(column.field);
    if (field == null) return null;
    DateTime dataAtual = DateTime(dataBase.year, dataBase.month, field);
    if (dataAtual.weekday == 6 || dataAtual.weekday == 7) {
      return flutterToHex(
        Colors.yellow.shade200,
      );
    }
    return null;
  }

  pluto.PdfColor? getPdfColorFromData({
    required dynamic data,
    required BuildContext context,
  }) {
    pluto.PdfColor? cor;
    if (!(data is PlutoCell)) return null;
    SiglaShortResponseDTO? sigla;
    if (data.value is SiglaShortResponseDTO) {
      sigla = data.value;
    }

    int? parseou = int.tryParse(data.column.field);
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala != null && parseou != null) {
      DateTime data =
          DateTime(escala.anoMes.year, escala.anoMes.month, parseou);
      if (data.weekday == 6 || data.weekday == 7) {
        cor = flutterToHex(
          Colors.yellow.shade200,
        );
      }
    }

    if (sigla?.r != null &&
        sigla?.g != null &&
        sigla?.b != null &&
        sigla?.o != null) {
      cor = flutterToHex(
        Color.fromRGBO(
          sigla!.r!,
          sigla.g!,
          sigla.b!,
          sigla.o!,
        ),
      );
    }
    return cor;
  }

  pluto.PdfColor flutterToHex(Color color) {
    double red = color.red / 255;
    double green = color.green / 255;
    double blue = color.blue / 255;
    double alpha = color.alpha / 255;

    return pluto.PdfColor(red, green, blue, alpha);
  }

  Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext,
    BuildContext context,
  ) {
    Color? cor;
    SiglaShortResponseDTO? sigla;
    if (renderContext.cell.value is SiglaShortResponseDTO) {
      sigla = renderContext.cell.value;
    }

    int? parseou = int.tryParse(renderContext.cell.column.field);
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala != null && parseou != null) {
      DateTime data =
          DateTime(escala.anoMes.year, escala.anoMes.month, parseou);
      if (data.weekday == 6 || data.weekday == 7) {
        cor = Colors.yellow.shade200;
      }
    }
    if (renderContext.row.cells['usuario']!.value == null ||
        renderContext.row.cells['usuario']!.value == '') {
      return Container(
        color: cor,
      );
    }

    if (sigla?.r != null &&
        sigla?.g != null &&
        sigla?.b != null &&
        sigla?.o != null) {
      cor = Color.fromRGBO(sigla!.r!, sigla.g!, sigla.b!, sigla.o!);
    }

    List<SiglaShortResponseDTO> siglas =
        BlocProvider.of<SiglaShortResponseCubit>(context).state.siglas;
    List<SiglaShortResponseDTO> siglasFormatas = siglas.map((e) => e).toList();
    siglasFormatas.insert(
      0,
      SiglaShortResponseDTO(cod: 0, descricao: 'Limpar', sigla: 'Vazio'),
    );
    return Container(
      color: cor,
      child: SiglaDropDownSearchWidget(
        siglasFormatas: siglasFormatas,
        renderContext: renderContext,
      ),
    );
  }

  List<PlutoRow> montaLinhas({
    required BuildContext context,
    required EscalaSaveDTO dto,
    required List<PlutoColumn> columns,
  }) {
    List<PlutoRow> rows = [];
    if (dto.turnos != null) {
      for (EscalaTurnoSaveDTO turno in dto.turnos!) {
        if (turno.usuarios == null) continue;
        for (EscalaTurnoUsuarioSaveDTO usuario in turno.usuarios!) {
          Map<String, PlutoCell> cells = {
            'turno': PlutoCell(value: turno.turno),
            'usuario': PlutoCell(value: usuario.usuario),
            'docClasse': PlutoCell(value: usuario.usuario?.docClasse ?? ''),
          };
          for (PlutoColumn column in columns) {
            if (column.field == 'usuario' ||
                column.field == 'turno' ||
                column.field == 'docClasse') continue;
            DateTime date = DateTime(
              dto.anoMes.year,
              dto.anoMes.month,
              int.parse(column.field),
            );
            if (usuario.siglas == null) {
              cells.addAll({column.field: PlutoCell(value: null)});
              continue;
            }
            EscalaTurnoUsuarioSiglaSaveDTO? sigla = usuario.siglas!
                .where((element) => element.data == date)
                .firstOrNull;
            if (sigla == null) {
              cells.addAll({column.field: PlutoCell(value: null)});
              continue;
            }
            cells.addAll({column.field: PlutoCell(value: sigla.sigla)});
          }
          rows.add(
            PlutoRow(cells: cells),
          );
        }
      }
    }
    return rows;
  }

  PlutoRow criarLinha({
    required List<PlutoColumn> columns,
  }) {
    Map<String, PlutoCell> cells = {};
    for (PlutoColumn column in columns) {
      dynamic value;
      if (column.field == 'usuario' || column.field == 'docClasse') value = '';
      cells.addAll({column.field: PlutoCell(value: value)});
    }
    return PlutoRow(
      cells: cells,
    );
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

  List<EscalaTurnoSaveDTO> getTurnosEscala({
    required BuildContext context,
    required EscalaSaveDTO escala,
  }) {
    Map<int, EscalaTurnoSaveDTO> turnos = {};
    for (PlutoRow row in state.stateManager!.iterateRowAndGroup) {
      TurnoShortResponseDTO? turno;
      if (row.cells['turno']?.value is TurnoShortResponseDTO) {
        turno = row.cells['turno']?.value;
      }
      if (turno == null) {
        turno = row.parent?.cells['turno']?.value;
      }
      if (turno == null) continue;
      if (!turnos.containsKey(turno.cod)) {
        turnos.addAll({
          turno.cod: EscalaTurnoSaveDTO(
            anoMes: escala.anoMes,
            codTurno: turno.cod,
            usuarios: [],
          ),
        });
      }
      _adicionarUsuarioTurno(
        turno: turnos[turno.cod]!,
        row: row,
        stateManager: state.stateManager!,
      );
    }
    return turnos.values.toList();
  }

  void _adicionarUsuarioTurno({
    required EscalaTurnoSaveDTO turno,
    required PlutoRow row,
    required PlutoGridStateManager stateManager,
  }) {
    if (!(row.cells['usuario']?.value is UsuarioDropDownSearchResponseDTO)) {
      return;
    }
    UsuarioDropDownSearchResponseDTO? usuario = row.cells['usuario']?.value;
    if (usuario == null) return;

    List<EscalaTurnoUsuarioSiglaSaveDTO> siglas = [];

    for (PlutoColumn column in stateManager.columns) {
      if (!(row.cells[column.field]?.value is SiglaShortResponseDTO)) continue;
      SiglaShortResponseDTO? sigla = row.cells[column.field]?.value;
      if (sigla == null) continue;
      DateTime data = DateTime(
        turno.anoMes.year,
        turno.anoMes.month,
        int.parse(column.field),
      );
      siglas.add(
        EscalaTurnoUsuarioSiglaSaveDTO(
          anoMes: turno.anoMes,
          codSigla: sigla.cod,
          codTurno: turno.codTurno,
          codUsuario: usuario.cod,
          data: data,
        ),
      );
    }

    turno.usuarios?.add(
      EscalaTurnoUsuarioSaveDTO(
        anoMes: turno.anoMes,
        codTurno: turno.codTurno,
        codUsuario: usuario.cod,
        siglas: siglas,
      ),
    );
  }
}
