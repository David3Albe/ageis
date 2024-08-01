import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_tipo/processo_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/quantidade_indicadores/quantidade_indicadores_page_frm.dart';
import 'package:ageiscme_data/services/processo_etapa/processo_etapa_service.dart';
import 'package:ageiscme_impressoes/dto/stage_indicator_print/stage_indicator_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_indicator_printer/stage_indicator_printer_controller.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrm extends StatefulWidget {
  const ProcessoEtapaPageFrm({
    Key? key,
    required this.processoEtapa,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final ProcessoEtapaModel processoEtapa;
  final void Function(String) onSaved;
  final void Function() onCancel;

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
    placeholder: 'Nome *',
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
    placeholder: 'Tempo Ciclo Preparo (Minutos) *',
    onChanged: (String? str) {
      processoEtapa.tempoCicloProcesso = str == null || str.isEmpty
          ? null
          : int.parse(txtTempoCicloProcesso.text);
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

  late Function() validateTipoProcesso;
  late Function() validateServicoTipo;
  final ScrollController scroll = ScrollController();

  Function(ProcessoTipoModel?)? setTipoProcesso;
  Function(EquipamentoModel?)? setEquipamento;
  Function(ArsenalEstoqueModel?)? setArsenal;
  Function(ServicoTipoModel?)? setServicoTipo;
  Function(bool)? setExigeLeituraEntrada;
  Function(bool)? setExigeUsoEpcEntrada;
  Function(bool)? setExigeLeituraSaida;
  Function(bool)? setExigeUsoEpcSaida;
  Function(bool)? setTesteIndicadorObrigatorio;
  Function(bool)? setTesteBiologico;
  Function(bool)? setTesteBiologicoEntrada;
  Function(bool)? setTesteBiologicoSaida;
  Function(bool)? setUsuarioColocaNaoRetira;
  Function(bool)? setImprimeEtiquetaLote;
  Function(bool)? setRelatorioRetiradaMateriais;
  Function(bool)? setUsuarioLocalNaoCompativel;
  Function(bool)? setSolicitaIntegrador;
  Function(bool)? setConferenciaVisual;
  Function(bool)? setLiberaKitIncompleto;
  Function(bool)? setPermiteQuebraFluxoSobAutorizacao;
  Function(bool)? setPreparo;
  Function(bool)? setEtapaEmAreaEsteril;
  Function(bool)? setTransfere;
  Function(bool)? setRecebe;
  Function(bool)? setSolicitaCirculante;
  Function(bool)? setPacote;
  Function(bool)? setStatusConferenciaSemLeitura;
  Function(bool)? setAtivo;
  Function(bool)? setTesteIndicadorEntrada;
  Function(bool)? setTesteIndicadorSaida;
  Function(bool)? setEtiquetaLoteEntrada;
  Function(bool)? setEtiquetaLoteSaida;
  Function(bool)? setExigeLoteEquipamento;
  Function(ArsenalEstoqueModel?)? setArsenalLote;
  Function(bool)? setPermiteLiberacaoCracha;

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProcessoEtapaPageFrmCubit, ProcessoEtapaPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: titulo,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: size.width * .5,
                        minHeight: size.height * .5,
                        maxHeight: size.height * .95,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<ProcessoTipoCubit,
                                  ProcessoTipoState>(
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
                                  ProcessoTipoModel? processoTipo =
                                      processosTipos
                                          .where(
                                            (element) =>
                                                element.cod ==
                                                processoEtapa.codProcessoTipo,
                                          )
                                          .firstOrNull;
                                  return DropDownSearchWidget<
                                      ProcessoTipoModel>(
                                    setSelectedItemBuilder: (
                                      context,
                                      setSelectedItemMethod,
                                    ) =>
                                        setTipoProcesso = setSelectedItemMethod,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            validateTipoProcesso =
                                                validateMethodBuilder,
                                    initialValue: processoTipo,
                                    sourceList: processosTipos
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList(),
                                    onChanged: (value) => processoEtapa
                                        .codProcessoTipo = value?.cod,
                                    placeholder: 'Tipo Processo *',
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
                                    child: BlocBuilder<EquipamentoCubit,
                                        EquipamentoState>(
                                      bloc: equipamentoCubit,
                                      builder: (context, equipamentoState) {
                                        if (equipamentoState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<EquipamentoModel> equipamentos =
                                            equipamentoState.objs;

                                        EquipamentoModel? equipamento =
                                            equipamentos
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      processoEtapa
                                                          .codEquipamento,
                                                )
                                                .firstOrNull;

                                        List<EquipamentoModel>
                                            equipamentosAtivos = equipamentos
                                                .where(
                                                  (element) =>
                                                      element.ativo == true,
                                                )
                                                .toList();

                                        if (equipamento != null &&
                                            !equipamentosAtivos
                                                .contains(equipamento)) {
                                          equipamentosAtivos.add(equipamento);
                                        }

                                        return DropDownSearchWidget<
                                            EquipamentoModel>(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setEquipamento =
                                                  setSelectedItemMethod,
                                          initialValue: equipamento,
                                          sourceList: equipamentosAtivos,
                                          onChanged: (value) => processoEtapa
                                              .codEquipamento = value?.cod!,
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
                                        List<ArsenalEstoqueModel>
                                            arsenaisEstoques =
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
                                            arsenaisEstoquesAtivos =
                                            arsenaisEstoques
                                                .where(
                                                  (element) =>
                                                      element.ativo == true,
                                                )
                                                .toList();

                                        if (arsenalEstoque != null &&
                                            !arsenaisEstoquesAtivos
                                                .contains(arsenalEstoque)) {
                                          arsenaisEstoquesAtivos
                                              .add(arsenalEstoque);
                                        }

                                        return DropDownSearchWidget<
                                            ArsenalEstoqueModel>(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setArsenal =
                                                  setSelectedItemMethod,
                                          initialValue: arsenalEstoque,
                                          sourceList: arsenaisEstoquesAtivos,
                                          onChanged: (value) => processoEtapa
                                              .codEstoque = value?.cod,
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
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setExigeLeituraEntrada =
                                                setValueWidget,
                                        checked:
                                            processoEtapa.exigeLeituraEntrada,
                                        onClick: (value) {
                                          setState(() {
                                            processoEtapa.exigeLeituraEntrada =
                                                value;
                                          });
                                        },
                                        text: 'Exige Leitura Entrada',
                                        align: MainAxisAlignment.start,
                                      ),
                                      Visibility(
                                        visible:
                                            processoEtapa.exigeLeituraEntrada ==
                                                true,
                                        maintainState: true,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 2.0,
                                            left: 16,
                                          ),
                                          child: CustomCheckboxWidget(
                                            setValue: (
                                              context,
                                              setValueWidget,
                                            ) =>
                                                setExigeUsoEpcEntrada =
                                                    setValueWidget,
                                            checked:
                                                processoEtapa.exigeEpcEntrada,
                                            onClick: (value) => processoEtapa
                                                .exigeEpcEntrada = value,
                                            text:
                                                'Exige Uso de EPC na Leitura de Entrada',
                                            align: MainAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setExigeLeituraSaida =
                                                setValueWidget,
                                        checked:
                                            processoEtapa.exigeLeituraSaida,
                                        onClick: (value) {
                                          setState(() {
                                            processoEtapa.exigeLeituraSaida =
                                                value;
                                          });
                                        },
                                        text: 'Exige Leitura Saída',
                                        align: MainAxisAlignment.start,
                                      ),
                                      Visibility(
                                        visible:
                                            processoEtapa.exigeLeituraSaida ==
                                                true,
                                        maintainState: true,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 2.0,
                                            left: 16,
                                          ),
                                          child: CustomCheckboxWidget(
                                            setValue: (
                                              context,
                                              setValueWidget,
                                            ) =>
                                                setExigeUsoEpcSaida =
                                                    setValueWidget,
                                            checked:
                                                processoEtapa.exigeEpcSaida,
                                            onClick: (value) => processoEtapa
                                                .exigeEpcSaida = value,
                                            text:
                                                'Exige Uso de EPC na Leitura de Saída',
                                            align: MainAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setTesteIndicadorObrigatorio =
                                                setValueWidget,
                                        checked:
                                            processoEtapa.exigeTesteIndicador,
                                        onClick: (value) {
                                          setState(() {
                                            processoEtapa.exigeTesteIndicador =
                                                value;
                                          });
                                        },
                                        text: 'Teste Indicador Obrigatório',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setTesteBiologico = setValueWidget,
                                        checked:
                                            processoEtapa.exigeTesteBiologico,
                                        onClick: (value) {
                                          setState(() {
                                            processoEtapa.exigeTesteBiologico =
                                                value;
                                          });
                                        },
                                        text:
                                            'Teste Biológico Obrigatório (Implantável)',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setUsuarioColocaNaoRetira =
                                                setValueWidget,
                                        checked: processoEtapa
                                            .usuarioColocaNaoRetira,
                                        onClick: (value) => processoEtapa
                                            .usuarioColocaNaoRetira = value,
                                        text: 'Usuário Coloca Não Retira',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setImprimeEtiquetaLote =
                                                setValueWidget,
                                        checked:
                                            processoEtapa.imprimirEtiquetaLote,
                                        onClick: (value) {
                                          setState(() {
                                            processoEtapa.imprimirEtiquetaLote =
                                                value;
                                          });
                                        },
                                        text: 'Imprime Etiqueta de Lote',
                                        align: MainAxisAlignment.start,
                                      ),
                                      // const Padding(
                                      //   padding: EdgeInsets.only(top: 2.0),
                                      // ),
                                      // CustomCheckboxWidget(
                                      //   checked: processoEtapa.exigeEpcSaida,
                                      //   onClick: (value) =>
                                      //       processoEtapa.exigeEpcSaida = value,
                                      //   text:
                                      //       'Exige Uso de EPC na Leitura de Saída',
                                      //   align: MainAxisAlignment.start,
                                      // ),
                                      // const Padding(
                                      //   padding: EdgeInsets.only(top: 2.0),
                                      // ),
                                      Visibility(
                                        visible: false,
                                        child: CustomCheckboxWidget(
                                          setValue: (
                                            context,
                                            setValueWidget,
                                          ) =>
                                              setRecebe = setValueWidget,
                                          checked: processoEtapa.recebe,
                                          onClick: (value) =>
                                              processoEtapa.recebe = value,
                                          text: 'Recebe',
                                          align: MainAxisAlignment.start,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setRelatorioRetiradaMateriais =
                                                setValueWidget,
                                        checked: processoEtapa
                                            .relatorioRetiradaMateriais,
                                        onClick: (value) => processoEtapa
                                            .relatorioRetiradaMateriais = value,
                                        text: 'Relatório Retirada de Materiais',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setUsuarioLocalNaoCompativel =
                                                setValueWidget,
                                        checked: processoEtapa
                                            .responsavelLocalNaoCompativel,
                                        onClick: (value) => processoEtapa
                                                .responsavelLocalNaoCompativel =
                                            value,
                                        text:
                                            'Solicita Responsável Local não compatível',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setSolicitaIntegrador =
                                                setValueWidget,
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
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setConferenciaVisual =
                                                setValueWidget,
                                        checked: processoEtapa
                                            .conferenciaVisualPermitida,
                                        onClick: (value) => processoEtapa
                                            .conferenciaVisualPermitida = value,
                                        text: 'Conferencia Visual Permitida',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setLiberaKitIncompleto =
                                                setValueWidget,
                                        checked:
                                            processoEtapa.liberaKitIncompleto,
                                        onClick: (value) => processoEtapa
                                            .liberaKitIncompleto = value,
                                        text: 'Libera Kit Incompleto',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setPermiteQuebraFluxoSobAutorizacao =
                                                setValueWidget,
                                        checked:
                                            processoEtapa.autorizaQuebraFluxo,
                                        onClick: (value) => processoEtapa
                                            .autorizaQuebraFluxo = value,
                                        text:
                                            'Permite Quebra de Fluxo sob Autorização',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setPreparo = setValueWidget,
                                        checked: processoEtapa.preparo,
                                        onClick: (value) {
                                          setState(() {
                                            processoEtapa.preparo = value;
                                          });
                                        },
                                        text: 'Preparo',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setEtapaEmAreaEsteril =
                                                setValueWidget,
                                        checked: processoEtapa.areaEsteril,
                                        onClick: (value) =>
                                            processoEtapa.areaEsteril = value,
                                        text: 'Etapa está em Área Estéril',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      // CustomCheckboxWidget(
                                      //   checked: processoEtapa.exigeEpcEntrada,
                                      //   onClick: (value) => processoEtapa
                                      //       .exigeEpcEntrada = value,
                                      //   text:
                                      //       'Exige Uso de EPC na Leitura de Entrada',
                                      //   align: MainAxisAlignment.start,
                                      // ),
                                      // const Padding(
                                      //   padding: EdgeInsets.only(top: 2.0),
                                      // ),
                                      Visibility(
                                        visible: false,
                                        maintainState: false,
                                        child: CustomCheckboxWidget(
                                          setValue: (
                                            context,
                                            setValueWidget,
                                          ) =>
                                              setTransfere = setValueWidget,
                                          checked: processoEtapa.transfere,
                                          onClick: (value) =>
                                              processoEtapa.transfere = value,
                                          text: 'Transfere',
                                          align: MainAxisAlignment.start,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setSolicitaCirculante =
                                                setValueWidget,
                                        checked:
                                            processoEtapa.solicitacaoCirculante,
                                        onClick: (value) => processoEtapa
                                            .solicitacaoCirculante = value,
                                        text: 'Solicita Circulante',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),

                                      Visibility(
                                        visible: false,
                                        child: CustomCheckboxWidget(
                                          setValue: (
                                            context,
                                            setValueWidget,
                                          ) =>
                                              setPacote = setValueWidget,
                                          checked: processoEtapa.pacote,
                                          onClick: (value) =>
                                              processoEtapa.pacote = value,
                                          text: 'Pacotes',
                                          align: MainAxisAlignment.start,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setStatusConferenciaSemLeitura =
                                                setValueWidget,
                                        checked: processoEtapa
                                            .naoAlterarStatusItemPendente,
                                        onClick: (value) => processoEtapa
                                                .naoAlterarStatusItemPendente =
                                            value,
                                        text:
                                            'Status Conferência (Sem Leitura)',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                      ),
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setAtivo = setValueWidget,
                                        checked: processoEtapa.ativo,
                                        onClick: (value) =>
                                            processoEtapa.ativo = value,
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
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomCheckboxWidget(
                                          setValue: (
                                            context,
                                            setValueWidget,
                                          ) =>
                                              setTesteIndicadorEntrada =
                                                  setValueWidget,
                                          checked: processoEtapa
                                              .testeIndicadorEntrada,
                                          onClick: (value) => processoEtapa
                                              .testeIndicadorEntrada = value,
                                          text: 'Teste Indicador Entrada',
                                          align: MainAxisAlignment.start,
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomCheckboxWidget(
                                          setValue: (
                                            context,
                                            setValueWidget,
                                          ) =>
                                              setTesteIndicadorSaida =
                                                  setValueWidget,
                                          checked:
                                              processoEtapa.testeIndicadorSaida,
                                          onClick: (value) => processoEtapa
                                              .testeIndicadorSaida = value,
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
                                              setValue: (
                                                context,
                                                setValueWidget,
                                              ) =>
                                                  setTesteBiologicoEntrada =
                                                      setValueWidget,
                                              checked: processoEtapa
                                                  .testeBiologicoEntrada,
                                              onClick: (value) => processoEtapa
                                                      .testeBiologicoEntrada =
                                                  value,
                                              text: 'Teste Biológico Entrada',
                                              align: MainAxisAlignment.start,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomCheckboxWidget(
                                              setValue: (
                                                context,
                                                setValueWidget,
                                              ) =>
                                                  setTesteBiologicoSaida =
                                                      setValueWidget,
                                              checked: processoEtapa
                                                  .testeBiologicoSaida,
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
                                          if (state.loading == true) {
                                            return const Center(
                                              child: LoadingWidget(),
                                            );
                                          }
                                          List<ServicoTipoModel> servicosTipos =
                                              state.tiposServico;

                                          ServicoTipoModel? servicoTipo =
                                              servicosTipos
                                                  .where(
                                                    (element) =>
                                                        element.cod ==
                                                        processoEtapa
                                                            .codServicosTipo,
                                                  )
                                                  .firstOrNull;
                                          return DropDownSearchWidget<
                                              ServicoTipoModel>(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setServicoTipo =
                                                    setSelectedItemMethod,
                                            validateBuilder: (
                                              context,
                                              validateMethodBuilder,
                                            ) =>
                                                validateServicoTipo =
                                                    validateMethodBuilder,
                                            validator: (val) => val == null
                                                ? 'Obrigatório'
                                                : null,
                                            initialValue: servicoTipo,
                                            sourceList: servicosTipos,
                                            onChanged: (value) {
                                              processoEtapa.servicoTipo = value;
                                              processoEtapa.codServicosTipo =
                                                  value?.cod;
                                            },
                                            placeholder: 'Tipo Serviço *',
                                            textFunction: (p0) =>
                                                p0.GetDropDownText(),
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
                                              setValue: (
                                                context,
                                                setValueWidget,
                                              ) =>
                                                  setEtiquetaLoteEntrada =
                                                      setValueWidget,
                                              checked:
                                                  processoEtapa.etiquetaEntrada,
                                              onClick: (value) => processoEtapa
                                                  .etiquetaEntrada = value,
                                              text: 'Etiqueta Lote Entrada',
                                              align: MainAxisAlignment.start,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomCheckboxWidget(
                                              setValue: (
                                                context,
                                                setValueWidget,
                                              ) =>
                                                  setEtiquetaLoteSaida =
                                                      setValueWidget,
                                              checked:
                                                  processoEtapa.etiquetaSaida,
                                              onClick: (value) => processoEtapa
                                                  .etiquetaSaida = value,
                                              text: 'Etiqueta Lote Saída',
                                              align: MainAxisAlignment.start,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomCheckboxWidget(
                                              setValue: (
                                                context,
                                                setValueWidget,
                                              ) =>
                                                  setExigeLoteEquipamento =
                                                      setValueWidget,
                                              checked: processoEtapa
                                                  .exigeLoteEquipamento,
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
                                            child: BlocBuilder<
                                                ArsenalEstoqueCubit,
                                                ArsenalEstoqueState>(
                                              bloc: arsenalEstoqueCubit,
                                              builder:
                                                  (context, arsenaisState) {
                                                if (arsenaisState.loading) {
                                                  return const LoadingWidget();
                                                }
                                                List<ArsenalEstoqueModel>
                                                    arsenaisEstoques =
                                                    arsenaisState
                                                        .arsenaisEstoques;

                                                ArsenalEstoqueModel?
                                                    arsenalEstoque =
                                                    arsenaisEstoques
                                                        .where(
                                                          (element) =>
                                                              element.cod ==
                                                              processoEtapa
                                                                  .codEstoqueAut,
                                                        )
                                                        .firstOrNull;
                                                return DropDownSearchWidget<
                                                    ArsenalEstoqueModel>(
                                                  setSelectedItemBuilder: (
                                                    context,
                                                    setSelectedItemMethod,
                                                  ) =>
                                                      setArsenalLote =
                                                          setSelectedItemMethod,
                                                  initialValue: arsenalEstoque,
                                                  sourceList: arsenaisEstoques,
                                                  onChanged: (value) =>
                                                      processoEtapa
                                                              .codEstoqueAut =
                                                          value?.cod,
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
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Row(
                                    children: [
                                      CustomCheckboxWidget(
                                        setValue: (
                                          context,
                                          setValueWidget,
                                        ) =>
                                            setPermiteLiberacaoCracha =
                                                setValueWidget,
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
                  ),
                ],
              ),
            ),
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
                    onPressed: limpar,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CancelButtonUnfilledWidget(
                    onPressed: widget.onCancel,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void limpar() {
    setState(() {
      processoEtapa.cod = 0;
      processoEtapa.codProcessoTipo = 0;
      processoEtapa.codEquipamento = null;
      processoEtapa.codEstoque = null;
      processoEtapa.tempoCicloProcesso = 0;
      processoEtapa.codServicosTipo = 0;
      processoEtapa.codEstoqueAut = 0;
      processoEtapa.nome = '';
      processoEtapa.descricao = '';
      processoEtapa.descricaoEtiquetaPreparo = null;
      processoEtapa.localizacaoX = 0;
      processoEtapa.localizacaoY = 0;
      processoEtapa.liberaKitIncompleto = false;
      processoEtapa.exigeLeituraEntrada = false;
      processoEtapa.exigeLeituraSaida = false;
      processoEtapa.usuarioColocaNaoRetira = false;
      processoEtapa.conferenciaVisualPermitida = false;
      processoEtapa.imprimirEtiquetaLote = false;
      processoEtapa.ativo = true;
      processoEtapa.autorizaQuebraFluxo = false;
      processoEtapa.exigeTesteIndicador = false;
      processoEtapa.preparo = false;
      processoEtapa.areaEsteril = false;
      processoEtapa.exigeEpcEntrada = false;
      processoEtapa.exigeEpcSaida = false;
      processoEtapa.flag1 = false;
      processoEtapa.flag2 = false;
      processoEtapa.transfere = false;
      processoEtapa.recebe = false;
      processoEtapa.testeIndicadorEntrada = false;
      processoEtapa.etiquetaSaida = false;
      processoEtapa.etiquetaEntrada = false;
      processoEtapa.testeIndicadorSaida = false;
      processoEtapa.exigeLoteEquipamento = false;
      processoEtapa.responsavelLocalNaoCompativel = false;
      processoEtapa.exigeTesteBiologico = false;
      processoEtapa.biologicoEntrada = false;
      processoEtapa.biologicoEntrada = false;
      processoEtapa.biologicoSaida = false;
      processoEtapa.testeBiologicoEntrada = false;
      processoEtapa.testeBiologicoSaida = false;
      processoEtapa.pacote = false;
      processoEtapa.relatorioRetiradaMateriais = false;
      processoEtapa.naoAlterarStatusItemPendente = false;
      processoEtapa.integradorKit = false;
      processoEtapa.solicitacaoCirculante = false;
      processoEtapa.ultimaAlteracao = null;
      processoEtapa.tstamp = null;
      processoEtapa.tipoProcesso = null;
      processoEtapa.equipamento = null;
      processoEtapa.arsenal = null;
      processoEtapa.servicoTipo = null;
      processoEtapa.permiteLiberacaoDataMatrixComCrachaPreparo = false;
      processoEtapa.sequencias = null;
    });
    if (setTipoProcesso != null) setTipoProcesso!(null);
    if (setEquipamento != null) setEquipamento!(null);
    if (setArsenal != null) setArsenal!(null);
    if (setServicoTipo != null) setServicoTipo!(null);
    if (setExigeLeituraEntrada != null) setExigeLeituraEntrada!(false);
    if (setExigeUsoEpcEntrada != null) setExigeLeituraEntrada!(false);
    if (setExigeLeituraSaida != null) setExigeLeituraSaida!(false);
    if (setExigeUsoEpcSaida != null) setExigeUsoEpcSaida!(false);
    if (setTesteIndicadorObrigatorio != null) {
      setTesteIndicadorObrigatorio!(false);
    }
    if (setTesteBiologico != null) setTesteBiologico!(false);
    if (setTesteBiologicoEntrada != null) setTesteBiologicoEntrada!(false);
    if (setTesteBiologicoSaida != null) setTesteBiologicoSaida!(false);
    if (setUsuarioColocaNaoRetira != null) setUsuarioColocaNaoRetira!(false);
    if (setImprimeEtiquetaLote != null) setImprimeEtiquetaLote!(false);
    if (setRelatorioRetiradaMateriais != null) {
      setRelatorioRetiradaMateriais!(false);
    }
    if (setUsuarioLocalNaoCompativel != null) {
      setUsuarioLocalNaoCompativel!(false);
    }
    if (setSolicitaIntegrador != null) setSolicitaIntegrador!(false);
    if (setConferenciaVisual != null) setConferenciaVisual!(false);
    if (setLiberaKitIncompleto != null) setLiberaKitIncompleto!(false);
    if (setPermiteQuebraFluxoSobAutorizacao != null) {
      setPermiteQuebraFluxoSobAutorizacao!(false);
    }
    if (setPreparo != null) setPreparo!(false);
    if (setEtapaEmAreaEsteril != null) setEtapaEmAreaEsteril!(false);
    if (setTransfere != null) setTransfere!(false);
    if (setRecebe != null) setRecebe!(false);
    if (setSolicitaCirculante != null) setSolicitaCirculante!(false);
    if (setPacote != null) setPacote!(false);
    if (setStatusConferenciaSemLeitura != null) {
      setStatusConferenciaSemLeitura!(false);
    }
    if (setAtivo != null) setAtivo!(true);
    if (setTesteIndicadorEntrada != null) setTesteIndicadorEntrada!(false);
    if (setTesteIndicadorSaida != null) setTesteIndicadorSaida!(false);
    if (setEtiquetaLoteEntrada != null) setEtiquetaLoteEntrada!(false);
    if (setEtiquetaLoteSaida != null) setEtiquetaLoteSaida!(false);
    if (setExigeLoteEquipamento != null) setExigeLoteEquipamento!(false);
    if (setArsenalLote != null) setArsenalLote!(null);
    if (setPermiteLiberacaoCracha != null) setPermiteLiberacaoCracha!(false);
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
    if (processoEtapa.cod != null && processoEtapa.cod != 0) {
      items.add(
        CustomPopupItemHistoryModel.getHistoryItem(
          title: 'Etapa de Processo ${processoEtapa.cod}',
          child: HistoricoPage(
            pk: processoEtapa.cod!,
            termo: 'PROCESSO_ETAPA',
          ),
          context: context,
        ),
      );
    }
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
    (bool, int?)? result = await showDialog<(bool, int?)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const QuantidadeIndicadoresPageFrm();
      },
    );
    if (result == null || !result.$1) return;
    int? indicadores = result.$2;
    if (indicadores == null || indicadores == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'Informe a quantidade de indicadores que deseja imprimir',
      );
      return;
    }

    if (indicadores > 100) {
      ToastUtils.showCustomToastWarning(
        context,
        'É possível imprimir até 100 indicadores por vez',
      );
      return;
    }

    LoadingController loading = LoadingController(context: context);
    StageIndicatorPrinterController controller =
        StageIndicatorPrinterController(
      context: context,
      stageIndicatorPrint: StageIndicatorPrintDTO(
        instituitionCod: processoEtapa.codInstituicao!,
        quantity: indicadores,
      ),
    );
    loading.close(context, mounted);
    await controller.print();
  }

  void salvar() {
    bool nomeValid = txtNome.valid;
    bool descricaoValid = txtDescricao.valid;
    bool etiquetaPreparoValid = txtEtiquetaPreparo.valid;
    bool tempoCicloValid = txtTempoCicloProcesso.valid;
    bool tipoProcessoValid = validateTipoProcesso();
    bool servicoTipoValid = true;
    if (processoEtapa.exigeTesteBiologico == true) {
      servicoTipoValid = validateServicoTipo();
    }

    if (!tipoProcessoValid) {
      scroll.jumpTo(0);
    } else if (!nomeValid) {
      scroll.jumpTo(50);
    } else if (!tempoCicloValid || !etiquetaPreparoValid) {
      scroll.jumpTo(200);
    } else if (!servicoTipoValid) {
      scroll.jumpTo(350);
    }

    if (!nomeValid ||
        !descricaoValid ||
        !etiquetaPreparoValid ||
        !tempoCicloValid ||
        !tipoProcessoValid ||
        !servicoTipoValid) return;

    if (processoEtapa.codEquipamento == null &&
        processoEtapa.codEstoque == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário selecionar um Arsenal ou Um Equipamento',
      );
      return;
    }

    if (processoEtapa.codEquipamento != null &&
        processoEtapa.codEstoque != null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Apenas um Arsenal ou um Equipamento pode ser selecionado',
      );
      return;
    }

    cubit.save(processoEtapa, widget.onSaved);
  }
}
