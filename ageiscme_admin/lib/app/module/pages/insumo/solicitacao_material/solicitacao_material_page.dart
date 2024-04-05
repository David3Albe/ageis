import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_confirmacao_sem_usuario/solicitacao_material_confirmacao_sem_usuario_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_item_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page_frm/solicitacao_material_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_usuario/solicitacao_material_usuario_page.dart';
import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/add/solicitacao_material_add_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/sucess_dialog.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class SolicitacaoMaterialPage extends StatefulWidget {
  SolicitacaoMaterialPage({super.key});

  @override
  State<SolicitacaoMaterialPage> createState() =>
      _SolicitacaoMaterialPageState();
}

class _SolicitacaoMaterialPageState extends State<SolicitacaoMaterialPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'Equipamento', field: 'nomeEquipamento'),
    CustomDataColumn(text: 'Insumo', field: 'nomeInsumo'),
    CustomDataColumn(
      text: 'Quantidade',
      field: 'quantidadeSolicitada',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Unidade de Medida', field: 'unidadeMedida'),
  ];

  final SolicitacaoMaterialItemPageCubit bloc =
      SolicitacaoMaterialItemPageCubit(
    service: SolicitacaoMaterialService(),
    itemsList: [],
  );

  final SolicitacaoMaterialPageCubit cubit = SolicitacaoMaterialPageCubit(
    service: SolicitacaoMaterialService(),
    solicitacaoMaterialModel: SolicitacaoMaterialModel.empty(),
  );

  late final EquipamentoCubit equipamentoCubit;
  late final InsumoCubit insumoCubit;
  int? codUsuario;

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  @override
  void initState() {
    equipamentoCubit = EquipamentoCubit();
    insumoCubit = InsumoCubit();

    recuperaUsuario().then((value) {
      if (value == null ||
          value.usuario == null ||
          value.usuario!.cod == null) {
        return;
      }
      codUsuario = value.usuario!.cod;
    });

    bloc.loadItems(bloc.state.itemsList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<SolicitacaoMaterialPageCubit, SolicitacaoMaterialPageState>(
          bloc: cubit,
          builder: (context, state) {
            return Row(
              children: [
                CleanButtonWidget(
                  onPressed: () {
                    cubit.clear();
                    bloc.clearItems();
                  },
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 5),
                ),
                AddButtonWidget(
                  readonly: state.solicitacaoMaterial.cod != null &&
                      state.solicitacaoMaterial.cod != 0,
                  onPressed: () => {
                    openModal(
                      context,
                      SolicitacaoMaterialItemModel.empty(),
                    ),
                  },
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 5),
                ),
                SaveButtonWidget(
                  readonly: state.solicitacaoMaterial.cod != null &&
                      state.solicitacaoMaterial.cod != 0,
                  onPressed: () => salvar(),
                ),
                if (state.solicitacaoMaterial.cod != null &&
                    state.solicitacaoMaterial.cod != 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SelectableText(
                      'Solicitação gerada, Código: ${state.solicitacaoMaterial.cod}',
                    ),
                  ),
              ],
            );
          },
        ),
        BlocListener<SolicitacaoMaterialPageCubit,
            SolicitacaoMaterialPageState>(
          bloc: cubit,
          listener: (context, state) async {
            if (state.saved == true) await salvou(state);
          },
          child: BlocBuilder<SolicitacaoMaterialItemPageCubit,
              SolicitacaoMaterialItemPageState>(
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
                    onEdit: (SolicitacaoMaterialItemModel objeto) => {
                      openModal(
                        context,
                        SolicitacaoMaterialItemModel.copy(objeto),
                      ),
                    },
                    onDelete: (SolicitacaoMaterialItemModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: bloc.state.itemsList,
                  ),
                ),
              );
            },
          ),
        ),
      ],
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

  void openModal(
    BuildContext context,
    SolicitacaoMaterialItemModel solicitacaoMaterialItem,
  ) async {
    loadEquipamentoCubit();
    await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SolicitacaoMaterialPageFrm(
          solicitacaoMaterialItem: solicitacaoMaterialItem,
          itemsList: bloc.state.itemsList,
          updateItemList: (updatedList) {
            setState(() {
              bloc.state.itemsList = updatedList;
              bloc.loadItems(bloc.state.itemsList);
            });
          },
          equipamentoCubit: equipamentoCubit,
        );
      },
    );
  }

  void delete(
    BuildContext context,
    SolicitacaoMaterialItemModel solicitacaoMaterialItem,
  ) async {
    bloc.removeItem(solicitacaoMaterialItem);
  }

  Future<String?> _getUserBarCode() async {
    return await showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const SolicitacaoMaterialUsuarioPage();
      },
    );
  }

  Future<bool?> _continuarSalvamento(String? userBarCode) async {
    if (userBarCode != null) return true;
    return await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const SolicitacaoMaterialConfirmacaoSemUsuarioPage();
      },
    );
  }

  Future salvar() async {
    if (bloc.state.itemsList.isEmpty) {
      await WarningUtils.showWarningDialog(
        context,
        'Não há solicitação de material para ser inserida!',
      );
      return;
    }

    String? userBarCode = await _getUserBarCode();
    bool? salvar = await _continuarSalvamento(userBarCode);
    if (salvar != true) return;

    SolicitacaoMaterialAddDTO solicitacaoMaterialAddDTO =
        SolicitacaoMaterialAddDTO(
      codUsuarioSolicitante: codUsuario!,
      codBarraUsuarioAutorizacao: userBarCode,
      solicitacoesMateriais: bloc.state.itemsList,
      situacao: 1,
    );
    LoadingController loading = LoadingController(context: context);
    await cubit.add(solicitacaoMaterialAddDTO);
    loading.closeDefault();
  }

  Future salvou(SolicitacaoMaterialPageState state) async {
    if (state.saved != true) return;
    await SucessUtils.showSucessDialog(
      context,
      'Solicitação gerada com sucesso\nCódigo: ${state.solicitacaoMaterial.cod}',
    );
  }
}
