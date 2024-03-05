import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page_frm/epi_entrega_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page_state.dart';
import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EpiEntregaPage extends StatefulWidget {
  EpiEntregaPage({super.key});

  @override
  State<EpiEntregaPage> createState() => _EpiEntregaPageState();
}

class _EpiEntregaPageState extends State<EpiEntregaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Colaborador',
      field: 'colaborador',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final EpiEntregaUsuarioPageCubit bloc =
      EpiEntregaUsuarioPageCubit(service: UsuarioService());

  final EpiDescritorPageCubit blocEpi =
      EpiDescritorPageCubit(service: EpiDescritorService());

  @override
  void initState() {
    bloc.loadUsuariosEpiEntrega();
    blocEpi.loadEpiDescritor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AddButtonWidget(
        //   onPressed: () => {
        //     openModal(
        //       context,
        //       EpiEntregaModel.empty(),
        //       UsuarioModel.empty(),
        //       [],
        //       [],
        //     ),
        //   },
        // ),
        BlocListener<EpiEntregaUsuarioPageCubit, EpiEntregaUsuarioPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<EpiDescritorPageCubit, EpiDescritorPageState>(
            bloc: blocEpi,
            builder: (context, stateEpi) => BlocBuilder<
                EpiEntregaUsuarioPageCubit, EpiEntregaUsuarioPageState>(
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
                      onEdit: (UsuarioModel objeto) => {
                        openModal(
                          context,
                          UsuarioModel.copy(objeto),
                          state.usuarios,
                          stateEpi.episDescritor,
                        ),
                      },
                      columns: colunas,
                      items: state.usuarios,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void openModal(
    BuildContext context,
    UsuarioModel? usuario,
    List<UsuarioModel>? usuarios,
    List<EpiDescritorModel>? episDescritores,
  ) {
    EpiEntregaModel epiEntrega = EpiEntregaModel(
      cod: 0,
      codDescritorEpi: 0,
      codInstituicao: 0,
      codUsuario: usuario!.cod,
      codUsuarioEntrega: 0,
      conferenciaVisual: false,
      controlarValidade: false,
      dataDescarte: null,
      dataEntrega: null,
      dataLimiteValidade: null,
      ultimaAlteracao: null,
      epiDescritor: null,
      tstamp: '',
    );
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EpiEntregaPageFrm(
          epiEntrega: epiEntrega,
          usuarios: usuarios!,
          episDescritores: episDescritores!,
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
    });
  }

  void onError(EpiEntregaUsuarioPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
