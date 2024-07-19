import 'package:ageiscme_admin/app/module/pages/arsenal/arsenal_estoque/arsenal_estoque_page_frm/arsenal_estoque_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/arsenal_estoque/arsenal_estoque_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/arsenal_estoque/arsenal_estoque_printer/arsenal_page_frm_impressao.dart';
import 'package:ageiscme_data/services/arsenal/arsenal_estoque_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ArsenalEstoquePage extends StatefulWidget {
  const ArsenalEstoquePage({super.key});

  @override
  State<ArsenalEstoquePage> createState() => _ArsenalEstoquePageState();
}

class _ArsenalEstoquePageState extends State<ArsenalEstoquePage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Código Barra',
      field: 'codBarra',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'CodLocal',
      field: 'codLocal',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Local',
      field: 'local',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final ArsenalEstoquePageCubit bloc =
      ArsenalEstoquePageCubit(service: ArsenalEstoqueService());

  @override
  void initState() {
    bloc.loadArsenalEstoque();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: () => bloc.loadArsenalEstoque(),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  ArsenalEstoqueModel.empty(),
                ),
              },
            ),
            const Spacer(),
            CustomPopupMenuWidget(
              items: [
                CustomPopupItemModel(
                  text: 'Imprimir Arsenais',
                  onTap: imprimirArsenais,
                ),
              ],
            ),
          ],
        ),
        BlocListener<ArsenalEstoquePageCubit, ArsenalEstoquePageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ArsenalEstoquePageCubit, ArsenalEstoquePageState>(
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
                    onEdit: (ArsenalEstoqueModel objeto) {
                      openModal(
                        context,
                        ArsenalEstoqueModel.copy(objeto),
                      );
                    },
                    onDelete: (ArsenalEstoqueModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.arsenaisEstoques,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future openModal(
    BuildContext context,
    ArsenalEstoqueModel arsenalEstoque,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Arsenal',
      widget: ArsenalEstoquePageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        arsenalEstoque: arsenalEstoque,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucessBig(context, message);
    bloc.loadArsenalEstoque();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ArsenalEstoqueModel arsenalEstoque) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Arsenal de Estoque\n${arsenalEstoque.cod} - ${arsenalEstoque.nome}',
      onConfirm: () => onConfirmDelete(arsenalEstoque),
    );
  }

  void onConfirmDelete(ArsenalEstoqueModel arsenalEstoque) {
    bloc.delete(arsenalEstoque);
  }

  void deleted(ArsenalEstoquePageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadArsenalEstoque();
  }

  void onError(ArsenalEstoquePageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  Future imprimirArsenais() async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<ArsenalEstoquePageCubit, ArsenalEstoquePageState>(
          bloc: bloc,
          builder: (context, state) {
            return ArsenalPageFrmImpressao(
              arsenais: state.arsenaisEstoques
                  .where((element) => element.ativo == true)
                  .toList(),
            );
          },
        );
      },
    );
  }
}
