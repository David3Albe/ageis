import 'package:ageiscme_admin/app/module/pages/material/embalagem/emabalagem_printer/embalagem_page_frm_impressao.dart';
import 'package:ageiscme_admin/app/module/pages/material/embalagem/embalagem_page_frm/embalagem_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/embalagem/embalagem_page_state.dart';
import 'package:ageiscme_data/services/embalagem/embalagem_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EmbalagemPage extends StatefulWidget {
  EmbalagemPage({super.key});

  @override
  State<EmbalagemPage> createState() => _EmbalagemPageState();
}

class _EmbalagemPageState extends State<EmbalagemPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Embalagem', field: 'nome'),
    CustomDataColumn(
      text: 'Validade Processos (dias)',
      field: 'validadeProcessosDias',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final EmbalagemPageCubit bloc =
      EmbalagemPageCubit(service: EmbalagemService());

  @override
  void initState() {
    bloc.loadEmbalagem();
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
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  EmbalagemModel.empty(),
                ),
              },
            ),
            const Spacer(),
            CustomPopupMenuWidget(
              items: [
                CustomPopupItemModel(
                  text: 'Imprimir Embalagens',
                  onTap: imprimirEtiquetas,
                ),
              ],
            ),
          ],
        ),
        BlocConsumer<EmbalagemPageCubit, EmbalagemPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
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
                  filterOnlyActives: true,
                  onEdit: (EmbalagemModel objeto) =>
                      {openModal(context, EmbalagemModel.copy(objeto))},
                  onDelete: (EmbalagemModel objeto) =>
                      {delete(context, objeto)},
                  columns: colunas,
                  items: state.embalagens,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Future imprimirEtiquetas() async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<EmbalagemPageCubit, EmbalagemPageState>(
          bloc: bloc,
          builder: (context, state) {
            return EmbalagemPageFrmImpressao(
              embalagens: state.embalagens.where((element) => element.ativo==true).toList(),
            );
          },
        );
      },
    );
  }

  void openModal(BuildContext context, EmbalagemModel embalagem) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: EmbalagemPageFrm(
            embalagem: embalagem,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadEmbalagem();
    });
  }

  void delete(BuildContext context, EmbalagemModel embalagem) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção da Embalagem\n${embalagem.cod} - ${embalagem.nome}',
    );
    if (confirmacao) bloc.delete(embalagem);
  }

  void deleted(EmbalagemPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadEmbalagem();
  }

  void onError(EmbalagemPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
