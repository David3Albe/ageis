import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_item_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page_frm/solicitacao_material_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page_state.dart';
import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
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

    bloc.loadItems(bloc.itemsList);
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
                  SolicitacaoMaterialItemModel.empty(),
                ),
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SaveButtonWidget(
                onPressed: () => salvar(),
              ),
            ),
          ],
        ),
        BlocListener<SolicitacaoMaterialPageCubit,
            SolicitacaoMaterialPageState>(
          bloc: cubit,
          listener: (context, state) {
            if (state.saved) {
              //Navigator.of(context).pop((state.saved, state.message));
            }
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
                    filterOnlyActives: true,
                    onEdit: (SolicitacaoMaterialItemModel objeto) => {
                      openModal(
                        context,
                        SolicitacaoMaterialItemModel.copy(objeto),
                      ),
                    },
                    onDelete: (SolicitacaoMaterialItemModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: bloc.itemsList,
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
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do item da Solicitacao',
    );
    if (confirmacao) return;
  }

  void salvar() {
    if (bloc.state.itemsList.isEmpty) {
      ErrorUtils.showErrorDialog(
        context,
        ['Não há solicitação de material para ser inserida!'],
      );
    }

    SolicitacaoMaterialModel solicitaMaterial = SolicitacaoMaterialModel(
      cod: 0,
      codInstituicao: 2,
      codUsuarioEntrega: null,
      codUsuarioRecebimento: null,
      codUsuarioSolicitante: codUsuario,
      codusuarioAutorizacao: null,
      dataHoraAutorizacao: null,
      dataHoraEntrega: null,
      dataHoraSolicitacao: DateTime.now(),
      situacao: 1,
      ultimaAlteracao: null,
      tstamp: '',
      solicitacoesMateriais: bloc.itemsList,
    );

    cubit.save(solicitaMaterial);
  }
}
