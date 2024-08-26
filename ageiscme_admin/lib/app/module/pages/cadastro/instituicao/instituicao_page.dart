import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page_frm/instituicao_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page_state.dart';
import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class InstituicaoPage extends StatefulWidget {
  const InstituicaoPage({super.key});

  @override
  State<InstituicaoPage> createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 80,
    ),
    CustomDataColumn(
      text: 'Nome',
      field: 'nome',
    ),
    CustomDataColumn(
      text: 'CNPJ',
      field: 'cnpj',
    ),
    CustomDataColumn(
      text: 'Fone Cme',
      field: 'foneCme',
    ),
    CustomDataColumn(
      text: 'Fone Responsável',
      field: 'foneResponsavel',
    ),
    CustomDataColumn(
      text: 'Responsavel',
      field: 'responsavel',
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final InstituicaoPageCubit bloc =
      InstituicaoPageCubit(service: InstituicaoService());

  @override
  void initState() {
    bloc.loadInstituicao();
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
              onPressed: bloc.loadInstituicao,
            ),
          ],
        ),
        BlocListener<InstituicaoPageCubit, InstituicaoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<InstituicaoPageCubit, InstituicaoPageState>(
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
                    filterOnlyActives: true,
                    onEdit: (InstituicaoModel objeto) => {
                      openModal(context, InstituicaoModel.copy(objeto)),
                    },
                    columns: colunas,
                    items: state.instituicoes,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future openModal(BuildContext context, InstituicaoModel instituicao) async {
    late int chave;
    int cod = instituicao.cod??0;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: cod.toString(),
      theme: Theme.of(context),
      title: 'Cadastro/Edição Instituição',
      widget: InstituicaoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        instituicao: instituicao,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadInstituicao();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void onError(InstituicaoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
