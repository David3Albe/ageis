import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional/atestado-saude_ocupacional_page_frm/atestado_saude_ocupacional_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional/atestado_saude_ocupacional_page_state.dart';
import 'package:ageiscme_data/services/atestado_saude_ocupacional/atestado_saude_ocupacional_service.dart';
import 'package:ageiscme_models/filters/atestado_saude_ocupacional/atestado_saude_ocupacional_filter.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalPage extends StatefulWidget {
  AtestadoSaudeOcupacionalPage({this.cod, super.key});
  final int? cod;

  @override
  State<AtestadoSaudeOcupacionalPage> createState() =>
      _AtestadoSaudeOcupacionalPageState();
}

class _AtestadoSaudeOcupacionalPageState
    extends State<AtestadoSaudeOcupacionalPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Colaborador',
      field: 'usuario',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(
      text: 'Tipo ASO',
      field: 'tipo',
      valueConverter: (dynamic value) =>
          AtestadoSaudeOcupacionalTipoAsoOption.getTipoAsoOpcaoFromId(value),
    ),
    CustomDataColumn(text: 'Médico', field: 'nomeMedico'),
    CustomDataColumn(
      text: 'CRM do Médico',
      field: 'crmMedico',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Emissão',
      field: 'data',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Validade',
      field: 'validade',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Conclusão',
      field: 'conclusao',
      valueConverter: (dynamic value) =>
          AtestadoSaudeOcupacionalConclusaoOption.getConclusaoOpcaoFromId(
        value,
      ),
    ),
    CustomDataColumn(
      text: 'Controlar Validade',
      field: 'controlarValidade',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final AtestadoSaudeOcupacionalPageCubit bloc;
  late final AtestadoSaudeOcupacionalService service;
  late final UsuarioCubit usuarioCubit;

  @override
  void initState() {
    service = AtestadoSaudeOcupacionalService();
    usuarioCubit = UsuarioCubit();
    bloc = AtestadoSaudeOcupacionalPageCubit(
      service: service,
    );
    bloc.loadAtestadoSaudeOcupacional().then((value) {
      if (widget.cod == null) return;
      AtestadoSaudeOcupacionalModel? obj = bloc.state.atestadosSaudeOcupacionais
          .where((element) => element.cod == widget.cod)
          .firstOrNull;
      if (obj == null) return;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => openModal(
          context,
          obj,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddButtonWidget(
          onPressed: () async => {
            await openModal(
              context,
              AtestadoSaudeOcupacionalModel.empty(),
            ),
          },
        ),
        BlocListener<AtestadoSaudeOcupacionalPageCubit,
            AtestadoSaudeOcupacionalPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<AtestadoSaudeOcupacionalPageCubit,
              AtestadoSaudeOcupacionalPageState>(
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
                    onEdit: (AtestadoSaudeOcupacionalModel objeto) => {
                      openModal(
                        context,
                        AtestadoSaudeOcupacionalModel.copy(objeto),
                      ),
                    },
                    onDelete: (AtestadoSaudeOcupacionalModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.atestadosSaudeOcupacionais,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void loadUserCubit() {
    if (!usuarioCubit.state.loaded) {
      usuarioCubit.loadFilter(
        UsuarioFilter(
          apenasAtivos: true,
          tipoQuery: UsuarioFilterTipoQuery.SemFoto,
          ordenarPorNomeCrescente: true,
          apenasColaboradores: true,
        ),
      );
    }
  }

  Future<AtestadoSaudeOcupacionalModel?> getFilter(
    AtestadoSaudeOcupacionalModel atestado,
  ) async {
    return service.FilterOne(
      AtestadoSaudeOcupacionalFilter(
        cod: atestado.cod,
        carregarUsuario: true,
        tStamp: atestado.tstamp,
      ),
    );
  }

  Future<void> openModal(
    BuildContext context,
    AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadUserCubit();

    AtestadoSaudeOcupacionalModel? atestado = atestadoSaudeOcupacional;
    if (atestadoSaudeOcupacional.cod != 0) {
      atestado = await getFilter(
        atestadoSaudeOcupacional,
      );
      if (atestado == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    }
    loading.close(context, mounted);

    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AtestadoSaudeOcupacionalPageFrm(
          usuarioCubit: usuarioCubit,
          atestadoSaudeOcupacional: atestado!,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    await bloc.loadAtestadoSaudeOcupacional();
  }

  void delete(
    BuildContext context,
    AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional,
  ) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Atestado de Saúde Ocupacional\n${atestadoSaudeOcupacional.cod} - ${atestadoSaudeOcupacional.nomeMedico}',
    );
    if (confirmacao) bloc.delete(atestadoSaudeOcupacional);
  }

  void deleted(AtestadoSaudeOcupacionalPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadAtestadoSaudeOcupacional();
  }

  void onError(AtestadoSaudeOcupacionalPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de atestado ocupacional que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
