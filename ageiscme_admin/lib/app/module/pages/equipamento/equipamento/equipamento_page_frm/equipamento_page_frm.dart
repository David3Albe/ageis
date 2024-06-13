import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/fabricante/fabricante_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento/equipamento_page_frm/equipamento_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_insumos/equipamento_insumo_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/equipamento/equipamento_service.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/equipamento_servico/equipamento_servico_model.dart';
import 'package:compartilhados/alert_dialog/form_alert_dialog_widget.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_list_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EquipamentoPageFrm extends StatefulWidget {
  const EquipamentoPageFrm({
    Key? key,
    required this.equipamento,
  }) : super(key: key);

  final EquipamentoModel equipamento;

  @override
  State<EquipamentoPageFrm> createState() =>
      _EquipamentoPageFrmState(equipamento: equipamento);
}

class _EquipamentoPageFrmState extends State<EquipamentoPageFrm> {
  _EquipamentoPageFrmState({required this.equipamento});

  late String titulo;
  EquipamentoModel equipamento;
  late final FabricanteCubit fabricanteCubit;
  late final ServicoTipoCubit servicoTipoCubit;

  late final EquipamentoPageFrmCubit cubit = EquipamentoPageFrmCubit(
    equipamentoModel: equipamento,
    service: EquipamentoService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      equipamento.nome = txtNome.text;
    },
  );

  late final TextFieldNumberWidget txtCodBarra = TextFieldNumberWidget(
    placeholder: 'Código de Barras',
    readOnly: true,
    onChanged: (String? str) {
      equipamento.codBarra = txtCodBarra.text;
    },
  );

  late final TextFieldStringWidget txtFabricante = TextFieldStringWidget(
    placeholder: 'Fabricante',
    onChanged: (String? str) {
      equipamento.fabricante = txtFabricante.text;
    },
  );

  late final TextFieldNumberWidget txtAnoFabricacao = TextFieldNumberWidget(
    placeholder: 'Ano de Fabricação',
    onChanged: (String? str) {
      equipamento.anoFabricacao = str == null ? null : int.parse(str);
    },
  );

  late final TextFieldNumberWidget txtCapacidadeLitro = TextFieldNumberWidget(
    placeholder: 'Capacidade (Litros)',
    onChanged: (String? str) {
      equipamento.capacidadeLitro = str == null ? null : int.parse(str);
    },
  );

  late final TextFieldStringWidget txtSerie = TextFieldStringWidget(
    placeholder: 'Série',
    onChanged: (String? str) {
      equipamento.serie = txtSerie.text;
    },
  );

  late final TextFieldStringWidget txtRegistroAnvisa = TextFieldStringWidget(
    placeholder: 'Registro Anvisa',
    onChanged: (String? str) {
      equipamento.registroAnvisa = txtRegistroAnvisa.text;
    },
  );

  late final TextFieldStringWidget txtStatus = TextFieldStringWidget(
    placeholder: 'Situação',
    readOnly: true,
  );

  late final DatePickerWidget dtpValidadeInspecao = DatePickerWidget(
    placeholder: 'Validade da Última Inspeção',
    readOnly: true,
    initialValue: equipamento.validadeInspecao,
  );
  late final EquipamentoCubit equipamentoCubit;

  @override
  void initState() {
    fabricanteCubit = FabricanteCubit();
    fabricanteCubit.loadAll();
    servicoTipoCubit = ServicoTipoCubit();
    servicoTipoCubit.loadAll();

    equipamentoCubit = EquipamentoCubit();

    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtFabricante.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtCodBarra.addValidator((String str) {
      if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });

    txtAnoFabricacao.addValidator((String str) {
      if (!str.isEmpty && (int.parse(str) < 1800 || int.parse(str) > 2200)) {
        return 'Ano inválido. Verifique o valor digitado';
      }
      return '';
    });

    txtSerie.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtRegistroAnvisa.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtStatus.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNome.text = equipamento.nome?.toString() ?? '';
    txtStatus.text = equipamento.status?.toString() ?? '';
    txtCodBarra.text = equipamento.codBarra?.toString() ?? '';
    txtFabricante.text = equipamento.fabricante?.toString() ?? '';
    txtAnoFabricacao.text = equipamento.anoFabricacao?.toString() ?? '';
    txtCapacidadeLitro.text = equipamento.capacidadeLitro?.toString() ?? '';
    txtSerie.text = equipamento.serie?.toString() ?? '';
    txtRegistroAnvisa.text = equipamento.registroAnvisa?.toString() ?? '';

    if (equipamento.status == '0') {
      txtStatus.text = 'Bloqueado';
      equipamento.status = '0';
    } else if (equipamento.status == '1') {
      txtStatus.text = 'Liberado';
      equipamento.status = '1';
    } else if (equipamento.status == '2') {
      txtStatus.text = 'Liberado com Restrições';
      equipamento.serie = '2';
    } else {
      txtStatus.text = '';
      equipamento.status = '';
    }

    titulo = 'Cadastro de Equipamentos';
    if (equipamento.cod != 0) {
      titulo =
          'Edição do Equipamento: ${equipamento.cod} - ${equipamento.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<EquipamentoPageFrmCubit, EquipamentoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<EquipamentoPageFrmCubit, EquipamentoPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return FormAlertDialogWidget(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtNome,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: txtCodBarra,
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
                          const SizedBox(width: 50.0),
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
                                FabricanteModel? fabricante = fabricantes
                                    .where(
                                      (element) =>
                                          element.nome ==
                                          equipamento.fabricante,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (p0) => p0.GetDropDownText(),
                                  initialValue: fabricante,
                                  sourceList: fabricantes,
                                  onChanged: (value) {
                                    equipamento.fabricante = value?.nome;
                                  },
                                  placeholder: 'Fabricante',
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
                            child: txtAnoFabricacao,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: txtCapacidadeLitro,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtSerie,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: txtRegistroAnvisa,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: CustomCheckboxWidget(
                        checked: equipamento.ativo,
                        onClick: (value) => equipamento.ativo = value,
                        text: 'Ativo',
                        align: MainAxisAlignment.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtStatus,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: dtpValidadeInspecao,
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5.0)),
                    Text(
                      'Tipo de Serviço',
                      style: TextStyle(
                        fontSize: HelperFunctions.calculaFontSize(context, 16),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<ServicoTipoCubit, ServicoTipoState>(
                        bloc: servicoTipoCubit,
                        builder: (context, state) {
                          List<ServicoTipoModel> servicosTipos =
                              state.tiposServico;
                          final items = servicosTipos
                              .map((servicoTipo) => servicoTipo.nome)
                              .toList();
                          var checkedList =
                              List<bool>.filled(items.length, false);
                          if (equipamento.equipamentosServicos != null) {
                            for (final equipamentoServico
                                in equipamento.equipamentosServicos!) {
                              final codServico = equipamentoServico.codServico;

                              if (servicosTipos.any(
                                (servicoTipo) => servicoTipo.cod == codServico,
                              )) {
                                final index = servicosTipos.indexWhere(
                                  (servicoTipo) =>
                                      servicoTipo.cod == codServico,
                                );

                                if (index >= 0) {
                                  checkedList[index] = true;
                                }
                              }
                            }
                          }
                          return CheckboxListWidget(
                            items: items,
                            checkedList: checkedList,
                            onChecked: (values) {
                              final codigosServicosSelecionados = <int>[];
                              for (var i = 0; i < items.length; i++) {
                                if (values[i]) {
                                  codigosServicosSelecionados
                                      .add(servicosTipos[i].cod ?? 0);
                                }
                              }
                              equipamento.equipamentosServicos =
                                  codigosServicosSelecionados.map((codServico) {
                                return EquipamentoServicoModel(
                                  cod: 0,
                                  codEquipamento: equipamento.cod,
                                  codServico: codServico,
                                  codInstituicao: 0,
                                  ultimaAlteracao: null,
                                  tstamp: '',
                                );
                              }).toList();
                            },
                          );
                        },
                      ),
                    ),
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
                      CustomPopupItemModel(
                        text: 'Serviços',
                        onTap: abrirMonitoramento,
                      ),
                      CustomPopupItemModel(
                        text: 'Insumos',
                        onTap: abrirInsumos,
                      ),
                      if (equipamento.cod != null && equipamento.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: equipamento.cod!,
                            termo: 'EQUIPAMENTO',
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
                          equipamento = EquipamentoModel.empty();
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
    if (!txtNome.valid ||
        !txtFabricante.valid ||
        !txtCodBarra.valid ||
        !txtAnoFabricacao.valid ||
        !txtSerie.valid ||
        !txtRegistroAnvisa.valid ||
        !txtStatus.valid) return;
    cubit.save(equipamento);
  }

  void loadEquipamentoCubit() {
    if (!equipamentoCubit.state.loaded) {
      equipamentoCubit.loadFilter(
        EquipamentoFilter(
          incluirTipoServicos: true,
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future abrirInsumos() async {
    if (equipamento.cod == null || equipamento.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o equipamento cadastrado para acessar a tela de serviços.',
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
              codEquipamento: equipamento.cod,
            ),
          ),
        );
      },
    );
  }

  Future abrirMonitoramento() async {
    if (equipamento.cod == null || equipamento.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o equipamento cadastrado para acessar a tela de serviços.',
      );
      return;
    }
    loadEquipamentoCubit();
    RegistroServicoModel registroServicoModel = RegistroServicoModel.empty();
    registroServicoModel.codEquipamento = equipamento.cod;
    registroServicoModel.equipamento = equipamento;
    registroServicoModel.dataInicio = DateTime.now();
    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return RegistroServicoPageFrm(
          equipamentoReadOnly: true,
          itemReadOnly: true,
          equipamentoCubit: equipamentoCubit,
          itemFilter: ItemFilter(
            apenasAtivos: true,
            ordenarPorNomeCrescente: true,
          ),
          registroServico: registroServicoModel,
        );
      },
    );
    if (result == null || !result.$1) return;
    Navigator.of(context).pop(result);
  }
}
