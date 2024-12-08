import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento_insumo/insumos_por_equipamento_simplificado_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page_frm/cubits/insumo_selecionado_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page_frm/solicitacao_material_item_page_frm_state.dart';
import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_models/dto/insumos_por_equipamento_simplificado/insumos_por_equipamento_simplificado_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class SolicitacaoMaterialPageFrm extends StatefulWidget {
  const SolicitacaoMaterialPageFrm({
    Key? key,
    required this.solicitacaoMaterialItem,
    required this.itemsList,
    required this.updateItemList,
    required this.equipamentoCubit,
  }) : super(key: key);

  final SolicitacaoMaterialItemModel solicitacaoMaterialItem;
  final List<SolicitacaoMaterialItemModel> itemsList;
  final void Function(List<SolicitacaoMaterialItemModel>) updateItemList;
  final EquipamentoCubit equipamentoCubit;

  @override
  State<SolicitacaoMaterialPageFrm> createState() =>
      _SolicitacaoMaterialPageFrmState(
        solicitacaoMaterialItem: solicitacaoMaterialItem,
        itemsList: itemsList,
      );
}

class _SolicitacaoMaterialPageFrmState
    extends State<SolicitacaoMaterialPageFrm> {
  _SolicitacaoMaterialPageFrmState({
    required this.solicitacaoMaterialItem,
    required this.itemsList,
  });

  late String titulo;
  late SolicitacaoMaterialItemModel solicitacaoMaterialItem;

  final List<SolicitacaoMaterialItemModel> itemsList;
  void Function()? refreshInsumoMethod;
  void Function(InsumoModel? obj)? setSelectedItemMethodBuilder;
  bool Function()? validateInsumoMethod;
  bool Function()? validateEquipamentoMethod;

  late final SolicitacaoMaterialItemPageFrmCubit cubit =
      SolicitacaoMaterialItemPageFrmCubit(
    service: SolicitacaoMaterialService(),
    itemsList: itemsList,
  );

  late final TextFieldStringWidget txtQuantidade = TextFieldStringWidget(
    placeholder: 'Quantidade *',
    onChanged: (String? str) {
      solicitacaoMaterialItem.quantidadeSolicitada =
          double.tryParse(txtQuantidade.text);
    },
  );

  void initState() {
    txtQuantidade.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtQuantidade.text = solicitacaoMaterialItem.quantidadeSolicitada == 0 ||
            solicitacaoMaterialItem.quantidadeSolicitada == null
        ? ''
        : solicitacaoMaterialItem.quantidadeSolicitada.toString();
    titulo = 'Solicitação de Material';
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SolicitacaoMaterialItemPageFrmCubit,
        SolicitacaoMaterialItemPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      builder: (context, state) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8.0),
          titlePadding: const EdgeInsets.all(8.0),
          actionsPadding: const EdgeInsets.all(8.0),
          title: Row(
            children: [
              Expanded(
                child: TitleWidget(
                  text: titulo,
                ),
              ),
              const Spacer(),
              CloseButtonWidget(
                onPressed: () => Navigator.of(context).pop((false, '')),
              ),
            ],
          ),
          content: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => InsumoCubit()..loadAll(),
              ),
              BlocProvider(
                create: (context) => InsumoSelecionadoCubit(),
              ),
              BlocProvider(
                create: (context) => InsumosPorEquipamentoSimplificadoCubit()
                  ..load(
                    filter: InsumosPorEquipamentoSimplificadoDTO(
                      apenasInsumosComSaldo: true,
                    ),
                  ),
              ),
            ],
            child: Builder(
              builder: (context) {
                return Container(
                  constraints: BoxConstraints(
                    minWidth: size.width * .5,
                    minHeight: size.height * .5,
                    maxHeight: size.height * .8,
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(right: 14),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child:
                              BlocBuilder<EquipamentoCubit, EquipamentoState>(
                            bloc: widget.equipamentoCubit,
                            builder: (context, equipamentoState) {
                              if (equipamentoState.loading) {
                                return const LoadingWidget();
                              }
                              List<EquipamentoModel> equipamentos =
                                  equipamentoState.objs;
                              EquipamentoModel? equipamento = equipamentos
                                  .where(
                                    (element) =>
                                        element.cod ==
                                        solicitacaoMaterialItem.codEquipamento,
                                  )
                                  .firstOrNull;
                              return DropDownSearchWidget<EquipamentoModel>(
                                validator: (val) {
                                  if (val == null || val.cod == null) {
                                    return 'Obrigatório';
                                  }
                                  return null;
                                },
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    validateEquipamentoMethod =
                                        validateMethodBuilder,
                                textFunction: (equipamento) =>
                                    equipamento.EquipamentoNomeText(),
                                initialValue: equipamento,
                                sourceList: equipamentos
                                    .where((element) => element.ativo == true)
                                    .toList(),
                                onChanged: (value) {
                                  solicitacaoMaterialItem.codEquipamento =
                                      value?.cod;
                                  solicitacaoMaterialItem.nomeEquipamento =
                                      value?.nome;
                                  context
                                      .read<
                                          InsumosPorEquipamentoSimplificadoCubit>()
                                      .setEquipamento(
                                        codEquipamento: value?.cod,
                                      );
                                },
                                placeholder: 'Equipamento *',
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Builder(
                            builder: (context) {
                              InsumosPorEquipamentoSimplificadoState?
                                  insumoSimplificadoState = context
                                      .watch<
                                          InsumosPorEquipamentoSimplificadoCubit>()
                                      .state;

                              InsumoState insumoState =
                                  context.watch<InsumoCubit>().state;

                              if (insumoState.loading ||
                                  insumoSimplificadoState.loading) {
                                return const LoadingWidget();
                              }
                              List<int> insumosLiberadosPorEquipamento = [];
                              if (insumoSimplificadoState.codEquipamento !=
                                  null) {
                                insumosLiberadosPorEquipamento =
                                    insumoSimplificadoState
                                                .obj?.equipamentoInsumos[
                                            insumoSimplificadoState
                                                .codEquipamento] ??
                                        [];
                              }

                              List<InsumoModel> insumos = insumoState.objs
                                  .where(
                                    (element) =>
                                        insumosLiberadosPorEquipamento.contains(
                                      element.cod,
                                    ),
                                  )
                                  .toList();
                              insumos.sort(
                                (a, b) => a.nome!.compareTo(b.nome!),
                              );
                              InsumoModel? insumo = insumos
                                  .where(
                                    (element) =>
                                        element.cod ==
                                            solicitacaoMaterialItem.codInsumo &&
                                        element.ativo == true,
                                  )
                                  .firstOrNull;

                              DropDownSearchWidget search =
                                  DropDownSearchWidget<InsumoModel>(
                                validator: (val) {
                                  if (val == null || val.cod == null) {
                                    return 'Obrigatório';
                                  }
                                  return null;
                                },
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    validateInsumoMethod =
                                        validateMethodBuilder,
                                refreshSourceListBuilder: (
                                  context,
                                  refreshSourceListMethod,
                                ) =>
                                    refreshInsumoMethod =
                                        refreshSourceListMethod,
                                setSelectedItemBuilder: (
                                  context,
                                  setSelectedItemMethod,
                                ) =>
                                    setSelectedItemMethodBuilder =
                                        setSelectedItemMethod,
                                textFunction: (insumo) =>
                                    insumo.GetNomeInsumoText(),
                                initialValue: insumo,
                                sourceList: insumos,
                                onChanged: (value) {
                                  context
                                      .read<InsumoSelecionadoCubit>()
                                      .set(value);
                                  solicitacaoMaterialItem.codInsumo =
                                      value?.cod;
                                  solicitacaoMaterialItem.nomeInsumo =
                                      value?.nome;
                                  solicitacaoMaterialItem.unidadeMedida =
                                      value?.unidadeMedida;
                                },
                                placeholder: 'Insumo *',
                              );
                              if (refreshInsumoMethod != null) {
                                refreshInsumoMethod!();
                              }
                              if (setSelectedItemMethodBuilder != null) {
                                setSelectedItemMethodBuilder!(insumo);
                              }
                              return search;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: txtQuantidade,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 16),
                                  child: Text(
                                    context.select(
                                      (InsumoSelecionadoCubit cubit) =>
                                          cubit.state.insumo?.unidadeMedida ??
                                          'Unidades',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SaveButtonWidget(
                    onPressed: () => {salvar()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CleanButtonWidget(
                    onPressed: () => {
                      setState(() {
                        solicitacaoMaterialItem =
                            SolicitacaoMaterialItemModel.empty();
                      }),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CancelButtonUnfilledWidget(
                    onPressed: () => {Navigator.of(context).pop((false, ''))},
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void salvar() {
    bool equipamentoValid = true;
    bool insumoValid = true;
    bool quantidadeValid = txtQuantidade.valid;
    if (validateEquipamentoMethod != null) {
      equipamentoValid = validateEquipamentoMethod!();
    }
    if (validateInsumoMethod != null) {
      insumoValid = validateInsumoMethod!();
    }
    if (!quantidadeValid || !insumoValid || !equipamentoValid) return;

    setState(() {
      widget.itemsList.add(solicitacaoMaterialItem);
      solicitacaoMaterialItem = SolicitacaoMaterialItemModel.empty();
    });

    widget.updateItemList(widget.itemsList);
    cubit.addItemToGrid(widget.itemsList);
    Navigator.of(context).pop((false, ''));
  }
}
