import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_tipo/processo_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_state.dart';
import 'package:ageiscme_data/services/processo_etapa/processo_etapa_service.dart';
import 'package:ageiscme_impressoes/dto/stage_indicator_print/stage_indicator_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_indicator_printer/stage_indicator_printer_controller.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrm extends StatefulWidget {
  const ProcessoEtapaPageFrm({
    Key? key,
    required this.processoEtapa,
  }) : super(key: key);

  final ProcessoEtapaModel processoEtapa;

  @override
  State<ProcessoEtapaPageFrm> createState() =>
      _ProcessoEtapaPageFrmState(processoEtapa: processoEtapa);
}

class _ProcessoEtapaPageFrmState extends State<ProcessoEtapaPageFrm> {
  _ProcessoEtapaPageFrmState({required this.processoEtapa});
  late final ProcessoTipoCubit processoTipoCubit;
  late final EquipamentoCubit equipamentoCubit;
  late final ArsenalEstoqueCubit arsenalEstoqueCubit;
  late final ServicoTipoCubit servicoTipoCubit;
  late String titulo;
  ProcessoEtapaModel processoEtapa;

  late final ProcessoEtapaPageFrmCubit cubit = ProcessoEtapaPageFrmCubit(
    processoEtapaModel: processoEtapa,
    service: ProcessoEtapaService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      processoEtapa.nome = txtNome.text;
    },
  );

  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      processoEtapa.descricao = txtDescricao.text;
    },
  );

  late final TextFieldStringWidget txtEtiquetaPreparo = TextFieldStringWidget(
    placeholder: 'Etiqueta Preparo',
    onChanged: (String? str) {
      processoEtapa.descricaoEtiquetaPreparo = txtEtiquetaPreparo.text;
    },
  );

  late final TextFieldStringWidget txtTempoCicloProcesso =
      TextFieldStringWidget(
    placeholder: 'Tempo Ciclo Preparo (Minutos)',
    onChanged: (String? str) {
      processoEtapa.tempoCicloProcesso = int.parse(txtTempoCicloProcesso.text);
    },
  );

  late final List<CustomPopupItemModel> items;

  @override
  void initState() {
    processoTipoCubit = ProcessoTipoCubit();
    processoTipoCubit.loadAll();
    equipamentoCubit = EquipamentoCubit();
    equipamentoCubit.loadFilter(
      EquipamentoFilter(
        ordenarPorNomeCrescente: true,
      ),
    );
    arsenalEstoqueCubit = ArsenalEstoqueCubit();
    arsenalEstoqueCubit.loadFilter(
      ArsenalEstoqueFilter(
        ordenarPorNomeCrescente: true,
      ),
    );
    servicoTipoCubit = ServicoTipoCubit();
    servicoTipoCubit.loadAll();
    items = _getItems();

    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtDescricao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtEtiquetaPreparo.addValidator((String str) {
      if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });

    txtTempoCicloProcesso.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNome.text = processoEtapa.nome.toString();
    txtDescricao.text = processoEtapa.descricao.toString();
    if (processoEtapa.testeBiologicoEntrada == null) {
      processoEtapa.testeBiologicoEntrada = false;
    }
    if (processoEtapa.testeBiologicoSaida == null) {
      processoEtapa.testeBiologicoSaida = false;
    }

    if (processoEtapa.descricaoEtiquetaPreparo == null) {
      txtEtiquetaPreparo.text = '';
    } else {
      txtEtiquetaPreparo.text =
          processoEtapa.descricaoEtiquetaPreparo.toString();
    }

    if (processoEtapa.tempoCicloProcesso == 0) {
      txtTempoCicloProcesso.text = '';
    } else {
      txtTempoCicloProcesso.text = processoEtapa.tempoCicloProcesso.toString();
    }

    titulo = 'Cadastro de Etapas Processo';
    if (processoEtapa.cod != 0) {
      titulo =
          'Edição de Etapa Processo: ${processoEtapa.cod} - ${processoEtapa.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<ProcessoEtapaPageFrmCubit, ProcessoEtapaPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<ProcessoEtapaPageFrmCubit, ProcessoEtapaPageFrmState>(
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
                maxHeight: size.height * .95,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<ProcessoTipoCubit, ProcessoTipoState>(
                        bloc: processoTipoCubit,
                        builder: (context, processosTiposState) {
                          if (processosTiposState.loading) {
                            return const LoadingWidget();
                          }
                          List<ProcessoTipoModel> processosTipos =
                              processosTiposState.processosTipos;
                          processosTipos.sort(
                            (a, b) => a.nome.compareTo(b.nome),
                          );
                          ProcessoTipoModel? processoTipo = processosTipos
                              .where(
                                (element) =>
                                    element.cod ==
                                    processoEtapa.codProcessoTipo,
                              )
                              .firstOrNull;
                          return DropDownWidget<ProcessoTipoModel>(
                            initialValue: processoTipo,
                            sourceList: processosTipos
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) =>
                                processoEtapa.codProcessoTipo = value.cod!,
                            placeholder: 'Tipo Processo',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtNome,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child:
                                BlocBuilder<EquipamentoCubit, EquipamentoState>(
                              bloc: equipamentoCubit,
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
                                          processoEtapa.codEquipamento,
                                    )
                                    .firstOrNull;

                                List<EquipamentoModel> equipamentosAtivos =
                                    equipamentos
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList();

                                if (equipamento != null &&
                                    !equipamentosAtivos.contains(equipamento)) {
                                  equipamentosAtivos.add(equipamento);
                                }

                                return DropDownWidget<EquipamentoModel>(
                                  initialValue: equipamento,
                                  sourceList: equipamentosAtivos,
                                  onChanged: (value) =>
                                      processoEtapa.codEquipamento = value.cod!,
                                  placeholder: 'Equipamento',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<ArsenalEstoqueCubit,
                                ArsenalEstoqueState>(
                              bloc: arsenalEstoqueCubit,
                              builder: (context, arsenaisState) {
                                if (arsenaisState.loading) {
                                  return const LoadingWidget();
                                }
                                List<ArsenalEstoqueModel> arsenaisEstoques =
                                    arsenaisState.arsenaisEstoques;

                                ArsenalEstoqueModel? arsenalEstoque =
                                    arsenaisEstoques
                                        .where(
                                          (element) =>
                                              element.cod ==
                                              processoEtapa.codEstoque,
                                        )
                                        .firstOrNull;
                                List<ArsenalEstoqueModel>
                                    arsenaisEstoquesAtivos = arsenaisEstoques
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList();

                                if (arsenalEstoque != null &&
                                    !arsenaisEstoquesAtivos
                                        .contains(arsenalEstoque)) {
                                  arsenaisEstoquesAtivos.add(arsenalEstoque);
                                }

                                return DropDownWidget<ArsenalEstoqueModel>(
                                  initialValue: arsenalEstoque,
                                  sourceList: arsenaisEstoquesAtivos,
                                  onChanged: (value) =>
                                      processoEtapa.codEstoque = value.cod!,
                                  placeholder: 'Arsenal',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtDescricao,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtEtiquetaPreparo,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtTempoCicloProcesso,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.exigeLeituraEntrada,
                                onClick: (value) =>
                                    processoEtapa.exigeLeituraEntrada = value,
                                text: 'Exige Leitura Entrada',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.exigeLeituraSaida,
                                onClick: (value) =>
                                    processoEtapa.exigeLeituraSaida = value,
                                text: 'Exige Leitura Saída',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.exigeTesteIndicador,
                                onClick: (value) {
                                  setState(() {
                                    processoEtapa.exigeTesteIndicador = value;
                                  });
                                },
                                text: 'Teste Indicador Obrigatório',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.exigeTesteBiologico,
                                onClick: (value) {
                                  setState(() {
                                    processoEtapa.exigeTesteBiologico = value;
                                  });
                                },
                                text:
                                    'Teste Biológico Obrigatório (Implantável)',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.usuarioColocaNaoRetira,
                                onClick: (value) => processoEtapa
                                    .usuarioColocaNaoRetira = value,
                                text: 'Usuário Coloca Não Retira',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.imprimirEtiquetaLote,
                                onClick: (value) {
                                  setState(() {
                                    processoEtapa.imprimirEtiquetaLote = value;
                                  });
                                },
                                text: 'Imprime Etiqueta de Lote',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.exigeEpcSaida,
                                onClick: (value) =>
                                    processoEtapa.exigeEpcSaida = value,
                                text: 'Exige Uso de EPC na Leitura de Saída',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.recebe,
                                onClick: (value) =>
                                    processoEtapa.recebe = value,
                                text: 'Recebe',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked:
                                    processoEtapa.relatorioRetiradaMateriais,
                                onClick: (value) => processoEtapa
                                    .relatorioRetiradaMateriais = value,
                                text: 'Relatório Retirada de Materiais',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked:
                                    processoEtapa.responsavelLocalNaoCompativel,
                                onClick: (value) => processoEtapa
                                    .responsavelLocalNaoCompativel = value,
                                text:
                                    'Solicita Responsável Local não compatível',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.integradorKit,
                                onClick: (value) =>
                                    processoEtapa.integradorKit = value,
                                text: 'Solicita Integrador',
                                align: MainAxisAlignment.start,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked:
                                    processoEtapa.conferenciaVisualPermitida,
                                onClick: (value) => processoEtapa
                                    .conferenciaVisualPermitida = value,
                                text: 'Conferencia Visual Permitida',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.liberaKitIncompleto,
                                onClick: (value) =>
                                    processoEtapa.liberaKitIncompleto = value,
                                text: 'Libera Kit Incompleto',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.autorizaQuebraFluxo,
                                onClick: (value) =>
                                    processoEtapa.autorizaQuebraFluxo = value,
                                text: 'Permite Quebra de Fluxo sob Autorização',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.preparo,
                                onClick: (value) {
                                  setState(() {
                                    processoEtapa.preparo = value;
                                  });
                                },
                                text: 'Disponibiliza  Funções de Preparo',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.areaEsteril,
                                onClick: (value) =>
                                    processoEtapa.areaEsteril = value,
                                text: 'Etapa está em Área Estéril',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.exigeEpcEntrada,
                                onClick: (value) =>
                                    processoEtapa.exigeEpcEntrada = value,
                                text: 'Exige Uso de EPC na Leitura de Entrada',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.transfere,
                                onClick: (value) =>
                                    processoEtapa.transfere = value,
                                text: 'Transfere',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.solicitacaoCirculante,
                                onClick: (value) =>
                                    processoEtapa.solicitacaoCirculante = value,
                                text: 'Solicita Circulante',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.pacote,
                                onClick: (value) =>
                                    processoEtapa.pacote = value,
                                text: 'Pacotes',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              Visibility(
                                visible: false,
                                child: CustomCheckboxWidget(
                                  checked: processoEtapa.pacote,
                                  onClick: (value) =>
                                      processoEtapa.pacote = value,
                                  text: 'Pacotes',
                                  align: MainAxisAlignment.start,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked:
                                    processoEtapa.naoAlterarStatusItemPendente,
                                onClick: (value) => processoEtapa
                                    .naoAlterarStatusItemPendente = value,
                                text: 'Status Conferência (Sem Leitura)',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              CustomCheckboxWidget(
                                checked: processoEtapa.ativo,
                                onClick: (value) => processoEtapa.ativo = value,
                                text: 'Ativo',
                                align: MainAxisAlignment.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (processoEtapa.exigeTesteIndicador == true) ...{
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomCheckboxWidget(
                                  checked: processoEtapa.testeIndicadorEntrada,
                                  onClick: (value) => processoEtapa
                                      .testeIndicadorEntrada = value,
                                  text: 'Teste Indicador Entrada',
                                  align: MainAxisAlignment.start,
                                ),
                              ),
                              Expanded(
                                child: CustomCheckboxWidget(
                                  checked: processoEtapa.testeIndicadorSaida,
                                  onClick: (value) =>
                                      processoEtapa.testeIndicadorSaida = value,
                                  text: 'Teste Indicador Saída',
                                  align: MainAxisAlignment.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    },
                    const Padding(padding: EdgeInsets.only(top: 5.0)),
                    if (processoEtapa.exigeTesteBiologico == true) ...{
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckboxWidget(
                                      checked:
                                          processoEtapa.testeBiologicoEntrada,
                                      onClick: (value) => processoEtapa
                                          .testeBiologicoEntrada = value,
                                      text: 'Teste Biológico Entrada',
                                      align: MainAxisAlignment.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckboxWidget(
                                      checked:
                                          processoEtapa.testeBiologicoSaida,
                                      onClick: (value) => processoEtapa
                                          .testeBiologicoSaida = value,
                                      text: 'Teste Biológico Saída',
                                      align: MainAxisAlignment.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                                left: 8.0,
                                bottom: 8.0,
                                right: 8.0,
                              ),
                              child: BlocBuilder<ServicoTipoCubit,
                                  ServicoTipoState>(
                                bloc: servicoTipoCubit,
                                builder: (context, state) {
                                  List<ServicoTipoModel> servicosTipos =
                                      state.tiposServico;

                                  ServicoTipoModel? servicoTipo = servicosTipos
                                      .where(
                                        (element) =>
                                            element.cod ==
                                            processoEtapa.codServicoTipo,
                                      )
                                      .firstOrNull;
                                  return DropDownWidget<ServicoTipoModel>(
                                    initialValue: servicoTipo,
                                    sourceList: servicosTipos,
                                    onChanged: (value) => processoEtapa
                                        .codServicoTipo = value.cod!,
                                    placeholder: 'Tipo Serviço',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                    const Padding(padding: EdgeInsets.only(top: 5.0)),
                    if (processoEtapa.imprimirEtiquetaLote == true) ...{
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckboxWidget(
                                      checked: processoEtapa.etiquetaEntrada,
                                      onClick: (value) =>
                                          processoEtapa.etiquetaEntrada = value,
                                      text: 'Etiqueta Lote Entrada',
                                      align: MainAxisAlignment.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckboxWidget(
                                      checked: processoEtapa.etiquetaSaida,
                                      onClick: (value) =>
                                          processoEtapa.etiquetaSaida = value,
                                      text: 'Etiqueta Lote Saída',
                                      align: MainAxisAlignment.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckboxWidget(
                                      checked:
                                          processoEtapa.exigeLoteEquipamento,
                                      onClick: (value) => processoEtapa
                                          .exigeLoteEquipamento = value,
                                      text: 'Exige Lote Equipamento',
                                      align: MainAxisAlignment.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                                left: 8.0,
                                bottom: 8.0,
                                right: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: BlocBuilder<ArsenalEstoqueCubit,
                                        ArsenalEstoqueState>(
                                      bloc: arsenalEstoqueCubit,
                                      builder: (context, arsenaisState) {
                                        if (arsenaisState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<ArsenalEstoqueModel>
                                            arsenaisEstoques =
                                            arsenaisState.arsenaisEstoques;

                                        ArsenalEstoqueModel? arsenalEstoque =
                                            arsenaisEstoques
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      processoEtapa
                                                          .codEstoqueAut,
                                                )
                                                .firstOrNull;
                                        return DropDownWidget<
                                            ArsenalEstoqueModel>(
                                          initialValue: arsenalEstoque,
                                          sourceList: arsenaisEstoques,
                                          onChanged: (value) => processoEtapa
                                              .codEstoqueAut = value.cod,
                                          placeholder: 'Arsenal',
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                    const Padding(padding: EdgeInsets.only(top: 5.0)),
                    if (processoEtapa.preparo == true) ...{
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: processoEtapa
                                    .permiteLiberacaoDataMatrixComCrachaPreparo,
                                onClick: (value) => processoEtapa
                                        .permiteLiberacaoDataMatrixComCrachaPreparo =
                                    value,
                                text:
                                    'Permite liberação do Data Matrix com Crachá',
                                align: MainAxisAlignment.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    },
                    const Padding(padding: EdgeInsets.only(top: 24)),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: items,
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
                          processoEtapa = ProcessoEtapaModel.empty();
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

  List<CustomPopupItemModel> _getItems() {
    List<CustomPopupItemModel> items = [];
    items.add(
      CustomPopupItemModel(
        text: 'Imprimir Funções',
        onTap: imprimirFuncoes,
      ),
    );
    if (processoEtapa.exigeTesteBiologico == true ||
        processoEtapa.exigeTesteIndicador == true) {
      items.add(
        CustomPopupItemModel(
          text: 'Imprimir Indicador',
          onTap: imprimirIndicador,
        ),
      );
    }
    items.add(
      CustomPopupItemHistoryModel.getHistoryItem(),
    );
    return items;
  }

  Future imprimirFuncoes() async {
    if (processoEtapa.cod == null || processoEtapa.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário que a etapa esteja cadastrada para imprimir suas funções',
      );
      return;
    }
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoEtapaPageFrmImprimirFuncoesPage(
          stageCod: processoEtapa.cod!,
        );
      },
    );
  }

  Future imprimirIndicador() async {
    if (processoEtapa.cod == null || processoEtapa.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário que a etapa esteja cadastrada para imprimir suas funções',
      );
      return;
    }
    if (processoEtapa.codInstituicao == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário que a etapa esteja com uma Instituição configurada para imprimir os indicadores',
      );
      return;
    }
    if (processoEtapa.exigeTesteIndicador != true &&
        processoEtapa.exigeTesteBiologico != true) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário que a etapa esteja com ou Teste Indicador ou Teste Biológico para imprimir os indicadores',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);
    StageIndicatorPrinterController controller =
        StageIndicatorPrinterController(
      context: context,
      stageIndicatorPrint: StageIndicatorPrintDTO(
        instituitionCod: processoEtapa.codInstituicao!,
      ),
    );
    loading.close(context, mounted);
    await controller.print();
  }

  void salvar() {
    if (!txtNome.valid ||
        !txtDescricao.valid ||
        !txtEtiquetaPreparo.valid ||
        !txtTempoCicloProcesso.valid) return;

    if (processoEtapa.codEquipamento == null &&
        processoEtapa.codEstoque == null) {
      ErrorUtils.showErrorDialog(context, [
        'É obrigatório a seleção do Equipamento ou Arsenal vinculados a Etapa de Processo. Campo Obrigatório não preenchido',
      ]);
      return;
    }

    cubit.save(processoEtapa);
  }
}
