import 'package:ageiscme_admin/app/module/pages/material/grupo_material/grupo_material_page_frm/grupo_material_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/grupo_material/grupo_material_page_state.dart';
import 'package:ageiscme_data/services/grupo_material/grupo_material_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class GrupoMaterialPage extends StatefulWidget {
  const GrupoMaterialPage({super.key});

  @override
  State<GrupoMaterialPage> createState() => _GrupoMaterialPageState();
}

class _GrupoMaterialPageState extends State<GrupoMaterialPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final GrupoMaterialPageCubit bloc =
      GrupoMaterialPageCubit(service: GrupoMaterialService());

  @override
  void initState() {
    bloc.loadGrupoMaterial();
    super.initState();
  }

  Future openModal(
    BuildContext context,
    GrupoMaterialModel grupoMaterial,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Grupo Material',
      widget: GrupoMaterialPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        grupoMaterial: grupoMaterial,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadGrupoMaterial();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
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
              onPressed: () => bloc.loadGrupoMaterial(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  GrupoMaterialModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<GrupoMaterialPageCubit, GrupoMaterialPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<GrupoMaterialPageCubit, GrupoMaterialPageState>(
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
                    onEdit: (GrupoMaterialModel objeto) =>
                        {openModal(context, GrupoMaterialModel.copy(objeto))},
                    onDelete: (GrupoMaterialModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.gruposMaterial,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void delete(BuildContext context, GrupoMaterialModel grupoMaterial) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Grupo de Item\n${grupoMaterial.cod} = ${grupoMaterial.nome}',
      onConfirm: () => confirmDelete(grupoMaterial),
    );
  }

  void confirmDelete(GrupoMaterialModel grupoMaterial) async {
    bloc.delete(grupoMaterial);
  }

  void deleted(GrupoMaterialPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadGrupoMaterial();
  }

  void onError(GrupoMaterialPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
