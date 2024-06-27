import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/parametro_sistema_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_state.dart';
import 'package:ageiscme_data/services/parametro_sistema/parametro_sistema_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ParametroSistemaPage extends StatefulWidget {
  const ParametroSistemaPage({super.key});

  @override
  State<ParametroSistemaPage> createState() => _ParametroSistemaPageState();
}

class _ParametroSistemaPageState extends State<ParametroSistemaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Versão Atual da Aplicação', field: 'versaoSW'),
    CustomDataColumn(
      text: 'Data da Versão Atual',
      field: 'dataVersaoSW',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Processos por Etiqueta',
      field: 'qtdeMaxProcessosEtiqueta',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Nr.Controle Indicador',
      field: 'indicador',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Letra Consignada', field: 'letraConsignado'),
    CustomDataColumn(
      text: 'Zera Etiqueta',
      field: 'zeraEtiquetaRotulado',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final ParametroSistemaPageCubit bloc =
      ParametroSistemaPageCubit(service: ParametroSistemaService());

  @override
  void initState() {
    bloc.loadParametroSistema();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocListener<ParametroSistemaPageCubit, ParametroSistemaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child:
              BlocBuilder<ParametroSistemaPageCubit, ParametroSistemaPageState>(
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
                    onEdit: (ParametroSistemaModel objeto) => {
                      openModal(context, ParametroSistemaModel.copy(objeto)),
                    },
                    columns: colunas,
                    items: state.parametrosSistema,
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
    ParametroSistemaModel parametroSistema,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      theme: Theme.of(context),
      title: 'Cadastro/Edição Paramêtros',
      widget: ParametroSistemaPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        parametroSistema: parametroSistema,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadParametroSistema();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void onError(ParametroSistemaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
