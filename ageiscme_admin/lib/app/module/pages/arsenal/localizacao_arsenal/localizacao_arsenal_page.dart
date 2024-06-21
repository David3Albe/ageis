import 'package:ageiscme_admin/app/module/pages/arsenal/localizacao_arsenal/localizacao_arsenal_page_frm/localizacao_arsenal_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/localizacao_arsenal/localizacao_arsenal_page_state.dart';
import 'package:ageiscme_data/services/localizacao_arsenal/localizacao_arsenal_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LocalizacaoArsenalPage extends StatefulWidget {
  LocalizacaoArsenalPage({super.key});

  @override
  State<LocalizacaoArsenalPage> createState() => _LocalizacaoArsenalPageState();
}

class _LocalizacaoArsenalPageState extends State<LocalizacaoArsenalPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(
      text: 'Arsenal',
      field: 'arsenal',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(text: 'Localização', field: 'local'),
    CustomDataColumn(
      text: 'Código de Barras',
      field: 'codBarra',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final LocalizacaoArsenalPageCubit bloc =
      LocalizacaoArsenalPageCubit(service: LocalizacaoArsenalService());

  @override
  void initState() {
    bloc.loadLocalizacaoArsenal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddButtonWidget(
          onPressed: () => {
            openModal(
              context,
              LocalizacaoArsenalModel.empty(),
            ),
          },
        ),
        BlocListener<LocalizacaoArsenalPageCubit, LocalizacaoArsenalPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<LocalizacaoArsenalPageCubit,
              LocalizacaoArsenalPageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: PlutoGridWidget(
                    orderDescendingFieldColumn: 'cod',
                    filterOnlyActives: true,
                    onEdit: (LocalizacaoArsenalModel objeto) => {
                      openModal(context, LocalizacaoArsenalModel.copy(objeto)),
                    },
                    onDelete: (LocalizacaoArsenalModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.localizacoesArsenais,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(
    BuildContext context,
    LocalizacaoArsenalModel localizacaoArsenal,
  ) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: LocalizacaoArsenalPageFrm(
            localizacaoArsenal: localizacaoArsenal,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadLocalizacaoArsenal();
    });
  }

  void delete(
    BuildContext context,
    LocalizacaoArsenalModel localizacaoArsenal,
  ) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção da Localização do Arsenal\n${localizacaoArsenal.cod} - ${localizacaoArsenal.local}',
    );
    if (confirmacao) bloc.delete(localizacaoArsenal);
  }

  void deleted(LocalizacaoArsenalPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadLocalizacaoArsenal();
  }

  void onError(LocalizacaoArsenalPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
