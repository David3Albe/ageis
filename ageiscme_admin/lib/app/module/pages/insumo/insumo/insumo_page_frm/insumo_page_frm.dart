import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/fabricante/fabricante_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/fornecedor/fornecedor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/unidade_medida/unidade_medida_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo/insumo_page_frm/insumo_page_frm_state.dart';
import 'package:ageiscme_data/services/insumo/insumo_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
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
    placeholder: 'Código de Barras',
    onChanged: (String? str) {
      insumo.codBarra = int.parse(txtCodBarra.text);
    },
  );
  late final TextFieldStringWidget txtCodErp3Albe = TextFieldStringWidget(
    placeholder: 'Cód. ERP da 3Albe',
    onChanged: (String? str) {
      insumo.codErp3Albe = txtCodErp3Albe.text;
    },
  );

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

  void initState() {
    fabricanteCubit = FabricanteCubit();
    fabricanteCubit.loadAll();
    fornecedorCubit = FornecedorCubit();
    fornecedorCubit.loadAll();
    unidadeMedidaCubit = UnidadeMedidaCubit();
    unidadeMedidaCubit.loadAll();

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

    if (insumo.qtdeEmbalagem == 0 || insumo.qtdeEmbalagem == null) {
      txtQtde.text = '';
    } else {
      txtQtde.text = insumo.qtdeEmbalagem.toString();
    }
    if (insumo.codBarra == 0) {
      txtCodBarra.text = '';
    } else {
      txtCodBarra.text = insumo.codBarra.toString();
    }

    if (insumo.descricao == null) {
      txtDescricaoItem.text = '';
    } else {
      txtDescricaoItem.text = insumo.descricao.toString();
    }
    if (insumo.codErp3Albe == null) {
      txtCodErp3Albe.text = '';
    } else {
      txtCodErp3Albe.text = insumo.codErp3Albe.toString();
    }
    if (insumo.embalagem == null) {
      txtEmbalagem.text = '';
    } else {
      txtEmbalagem.text = insumo.embalagem.toString();
    }
    if (insumo.registroAnvisa == null) {
      txtRegistroAnvisa.text = '';
    } else {
      txtRegistroAnvisa.text = insumo.registroAnvisa.toString();
    }
    if (insumo.unidadeMedida == null) {
      txtUnidadeMedida.text = '';
    } else {
      txtUnidadeMedida.text = insumo.unidadeMedida.toString();
    }
    if (insumo.fornecedor == null) {
      txtFornecedor.text = '';
    } else {
      txtFornecedor.text = insumo.fornecedor.toString();
    }
    if (insumo.fabricante == null) {
      txtFabricante.text = '';
    } else {
      txtFabricante.text = insumo.fabricante.toString();
    }

    if (insumo.controleEstoque == true) {
      if (insumo.estoqueMinimo == 0 || insumo.estoqueMinimo == null) {
        txtEstoqueMinimo.text = '';
      } else {
        txtEstoqueMinimo.text = insumo.estoqueMinimo.toString();
      }
      if (insumo.estoqueMaximo == 0 || insumo.estoqueMaximo == null) {
        txtEstoqueMaximo.text = '';
      } else {
        txtEstoqueMaximo.text = insumo.estoqueMaximo.toString();
      }
      if (insumo.prazoEntregaDias == 0 || insumo.prazoEntregaDias == null) {
        txtPrazoEntrega.text = '';
      } else {
        txtPrazoEntrega.text = insumo.prazoEntregaDias.toString();
      }
      if (insumo.pontoReposicao == 0 || insumo.pontoReposicao == null) {
        txtPontoReposicao.text = '';
      } else {
        txtPontoReposicao.text = insumo.pontoReposicao.toString();
      }
      if (insumo.validadeAposAtivacaoDias == 0 ||
          insumo.validadeAposAtivacaoDias == null) {
        txtPrazoValidadeAposAtivacao.text = '';
      } else {
        txtPrazoValidadeAposAtivacao.text =
            insumo.validadeAposAtivacaoDias.toString();
      }
    }
    titulo = 'Cadastro de Insumo';
    if (insumo.cod != 0) {
      titulo = 'Edição do Insumo: ${insumo.cod} - ${insumo.nome}';
    }
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
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtCodErp3Albe,
                          ),
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
                            child: BlocBuilder<FabricanteCubit,
                                List<FabricanteModel>>(
                              bloc: fabricanteCubit,
                              builder: (context, fabricantes) {
                                fabricantes.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                FabricanteModel? fabricante = fabricantes
                                    .where(
                                      (element) =>
                                          element.cod == insumo.codFabricante,
                                    )
                                    .firstOrNull;
                                return DropDownWidget<FabricanteModel>(
                                  initialValue: fabricante,
                                  sourceList: fabricantes,
                                  onChanged: (value) =>
                                      insumo.codFabricante = value.cod!,
                                  placeholder: 'Fabricante',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<FornecedorCubit,
                                List<FornecedorModel>>(
                              bloc: fornecedorCubit,
                              builder: (context, fornecedores) {
                                fornecedores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                FornecedorModel? fornecedor = fornecedores
                                    .where(
                                      (element) =>
                                          element.cod == insumo.codFornecedor,
                                    )
                                    .firstOrNull;
                                return DropDownWidget<FornecedorModel>(
                                  initialValue: fornecedor,
                                  sourceList: fornecedores,
                                  onChanged: (value) =>
                                      insumo.codFabricante = value.cod!,
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
