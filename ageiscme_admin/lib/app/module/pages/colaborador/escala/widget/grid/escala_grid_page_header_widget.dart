import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/sigla/sigla_short_response_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/turno/turno_short_response_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/widget/grid/escala_grid_page_adicionar_turno_widget.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/widget/grid/escala_grid_page_selecionar_sigla_widget.dart';
import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/short/sigla_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/easy_debounce_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class EscalaGridPageHeaderWidget extends StatefulWidget {
  const EscalaGridPageHeaderWidget({
    required this.stateManager,
    required this.adicionarLinhaTurno,
    Key? key,
  }) : super(key: key);

  final PlutoGridStateManager stateManager;
  final PlutoRow Function() adicionarLinhaTurno;

  @override
  State<EscalaGridPageHeaderWidget> createState() =>
      EscalaGridPageHeaderWidgetState();
}

class EscalaGridPageHeaderWidgetState
    extends State<EscalaGridPageHeaderWidget> {
  PlutoGridSelectingMode gridSelectingMode = PlutoGridSelectingMode.row;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.stateManager.setSelectingMode(gridSelectingMode);
    });
  }

  Future handleAddRows() async {
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Carregue a escala para adicionar turno',
      );
      return;
    }
    TurnoShortResponseCubit cubit =
        BlocProvider.of<TurnoShortResponseCubit>(context);
    TurnoShortResponseDTO? turno = await showDialog<TurnoShortResponseDTO>(
      context: context,
      builder: (context) => MultiBlocProvider(
        providers: [BlocProvider.value(value: cubit)],
        child: const EscalaGridPageAdicionarTurnoWidget(),
      ),
    );
    if (turno == null) return;
    PlutoRow? row = widget.adicionarLinhaTurno();
    for (PlutoRow row in widget.stateManager.rows) {
      TurnoShortResponseDTO? turnoRow = row.cells['turno']!.value;
      if (turnoRow?.descricao != turno.descricao) continue;
      ToastUtils.showCustomToastNotice(context, 'Turno já existe na escala');
      return;
    }

    row.cells['turno']!.value = turno;
    widget.stateManager.appendRows(
      [row],
    );
    widget.stateManager.notifyListeners();
    widget.stateManager.setRowGroup(
      PlutoRowGroupByColumnDelegate(
        enableCompactCount: true,
        columns: [widget.stateManager.columns[0]],
        showFirstExpandableIcon: false,
      ),
    );
  }

  Future handleSetAll() async {
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Carregue a escala setar vazios',
      );
      return;
    }
    SiglaShortResponseCubit cubit =
        BlocProvider.of<SiglaShortResponseCubit>(context);
    SiglaShortResponseDTO? sigla = await showDialog<SiglaShortResponseDTO>(
      context: context,
      builder: (context) => MultiBlocProvider(
        providers: [BlocProvider.value(value: cubit)],
        child: const EscalaGridPageSelecionarSiglaWidget(),
      ),
    );
    if (sigla == null) return;
    for (PlutoRow row in widget.stateManager.rows) {
      for (PlutoColumn column in widget.stateManager.columns) {
        int? parseou = int.tryParse(column.field);
        if (parseou == null) continue;
        if (row.cells[column.field]?.value != null &&
            row.cells[column.field]?.value != '') continue;
        row.cells[column.field]!.value = sigla;
      }
    }

    widget.stateManager.notifyListeners();
  }

  Future handleClear() async {
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Carregue a escala setar limpas',
      );
      return;
    }
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Todas as siglas serão limpas para preencher novamente, confirma a limpeza?',
      onConfirm: clearSiglas,
    );
  }

  void clearSiglas() {
    for (PlutoRow row in widget.stateManager.rows) {
      for (PlutoColumn column in widget.stateManager.columns) {
        int? parseou = int.tryParse(column.field);
        if (parseou == null) continue;
        row.cells[column.field]!.value = null;
      }
    }

    widget.stateManager.notifyListeners();
  }

  void handleAddUser() {
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Carregue a escala para adicionar usuários',
      );
      return;
    }
    PlutoRow? parentRow = widget.stateManager.currentCell?.row;
    if (parentRow == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Selecione uma linha para adicionar um usuário',
      );
      return;
    }

    PlutoRow? row = widget.adicionarLinhaTurno();
    row.cells['turno']!.value = parentRow.cells['turno']!.value;
    widget.stateManager.appendRows(
      [row],
    );
    widget.stateManager.notifyListeners();
  }

  void handleRemoveSelectedRowsButton() {
    EasyThrottle.throttle('on-change', const Duration(seconds: 1), () {
      EscalaSaveDTO? escala =
          BlocProvider.of<EscalaPageCubit>(context).state.escala;
      if (escala == null) {
        ToastUtils.showCustomToastNotice(
          context,
          'Carregue a escala para remover linhas',
        );
        return;
      }
      PlutoRow? row = widget.stateManager.currentCell?.row;
      if (row == null) return;
      widget.stateManager.removeRows([row]);
    });
  }

  void handleExpandAll() {
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Carregue a escala para expandir linhas',
      );
      return;
    }
    for (PlutoRow row in widget.stateManager.rows) {
      bool expanded = widget.stateManager.isExpandedGroupedRow(row);
      if (!expanded) {
        widget.stateManager.toggleExpandedRowGroup(rowGroup: row);
      }
    }
  }

  void handleCollapseAll() {
    EscalaSaveDTO? escala =
        BlocProvider.of<EscalaPageCubit>(context).state.escala;
    if (escala == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Carregue a escala para colapsar linhas',
      );
      return;
    }
    for (PlutoRow row in widget.stateManager.rows) {
      bool expanded = widget.stateManager.isExpandedGroupedRow(row);
      if (expanded) {
        widget.stateManager.toggleExpandedRowGroup(rowGroup: row);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: handleAddRows,
              child: const Text('Adicionar Turno'),
            ),
            ElevatedButton(
              onPressed: handleAddUser,
              child: const Text('Adicionar Usuário'),
            ),
            ElevatedButton(
              onPressed: handleRemoveSelectedRowsButton,
              child: const Text('Remover Linha Selecionada'),
            ),
            ElevatedButton(
              onPressed: handleExpandAll,
              child: const Text('Expandir Todas As Linhas'),
            ),
            ElevatedButton(
              onPressed: handleCollapseAll,
              child: const Text('Colapsar Todas As Linhas'),
            ),
            ElevatedButton(
              onPressed: handleSetAll,
              child: const Text('Preencher Siglas Vazias'),
            ),
            ElevatedButton(
              onPressed: handleClear,
              child: const Text('Limpar Siglas'),
            ),
          ],
        ),
      ),
    );
  }
}
