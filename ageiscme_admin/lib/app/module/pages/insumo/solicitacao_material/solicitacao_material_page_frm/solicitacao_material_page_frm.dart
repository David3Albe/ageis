import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page_frm/solicitacao_material_item_page_frm_state.dart';
import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
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

  late final InsumoCubit insumoCubit;
  final List<SolicitacaoMaterialItemModel> itemsList;

  late final SolicitacaoMaterialItemPageFrmCubit cubit =
      SolicitacaoMaterialItemPageFrmCubit(
    service: SolicitacaoMaterialService(),
    itemsList: itemsList,
  );

  late final TextFieldStringWidget txtQuantidade = TextFieldStringWidget(
    placeholder: 'Quantidade (Unidades)',
    onChanged: (String? str) {
      solicitacaoMaterialItem.quantidadeSolicitada =
          double.tryParse(txtQuantidade.text);
    },
  );

  void initState() {
    insumoCubit = InsumoCubit();
    insumoCubit.loadAll();

    txtQuantidade.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    if (solicitacaoMaterialItem.quantidadeSolicitada == 0) {
      txtQuantidade.text = '';
    } else {
      txtQuantidade.text =
          solicitacaoMaterialItem.quantidadeSolicitada.toString();
    }

    titulo = 'Solicitação de Material';
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<SolicitacaoMaterialItemPageFrmCubit,
        SolicitacaoMaterialItemPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<SolicitacaoMaterialItemPageFrmCubit,
          SolicitacaoMaterialItemPageFrmState>(
        bloc: cubit,
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
            content: Container(
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
                      child: BlocBuilder<EquipamentoCubit, EquipamentoState>(
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
                            },
                            placeholder: 'Equipamento',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<InsumoCubit, InsumoState>(
                        bloc: insumoCubit,
                        builder: (context, insumoState) {
                          if (insumoState.loading) {
                            return const LoadingWidget();
                          }
                          List<InsumoModel> insumos = insumoState.objs;
                          insumos.sort(
                            (a, b) => a.nome!.compareTo(b.nome!),
                          );
                          InsumoModel? insumo = insumos
                              .where(
                                (element) =>
                                    element.cod ==
                                    solicitacaoMaterialItem.codInsumo,
                              )
                              .firstOrNull;
                          return DropDownSearchWidget<InsumoModel>(
                            textFunction: (insumo) =>
                                insumo.GetNomeInsumoText(),
                            initialValue: insumo,
                            sourceList: insumos
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) {
                              solicitacaoMaterialItem.codInsumo = value?.cod;
                              solicitacaoMaterialItem.nomeInsumo = value?.nome;
                              solicitacaoMaterialItem.unidadeMedida =
                                  value?.unidadeMedida;
                            },
                            placeholder: 'Insumo',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtQuantidade,
                    ),
                  ],
                ),
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
      ),
    );
  }

  void salvar() {
    if (!txtQuantidade.valid) return;

    setState(() {
      widget.itemsList.add(solicitacaoMaterialItem);
      solicitacaoMaterialItem = SolicitacaoMaterialItemModel.empty();
    });

    widget.updateItemList(widget.itemsList);
    cubit.addItemToGrid(widget.itemsList);
    Navigator.of(context).pop((false, ''));
  }
}
