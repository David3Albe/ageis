import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/destino_residuo/destino_residuo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/fabricante/fabricante_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/fornecedor/fornecedor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/unidade_medida/unidade_medida_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_drop_down_search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_insumos/equipamento_insumo_page.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo/insumo_page_frm/insumo_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_teste/insumo_teste_page_frm/insumo_teste_page_frm.dart';
import 'package:ageiscme_data/services/insumo/insumo_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/insumo_teste/insumo_teste_model.dart';
import 'package:compartilhados/alert_dialog/form_alert_dialog_widget.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class InsumoPageFrm extends StatefulWidget {
  const InsumoPageFrm({
    Key? key,
    required this.insumo,
  }) : super(key: key);

  final InsumoModel insumo;

  @override
  State<InsumoPageFrm> createState() => _InsumoPageFrmState(insumo: insumo);
}

class _InsumoPageFrmState extends State<InsumoPageFrm> {
  _InsumoPageFrmState({required this.insumo});
  late final FabricanteCubit fabricanteCubit;
  late final FornecedorCubit fornecedorCubit;
  late final UnidadeMedidaCubit unidadeMedidaCubit;
  late String titulo;
  InsumoModel insumo;
  late final InsumoPageFrmCubit cubit = InsumoPageFrmCubit(
    insumoModel: insumo,
    service: InsumoService(),
  );
  late final TextFieldStringWidget txtNomeitem = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      insumo.nome = txtNomeitem.text;
    },
  );
  late final TextFieldStringWidget txtDescricaoItem = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      insumo.descricao = txtDescricaoItem.text;
    },
  );
  late final TextFieldStringWidget txtCodBarra = TextFieldStringWidget(
    placeholder: 'Cód. Insumo',
    onChanged: (String? str) {
      insumo.codBarra = int.parse(txtCodBarra.text);
    },
  );
  // late final TextFieldStringWidget txtCodErp3Albe = TextFieldStringWidget(
  //   placeholder: 'Cód. ERP da 3Albe',
  //   onChanged: (String? str) {
  //     insumo.codErp3Albe = txtCodErp3Albe.text;
  //   },
  // );

  late final TextFieldStringWidget txtUnidadeMedida = TextFieldStringWidget(
    placeholder: 'Unidade Medida',
    onChanged: (String? str) {
      insumo.unidadeMedida = txtUnidadeMedida.text;
    },
  );
  late final TextFieldStringWidget txtEmbalagem = TextFieldStringWidget(
    placeholder: 'Embalagem',
    onChanged: (String? str) {
      insumo.embalagem = txtEmbalagem.text;
    },
  );
  late final TextFieldStringWidget txtQtde = TextFieldStringWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      insumo.qtdeEmbalagem = double.parse(txtQtde.text);
    },
  );
  late final TextFieldStringWidget txtFabricante = TextFieldStringWidget(
    placeholder: 'Fabricante',
    onChanged: (String? str) {
      insumo.fabricante = txtFabricante.text;
    },
  );
  late final TextFieldStringWidget txtFornecedor = TextFieldStringWidget(
    placeholder: 'Fornecedor',
    onChanged: (String? str) {
      insumo.fornecedor = txtFornecedor.text;
    },
  );
  late final TextFieldStringWidget txtRegistroAnvisa = TextFieldStringWidget(
    placeholder: 'Registro Anvisa',
    onChanged: (String? str) {
      insumo.registroAnvisa = txtRegistroAnvisa.text;
    },
  );
  late final TextFieldStringWidget txtEstoqueMinimo = TextFieldStringWidget(
    placeholder: 'Estoque Mínimo',
    onChanged: (String? str) {
      insumo.estoqueMinimo = double.parse(txtEstoqueMinimo.text);
    },
  );
  late final TextFieldStringWidget txtEstoqueMaximo = TextFieldStringWidget(
    placeholder: 'Estoque Máximo',
    onChanged: (String? str) {
      insumo.estoqueMaximo = double.parse(txtEstoqueMaximo.text);
    },
  );
  late final TextFieldStringWidget txtPrazoEntrega = TextFieldStringWidget(
    placeholder: 'Prazo de Entrega',
    onChanged: (String? str) {
      insumo.prazoEntregaDias = int.parse(txtPrazoEntrega.text);
    },
  );
  late final TextFieldStringWidget txtPontoReposicao = TextFieldStringWidget(
    placeholder: 'Ponto de Reposição',
    onChanged: (String? str) {
      insumo.pontoReposicao = double.parse(txtPontoReposicao.text);
    },
  );
  late final TextFieldStringWidget txtPrazoValidadeAposAtivacao =
      TextFieldStringWidget(
    placeholder: 'Prazo de Validade Após Ativação',
    onChanged: (String? str) {
      insumo.validadeAposAtivacaoDias =
          int.parse(txtPrazoValidadeAposAtivacao.text);
    },
  );

  late final DepositoInsumoCubit depositoInsumoCubit;
  late final DestinoResiduoCubit destinoResiduoCubit;

  void initState() {
    fabricanteCubit = FabricanteCubit();
    fabricanteCubit.loadAll();
    fornecedorCubit = FornecedorCubit();
    fornecedorCubit.loadAll();
    unidadeMedidaCubit = UnidadeMedidaCubit();
    unidadeMedidaCubit.loadAll();
    depositoInsumoCubit = DepositoInsumoCubit();
    destinoResiduoCubit = DestinoResiduoCubit();
    destinoResiduoCubit.loadAll();


    txtCodBarra.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtNomeitem.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return ' Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtDescricaoItem.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtUnidadeMedida.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtEmbalagem.addValidator((String str) {
      if (str.length > 30) {
        return 'Pode ter no máximo 30 caracteres';
      }
      return '';
    });

    txtFabricante.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtFornecedor.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtRegistroAnvisa.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtEstoqueMinimo.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtEstoqueMaximo.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtPrazoEntrega.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtPontoReposicao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtQtde.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNomeitem.text = insumo.nome.toString();
    txtQtde.text = insumo.qtdeEmbalagem == 0 || insumo.qtdeEmbalagem == null
        ? ''
        : insumo.qtdeEmbalagem.toString();

    txtCodBarra.text = insumo.codBarra == 0 ? '' : insumo.codBarra.toString();
    txtDescricaoItem.text = insumo.descricao ?? '';
    // txtCodErp3Albe.text = insumo.codErp3Albe ?? '';
    txtEmbalagem.text = insumo.embalagem ?? '';
    txtRegistroAnvisa.text = insumo.registroAnvisa ?? '';
    txtUnidadeMedida.text = insumo.unidadeMedida ?? '';
    txtFornecedor.text = insumo.fornecedor ?? '';
    txtFabricante.text = insumo.fabricante ?? '';

    titulo = 'Cadastro de Insumo';
    if (insumo.cod != 0) {
      titulo = 'Edição do Insumo: ${insumo.cod} - ${insumo.nome}';
    }

    if (insumo.controleEstoque != true) return;
    txtEstoqueMinimo.text =
        insumo.estoqueMinimo == 0 || insumo.estoqueMinimo == null
            ? ''
            : insumo.estoqueMinimo.toString();
    txtEstoqueMaximo.text =
        insumo.estoqueMaximo == 0 || insumo.estoqueMaximo == null
            ? ''
            : insumo.estoqueMaximo.toString();
    txtPrazoEntrega.text =
        insumo.prazoEntregaDias == 0 || insumo.prazoEntregaDias == null
            ? ''
            : insumo.prazoEntregaDias.toString();
    txtPontoReposicao.text =
        insumo.pontoReposicao == 0 || insumo.pontoReposicao == null
            ? ''
            : insumo.pontoReposicao.toString();
    txtPrazoValidadeAposAtivacao.text = insumo.validadeAposAtivacaoDias == 0 ||
            insumo.validadeAposAtivacaoDias == null
        ? ''
        : insumo.validadeAposAtivacaoDias.toString();
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<InsumoPageFrmCubit, InsumoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<InsumoPageFrmCubit, InsumoPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(8.0),
            titlePadding: const EdgeInsets.all(8.0),
            actionsPadding: const EdgeInsets.all(8.0),
            title: Row(
              children: [
                TitleWidget(
                  text: titulo,
                ),
                const Spacer(),
                CloseButtonWidget(
                  onPressed: () => Navigator.of(context).pop((false, '')),
                ),
              ],
            ),
            content: Container(
              width: size.width * .6,
              height: size.height * .8,
              constraints: const BoxConstraints(
                minWidth: 500,
                minHeight: 600,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtNomeitem,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtDescricaoItem,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropDownSearchApiWidget<ItemModel>(
                        initialValue: insumo.item,
                        search: (str) => ItemService().Filter(
                          ItemFilter(
                            numeroRegistros: 30,
                            termoPesquisa: str,
                            idEtiquetaComecaCom: 'ZI',
                          ),
                        ),
                        onChanged: (value) {
                          insumo.codItem = value!.cod!;
                          insumo.item = value;
                        },
                        placeholder: 'Item',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtCodBarra,
                          ),
                          // const SizedBox(width: 16.0),
                          // Expanded(
                          //   child: txtCodErp3Albe,
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtEmbalagem,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: txtQtde,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: txtRegistroAnvisa,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtUnidadeMedida,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<UnidadeMedidaCubit,
                                List<UnidadeMedidaModel>>(
                              bloc: unidadeMedidaCubit,
                              builder: (context, unidadeMedidas) {
                                unidadeMedidas.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                UnidadeMedidaModel? unidadeMedida =
                                    unidadeMedidas
                                        .where(
                                          (element) =>
                                              element.cod ==
                                              insumo.codUnidadeMedida,
                                        )
                                        .firstOrNull;
                                return DropDownWidget<UnidadeMedidaModel>(
                                  initialValue: unidadeMedida,
                                  sourceList: unidadeMedidas,
                                  onChanged: (value) =>
                                      insumo.codFabricante = value.cod!,
                                  placeholder: 'Unidade Medida',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child:
                          BlocBuilder<DestinoResiduoCubit, DestinoResiduoState>(
                        bloc: destinoResiduoCubit,
                        builder: (context, destinoState) {
                          if (destinoState.loading) {
                            return const LoadingWidget();
                          }
                          List<DestinoResiduoModel> destinos =
                              destinoState.objs;

                          destinos.sort(
                            (a, b) => a.nome!.compareTo(b.nome!),
                          );
                          DestinoResiduoModel? destino = destinos
                              .where(
                                (element) =>
                                    element.cod == insumo.codDestinoResiduo,
                              )
                              .firstOrNull;
                          return DropDownSearchWidget<DestinoResiduoModel>(
                            textFunction: (destino) =>
                                destino.GetNomeDestinoText(),
                            initialValue: destino,
                            sourceList: destinos,
                            onChanged: (value) =>
                                insumo.codDestinoResiduo = value?.cod!,
                            placeholder: 'Destino Resíduos',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtFabricante,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtFornecedor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child:
                                BlocBuilder<FabricanteCubit, FabricanteState>(
                              bloc: fabricanteCubit,
                              builder: (context, fabricanteState) {
                                if (fabricanteState.loading) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                List<FabricanteModel> fabricantes =
                                    fabricanteState.fabricantes;
                                fabricantes.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                FabricanteModel? fabricante = fabricantes
                                    .where(
                                      (element) =>
                                          element.cod == insumo.codFabricante,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget<FabricanteModel>(
                                  textFunction: (p0) => p0.GetDropDownText(),
                                  initialValue: fabricante,
                                  sourceList: fabricantes,
                                  onChanged: (value) {
                                    insumo.fabricanteItem = value;
                                    insumo.codFabricante = value?.cod;
                                  },
                                  placeholder: 'Fabricante',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child:
                                BlocBuilder<FornecedorCubit, FornecedorState>(
                              bloc: fornecedorCubit,
                              builder: (context, stateFornecedor) {
                                if (stateFornecedor.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<FornecedorModel> fornecedores =
                                    stateFornecedor.fornecedores;
                                fornecedores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                FornecedorModel? fornecedor = fornecedores
                                    .where(
                                      (element) =>
                                          element.cod == insumo.codFornecedor,
                                    )
                                    .firstOrNull;
                                insumo.fornecedorItem = fornecedor;
                                return DropDownSearchWidget<FornecedorModel>(
                                  textFunction: (p0) => p0.GetDropDownText(),
                                  initialValue: fornecedor,
                                  sourceList: fornecedores,
                                  onChanged: (value) {
                                    setState(() {
                                      insumo.nome = insumo.nome?.replaceAll(
                                        ' - ' +
                                            (insumo.fornecedorItem?.nome ?? ''),
                                        '',
                                      );
                                      txtNomeitem.text = insumo.nome ?? '';
                                      insumo.codFornecedor = value?.cod;
                                      if (insumo.nome == null ||
                                          value?.nome == null) return;
                                      insumo.nome =
                                          insumo.nome! + ' - ' + value!.nome!;
                                    });
                                  },
                                  placeholder: 'Fornecedor',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: insumo.ativo,
                                onClick: (value) => insumo.ativo = value,
                                text: 'Ativo',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 16.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: insumo.testeInsumoObrigatorio,
                                onClick: (value) =>
                                    insumo.testeInsumoObrigatorio = value,
                                text: 'Teste Obrigatório',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 16.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: insumo.controleEstoque,
                                onClick: (value) {
                                  setState(() {
                                    insumo.controleEstoque = value;
                                  });
                                },
                                text: 'Controlar Estoque',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (insumo.controleEstoque == true) ...{
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: txtEstoqueMinimo,
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: txtEstoqueMaximo,
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: txtPontoReposicao,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: txtPrazoEntrega,
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: txtPrazoValidadeAposAtivacao,
                            ),
                          ],
                        ),
                      ),
                    },
                    const Padding(padding: EdgeInsets.only(top: 24.0)),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: [
                      if (insumo.cod != null && insumo.cod != 0)
                        CustomPopupItemModel(
                          text: 'Testes',
                          onTap: abrirTesteInsumo,
                        ),
                      if (insumo.cod != null && insumo.cod != 0)
                        CustomPopupItemModel(
                          text: 'Equipamentos',
                          onTap: _abrirEquipamentos,
                        ),
                      if (insumo.cod != null && insumo.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: insumo.cod!,
                            termo: 'INSUMO',
                          ),
                          context: context,
                        ),
                    ],
                  ),
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
                          insumo = InsumoModel.empty();
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

  void loadDepositoInsumo() {
    depositoInsumoCubit.loadAll();
  }

  void loadUsuarios({
    required UsuarioDropDownSearchCubit usuarioCubit,
  }) {
    usuarioCubit.loadDropDownSearch(
      UsuarioDropDownSearchDTO(
        numeroRegistros: 10000,
      ),
    );
  }

  Future abrirTesteInsumo() async {
    if (insumo.cod == null || insumo.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o teste cadastrado para acessar a tela de insumos.',
      );
      return;
    }
    UsuarioDropDownSearchCubit usuarioCubit = UsuarioDropDownSearchCubit();
    loadUsuarios(usuarioCubit: usuarioCubit);
    loadDepositoInsumo();
    InsumoTesteModel insumoTesteModel = InsumoTesteModel.empty();
    insumoTesteModel.codInsumo = insumo.cod;
    insumoTesteModel.insumo = insumo;
    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return InsumoTestePageFrm(
          insumoReadOnly: true,
          depositoInsumoCubit: depositoInsumoCubit,
          insumoTeste: insumoTesteModel,
          usuarioCubit: usuarioCubit,
        );
      },
    );
    if (result == null || !result.$1) return;
    Navigator.of(context).pop(result);
  }

  Future _abrirEquipamentos() async {
    if (insumo.cod == null || insumo.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o insumo cadastrado para acessar a tela de vinculação de insumos e equipamentos.',
      );
      return;
    }

    Size size = MediaQuery.of(context).size;
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FormAlertDialogWidget(
          title: Row(
            children: [
              const Expanded(
                child: TitleWidget(
                  text: 'Cadastro de Insumos do Equipamento',
                ),
              ),
              const Spacer(),
              CloseButtonWidget(
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          content: Container(
            width: size.width * 0.8,
            height: size.height * 0.7,
            constraints: const BoxConstraints(
              minWidth: 700,
              minHeight: 700,
              maxHeight: 900,
              maxWidth: 900,
            ),
            child: EquipamentoInsumoPage(
              codInsumo: insumo.cod,
            ),
          ),
        );
      },
    );
  }

  void salvar() {
    if (!txtCodBarra.valid ||
        !txtNomeitem.valid ||
        !txtDescricaoItem.valid ||
        !txtUnidadeMedida.valid ||
        !txtEmbalagem.valid ||
        !txtFabricante.valid ||
        !txtFornecedor.valid ||
        !txtRegistroAnvisa.valid) return;

    if (insumo.controleEstoque == true) {
      if (!txtEstoqueMinimo.valid ||
          !txtEstoqueMaximo.valid ||
          !txtPrazoEntrega.valid ||
          !txtPontoReposicao.valid ||
          !txtQtde.valid) return;
    }
    cubit.save(insumo);
  }
}
