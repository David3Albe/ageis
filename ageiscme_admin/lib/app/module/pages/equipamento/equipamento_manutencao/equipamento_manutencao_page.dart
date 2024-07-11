import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/cubits/equipamento_manutencao_filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/equipamento_manutencao_page_frm/equipamento_manutencao_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/equipamento_manutencao_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/filter/equipamento_manutencao_filter_button_widget.dart';
import 'package:ageiscme_data/services/equipamento_manutencao/equipamento_manutencao_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/equipamento_manutencao/equipamento_manutencao_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EquipamentoManutencaoPage extends StatefulWidget {
  const EquipamentoManutencaoPage({this.cod, super.key});
  final int? cod;

  @override
  State<EquipamentoManutencaoPage> createState() =>
      _EquipamentoManutencaoPageState();
}

class _EquipamentoManutencaoPageState extends State<EquipamentoManutencaoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 80,
    ),
    CustomDataColumn(
      text: 'Equipamento',
      field: 'equipamento',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(
      text: 'Tipo Serviço',
      field: 'servicoTipo',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(
      text: 'Data Início',
      field: 'dataInicio',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Data Término',
      field: 'dataTermino',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Usuário Registro',
      field: 'usuario',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(
      text: 'Resultado',
      field: 'resultado',
      valueConverter: (dynamic value) =>
          EquipamentoManutencaoResultOption.getOpcaoFromId(value),
    ),
  ];

  late final EquipamentoManutencaoPageCubit bloc;
  late final EquipamentoManutencaoService service;
  late final EquipamentoCubit equipamentoCubit;
  late EquipamentoManutencaoFilter filter;

  @override
  void initState() {
    service = EquipamentoManutencaoService();
    equipamentoCubit = EquipamentoCubit();
    bloc = EquipamentoManutencaoPageCubit(service: service);
    filter = EquipamentoManutencaoFilter(
      numeroRegistros: 500,
      cod: widget.cod,
      ordenarDataInicioDecrescente: true,
    );
    consultar().then((value) {
      bool detalhar = filter.cod != null;
      filter.cod = null;
      if (!detalhar) return;
      if (bloc.state.equipamentosManutencoes.isEmpty) return;
      openModal(context, bloc.state.equipamentosManutencoes.first);
    });
    super.initState();
  }

  Future consultar() async {
    await bloc.getScreenData(filter);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EquipamentoManutencaoFilterCubit(filter),
        ),
        BlocProvider.value(value: bloc),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const EquipamentoManutencaoFilterButtonWidget(),
              const Padding(
                padding: EdgeInsets.only(left: 4),
              ),
              AddButtonWidget(
                onPressed: () => {
                  openModal(
                    context,
                    EquipamentoManutencaoModel.empty(),
                  ),
                },
              ),
            ],
          ),
          BlocConsumer<EquipamentoManutencaoPageCubit,
              EquipamentoManutencaoPageState>(
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
                    orderDescendingFieldColumn: 'dataInicio',
                    onEdit: (EquipamentoManutencaoModel objeto) => {
                      openModal(
                        context,
                        EquipamentoManutencaoModel.copy(objeto),
                      ),
                    },
                    onDelete: (EquipamentoManutencaoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.equipamentosManutencoes,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void loadEquipamentoCubit() {
    if (!equipamentoCubit.state.loaded) {
      equipamentoCubit.loadFilter(
        EquipamentoFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future<EquipamentoManutencaoModel?> getFilter(
    EquipamentoManutencaoModel equipamentoManutencao,
  ) async {
    return service.FilterOne(
      EquipamentoManutencaoFilter(
        cod: equipamentoManutencao.cod,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    EquipamentoManutencaoModel equipamentoManutencao,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadEquipamentoCubit();

    EquipamentoManutencaoModel? equipamentoMan = equipamentoManutencao;
    if (equipamentoManutencao.cod != 0) {
      equipamentoMan = await getFilter(
        equipamentoManutencao,
      );
      if (equipamentoMan == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
      List<int> codigos = [];
      int? usuarioDetectadoPor =
          int.tryParse(equipamentoMan.detectadoPor ?? '');
      if (usuarioDetectadoPor != null) {
        codigos.add(usuarioDetectadoPor);
      }
      int? usuarioTecnico = int.tryParse(equipamentoMan.tecnico ?? '');
      if (usuarioTecnico != null) {
        codigos.add(usuarioTecnico);
      }
      List<UsuarioDropDownSearchResponseDTO> usuarios =
          (await UsuarioService().getDropDownSearch(
                UsuarioDropDownSearchDTO(numeroRegistros: 30, codigos: codigos),
              ))
                  ?.$2 ??
              [];
      equipamentoMan.usuarioDetectadoPor = usuarios
          .where(
            (element) => element.cod.toString() == equipamentoMan?.detectadoPor,
          )
          .firstOrNull;

      equipamentoMan.usuarioTecnico = usuarios
          .where(
            (element) => element.cod.toString() == equipamentoMan?.tecnico,
          )
          .firstOrNull;
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Manutenção',
      widget: EquipamentoManutencaoPageFrm(
        equipamentoCubit: equipamentoCubit,
        equipamentoManutencao: equipamentoMan,
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
      ),
    );
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    await consultar();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    EquipamentoManutencaoModel equipamentoManutencao,
  ) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da Manutenção\n${equipamentoManutencao.cod} - ${equipamentoManutencao.equipamento!.nome}',
      onConfirm: () => onConfirmDelete(equipamentoManutencao),
    );
  }

  void onConfirmDelete(
    EquipamentoManutencaoModel equipamentoManutencao,
  ) {
    bloc.delete(equipamentoManutencao);
  }

  Future deleted(EquipamentoManutencaoPageState state) async {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    await consultar();
  }

  void onError(EquipamentoManutencaoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Manutenção do Equipamento que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
