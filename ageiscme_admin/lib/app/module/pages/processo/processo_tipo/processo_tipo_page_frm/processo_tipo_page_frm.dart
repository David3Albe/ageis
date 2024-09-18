// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo/processo_tipo_page_frm/processo_tipo_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_fluxo/presenter/processo_tipo_fluxo_page_presenter.dart';
import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/filters/processo_tipo/processo_tipo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoTipoPageFrm extends StatefulWidget {
  const ProcessoTipoPageFrm({
    Key? key,
    required this.processoTipo,
    required this.processoEtapaCubit,
    required this.onCancel,
    required this.onSaved,
  }) : super(key: key);

  final ProcessoTipoModel processoTipo;
  final ProcessoEtapaCubit processoEtapaCubit;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<ProcessoTipoPageFrm> createState() =>
      _ProcessoTipoPageFrmState(processoTipo: processoTipo);
}

class _ProcessoTipoPageFrmState extends State<ProcessoTipoPageFrm> {
  _ProcessoTipoPageFrmState({required this.processoTipo});
  late String titulo;
  ProcessoTipoModel processoTipo;
  late final ProcessoTipoPageFrmCubit cubit = ProcessoTipoPageFrmCubit(
    processoTipoModel: processoTipo,
    service: ProcessoTipoService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      processoTipo.nome = txtNome.text;
    },
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      processoTipo.descricao = txtDescricao.text;
    },
  );
  late bool Function() validateLimiteVigencia;
  late final DatePickerWidget dtpLimiteVigencia = DatePickerWidget(
    validator: (date) => date == null ? 'Obrigatório' : null,
    validateBuilder: (context, validateMethodBuilder) =>
        validateLimiteVigencia = validateMethodBuilder,
    placeholder: 'Limite Vigência *',
    initialValue: processoTipo.limiteVigencia,
    onDateSelected: (value) => processoTipo.limiteVigencia = value,
  );
  late final TextFieldStringWidget txtPrazovalidade = TextFieldStringWidget(
    placeholder: 'Prazo Validade para Itens Processados (dias) *',
    onChanged: (String? str) {
      processoTipo.prazoValidade = int.parse(txtPrazovalidade.text);
    },
  );

  late bool Function() validateNivelPrioridade;
  @override
  void initState() {
    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });

    txtDescricao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtPrazovalidade.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigátorio';
      } else if (str.length > 10) {
        return 'Pode ter no máximo 10 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNome.text =
        processoTipo.nome == null ? '' : processoTipo.nome.toString();
    txtDescricao.text =
        processoTipo.descricao == null ? '' : processoTipo.descricao.toString();

    txtPrazovalidade.text = processoTipo.prazoValidade == 0
        ? ''
        : processoTipo.prazoValidade.toString();

    titulo = 'Cadastro de Tipos de Processos';
    if (processoTipo.ativo == null) processoTipo.ativo = false;
    if (processoTipo.cod != 0) {
      titulo =
          'Edição do Tipo de Processo: ${processoTipo.cod} - ${processoTipo.nome}';
    }
  }

  final ScrollController scroll = ScrollController();

  late void Function(ProcessoEtapaModel?) setEtapa;
  late void Function(ProcessoTipoPrioriodadeOption?) setPrioridade;

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProcessoTipoPageFrmCubit, ProcessoTipoPageFrmState>(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: size.width * .5,
                        minHeight: size.height * .5,
                        maxHeight: size.height * .8,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: txtNome,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<ProcessoEtapaCubit,
                                  ProcessoEtapaState>(
                                bloc: widget.processoEtapaCubit,
                                builder: (context, state) {
                                  if (state.loading) {
                                    return const LoadingWidget();
                                  }
                                  List<ProcessoEtapaModel> processosEtapas =
                                      state.processosEtapas;

                                  processosEtapas.sort(
                                    (a, b) => a.tipoProcesso!.nome
                                        .compareTo(b.tipoProcesso!.nome),
                                  );

                                  return DropDownSearchWidget<
                                      ProcessoEtapaModel>(
                                    setSelectedItemBuilder:
                                        (context, setSelectedItemMethod) =>
                                            setEtapa = setSelectedItemMethod,
                                    initialValue: processoTipo.etapaInicial,
                                    textFunction: (processoEtapa) =>
                                        processoEtapa.GetNomeEtapaTipoText(),
                                    sourceList: processosEtapas,
                                    onChanged: (value) {
                                      processoTipo.codEtapaProcessoInicial =
                                          value?.cod;
                                      processoTipo.etapaInicial = value;
                                    },
                                    placeholder: 'Etapa Inicial',
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtDescricao,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: DropDownSearchWidget<
                                  ProcessoTipoPrioriodadeOption>(
                                setSelectedItemBuilder:
                                    (context, setSelectedItemMethod) =>
                                        setPrioridade = setSelectedItemMethod,
                                textFunction: (p0) => p0.GetDropDownText(),
                                validator: (obj) =>
                                    obj == null ? 'Obrigatório' : null,
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    validateNivelPrioridade =
                                        validateMethodBuilder,
                                initialValue: ProcessoTipoPrioriodadeOption
                                    .prioridadeOptions
                                    .where(
                                      (element) =>
                                          element.cod.toString() ==
                                          processoTipo.nivelPrioridade,
                                    )
                                    .firstOrNull,
                                sourceList: ProcessoTipoPrioriodadeOption
                                    .prioridadeOptions,
                                onChanged: (value) =>
                                    processoTipo.nivelPrioridade =
                                        value?.cod.toString() ?? '',
                                placeholder: 'Nível Prioridade *',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtPrazovalidade,
                                  ),
                                  const SizedBox(width: 24.0),
                                  Expanded(
                                    child: dtpLimiteVigencia,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  CustomCheckboxWidget(
                                    checked: processoTipo.ativo,
                                    onClick: (value) =>
                                        processoTipo.ativo = value,
                                    text: 'Ativo',
                                  ),
                                ],
                              ),
                            ),
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
                  items: [
                    if (processoTipo.cod != null && processoTipo.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Tipo de Processo ${processoTipo.cod}',
                        child: HistoricoPage(
                          pk: processoTipo.cod!,
                          termo: 'PROCESSO_TIPO',
                        ),
                        context: context,
                      ),
                    CustomPopupItemModel(
                      text: 'Fluxo',
                      onTap: abrirFluxo,
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: UpdateButtonWidget(
                    readonly: processoTipo.cod == 0 || processoTipo.cod == null,
                    onPressed: () => {alterarExistente()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: InsertButtonWidget(
                    onPressed: () => {inserirNovo()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: CleanButtonWidget(
                    onPressed: () {
                      setState(() {
                        processoTipo = ProcessoTipoModel.empty();
                      });
                      setEtapa(null);
                      setPrioridade(null);
                      dtpLimiteVigencia.setValue(null);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
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

  Future<bool?> _carregarFluxoEtapas(int cod) async {
    if (processoTipo.etapas != null) return true;
    ProcessoTipoModel? processoTipoFluxo =
        await ProcessoTipoService().FilterOneV2(
      ProcessoTipoFilter(
        carregarEquipamentosEtapas: true,
        carregarEtapas: true,
        carregarSequenciasEtapas: true,
        cod: cod,
      ),
    );

    if (processoTipoFluxo == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Tipo de processo não encontrado, revise seu procedimento, entre em contato com a cordenação!',
      );
      return false;
    }

    processoTipo.etapas = processoTipoFluxo.etapas;
    return true;
  }

  Future abrirFluxo() async {
    if (processoTipo.cod == 0 || processoTipo.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário que o tipo de processo esteja criado para editar o fluxo',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);

    bool? carregouEtapas = await _carregarFluxoEtapas(processoTipo.cod!);
    if (carregouEtapas != true) {
      loading.close(context, mounted);
      return;
    }
    loading.close(context, mounted);

    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (processoTipo.cod ?? 0).toString(),
      title: 'Cadastro/Edição Fluxo Tipo de Processo',
      widget: ProcessoTipoFluxoPagePresenter(
        onCancel: () => onCancel(chave),
        canEdit: true,
        processoTipo: processoTipo,
      ),
    );
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
    bool nomeValid = txtNome.valid;
    bool descricaoValid = txtDescricao.valid;
    bool prazoValidadeValid = txtPrazovalidade.valid;
    bool limiteVigenciaValid = validateLimiteVigencia();
    bool nivelPrioridadeValid = validateNivelPrioridade();
    if (!nomeValid) {
      scroll.jumpTo(0);
    } else if (!nivelPrioridadeValid) {
      scroll.jumpTo(150);
    } else if (!nivelPrioridadeValid || !limiteVigenciaValid) {
      scroll.jumpTo(200);
    }
    if (!nomeValid ||
        !descricaoValid ||
        !prazoValidadeValid ||
        !limiteVigenciaValid ||
        !nivelPrioridadeValid) {
      return;
    }
    LoadingController loading = LoadingController(context: context);
    cubit.save(
      novo
          ? processoTipo.copyWith(cod: 0, tstamp: null, etapas: null)
          : processoTipo,
      loading,
      widget.onSaved,
    );
  }
}
