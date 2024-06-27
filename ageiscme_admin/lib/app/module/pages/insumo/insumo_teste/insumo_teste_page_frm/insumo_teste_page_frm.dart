import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_drop_down_search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:flutter/material.dart';

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/cubit/insumo_movimento_filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_teste/insumo_teste_page_frm/insumo_teste_frm_page_state.dart';
import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_data/services/insumo_teste/insumo_teste_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/insumo_teste/insumo_teste_model.dart';
import 'package:ageiscme_models/response_dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';

class InsumoTestePageFrm extends StatefulWidget {
  const InsumoTestePageFrm({
    Key? key,
    required this.insumoTeste,
    required this.depositoInsumoCubit,
    required this.usuarioCubit,
    required this.onSaved,
    required this.onCancel,
    this.insumoReadOnly,
  }) : super(key: key);

  final InsumoTesteModel insumoTeste;
  final DepositoInsumoCubit depositoInsumoCubit;
  final UsuarioDropDownSearchCubit usuarioCubit;
  final bool? insumoReadOnly;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<InsumoTestePageFrm> createState() =>
      _InsumoTestePageFrmState(insumoTeste: insumoTeste);
}

class _InsumoTestePageFrmState extends State<InsumoTestePageFrm> {
  _InsumoTestePageFrmState({required this.insumoTeste});
  late String titulo;
  InsumoTesteModel insumoTeste;
  late final InsumoCubit insumoCubit;
  late final DepositoInsumoCubit depositoInsumoCubit;
  late final UsuarioCubit usuarioCubit;
  late final InsumoTestePageFrmCubit cubit = InsumoTestePageFrmCubit(
    insumoTesteModel: insumoTeste,
    service: InsumoTesteService(),
  );
  InsumoMovimentoFilterCubit insumoCubitFilter = InsumoMovimentoFilterCubit();

  late final TextFieldStringWidget txtLote = TextFieldStringWidget(
    placeholder: 'Lote',
    onChanged: (String? str) {
      insumoTeste.lote = txtLote.text;
    },
  );

  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      insumoTeste.indicador = txtDescricao.text;
    },
  );

  late final TextFieldStringWidget txtComunicadoFabricante =
      TextFieldStringWidget(
    placeholder: 'Comunicado Fabricante',
    onChanged: (String? str) {
      insumoTeste.comunicadoFabricante = txtComunicadoFabricante.text;
    },
  );

  late final TextFieldStringWidget txtComunicadoAnvisa = TextFieldStringWidget(
    placeholder: 'Comunicado Anvisa',
    onChanged: (String? str) {
      insumoTeste.comunicadoAnvisa = txtComunicadoAnvisa.text;
    },
  );

  late final TextFieldStringWidget txtUsuario = TextFieldStringWidget(
    placeholder: 'Usuário',
    readOnly: true,
    onChanged: (String? str) {
      insumoTeste.codUsuario = int.tryParse(txtUsuario.text);
    },
  );

  late final TextFieldStringWidget txtUsuarioLiberacao = TextFieldStringWidget(
    placeholder: 'Resp. Liberação',
    readOnly: true,
    onChanged: (String? str) {
      insumoTeste.codUsuarioLiberacao = int.tryParse(txtUsuarioLiberacao.text);
    },
  );

  late final DatePickerWidget dtpDataHora = DatePickerWidget(
    placeholder: 'Data',
    onDateSelected: (value) => insumoTeste.data = value,
    initialValue: insumoTeste.data,
    readOnly: true,
  );

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  late final InsumoMovimentoService insumoMovimentoService;
  late final String nomeUsuarioLiberacao;
  late final int codUsuarioLiberacao;

  @override
  void initState() {
    insumoCubit = InsumoCubit();
    insumoCubit.loadAll();
    insumoMovimentoService = InsumoMovimentoService();

    txtLote.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtDescricao.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtComunicadoAnvisa.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtComunicadoFabricante.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    recuperaUsuario().then((value) {
      if (value == null ||
          value.usuario == null ||
          value.usuario!.cod == null) {
        return;
      }
      txtUsuario.text = value.usuario!.nome ?? '';
      insumoTeste.codUsuario = value.usuario!.cod;

      codUsuarioLiberacao = value.usuario!.cod!;
      nomeUsuarioLiberacao = value.usuario!.nome!;
    });

    super.initState();
  }

  void setFields() {
    txtLote.text = insumoTeste.lote ?? '';
    txtDescricao.text = insumoTeste.indicador ?? '';
    txtComunicadoFabricante.text = insumoTeste.comunicadoFabricante ?? '';
    txtComunicadoAnvisa.text = insumoTeste.comunicadoAnvisa ?? '';

    titulo = 'Cadastro de Testes de Insumos';
    if (insumoTeste.cod != 0) {
      titulo =
          'Edição de Testes de Insumos: ${insumoTeste.cod} - ${insumoTeste.codInsumo}';
      if (insumoTeste.resultado == '0') {
        final nomeUsuarioLiberacao =
            widget.usuarioCubit.state.usuarios.firstWhere(
          (user) => user.cod == insumoTeste.codUsuarioLiberacao,
        );

        txtUsuarioLiberacao.text = nomeUsuarioLiberacao.nome!;
      }
    }
  }

  late bool Function() insumoValidate;
  late bool Function() situacaoValidate;
  late bool Function() movimentacaoValidate;

  final ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<InsumoTestePageFrmCubit, InsumoTestePageFrmState>(
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
                                            insumoTeste.codInsumo,
                                      )
                                      .firstOrNull;
                                  return DropDownSearchWidget<InsumoModel>(
                                    validateBuilder: (
                                      context,
                                      validateMethodBuilder,
                                    ) =>
                                        insumoValidate = validateMethodBuilder,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    readOnly: widget.insumoReadOnly ?? false,
                                    textFunction: (insumo) =>
                                        insumo.GetNomeInsumoText(),
                                    initialValue: insumo,
                                    sourceList: insumos,
                                    onChanged: (value) {
                                      insumoTeste.codInsumo = value?.cod!;
                                    },
                                    placeholder: 'Insumo *',
                                  );
                                },
                              ),
                            ),
                            DropDownSearchApiWidget<
                                InsumoMovimentoDropDownSearchResponseDTO>(
                              validator: (val) =>
                                  val == null ? 'Obrigatório' : null,
                              validateBuilder: (
                                context,
                                validateMethodBuilder,
                              ) =>
                                  movimentacaoValidate = validateMethodBuilder,
                              textFunction: (insumoMovimento) =>
                                  insumoMovimento.InsumoMovimentoText(),
                              initialValue: insumoTeste.insumoMovimento == null
                                  ? null
                                  : InsumoMovimentoDropDownSearchResponseDTO(
                                      cod: insumoTeste.codMovimentoInsumo!,
                                      data: insumoTeste
                                          .insumoMovimento!.dataHora!,
                                      flagEntradaSaida: insumoTeste
                                          .insumoMovimento!.flagEntradaSaida,
                                      lote: insumoTeste.insumoMovimento!.lote,
                                      nomeInsumo: insumoTeste
                                          .insumoMovimento?.insumo?.nome,
                                    ),
                              search: (str) async =>
                                  (await InsumoMovimentoService()
                                          .getDropDownSearchInsumoMovimento(
                                    InsumoMovimentoDropDownSearchDTO(
                                      numeroRegistros: 30,
                                      search: str,
                                    ),
                                  ))
                                      ?.$2 ??
                                  [],
                              onChanged: (value) {
                                InsumoMovimentoFilterCubit()
                                    .setInsumoMovimento(value);
                                insumoTeste.codMovimentoInsumo = value!.cod;
                              },
                              placeholder: 'Movimento *',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<DepositoInsumoCubit,
                                  DepositoInsumoState>(
                                bloc: widget.depositoInsumoCubit,
                                builder: (context, depositoState) {
                                  if (depositoState.loading) {
                                    return const LoadingWidget();
                                  }
                                  List<DepositoInsumoModel> depositos =
                                      depositoState.objs;

                                  depositos.sort(
                                    (a, b) => a.nome!.compareTo(b.nome!),
                                  );
                                  DepositoInsumoModel? deposito = depositos
                                      .where(
                                        (element) =>
                                            element.cod ==
                                            insumoTeste.codDeposito,
                                      )
                                      .firstOrNull;
                                  return DropDownSearchWidget<
                                      DepositoInsumoModel>(
                                    textFunction: (deposito) =>
                                        deposito.GetNomeDepositoText(),
                                    initialValue: deposito,
                                    sourceList: depositos,
                                    onChanged: (value) {
                                      insumoTeste.codDeposito = value?.cod!;
                                    },
                                    placeholder: 'Depósito *',
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtLote,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtDescricao,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: DropDownSearchWidget<SituacaoOption>(
                                validator: (obj) =>
                                    obj == null ? 'Obrigatório' : null,
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    situacaoValidate = validateMethodBuilder,
                                initialValue: SituacaoOption.situacaoOption
                                    .where(
                                      (element) =>
                                          element.cod == insumoTeste.resultado,
                                    )
                                    .firstOrNull,
                                sourceList: SituacaoOption.situacaoOption,
                                onChanged: (value) => insumoTeste.resultado =
                                    value?.cod.toString(),
                                textFunction: (p0) => p0.GetDropDownText(),
                                placeholder: 'Situação *',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtComunicadoFabricante,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtComunicadoAnvisa,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtUsuario,
                                  ),
                                  Expanded(
                                    child: dtpDataHora,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtUsuarioLiberacao,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 24.0)),
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
                    if (insumoTeste.cod != null && insumoTeste.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: insumoTeste.cod!,
                          termo: 'INSUMO_TESTE',
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
                        insumoTeste = InsumoTesteModel.empty();
                      }),
                    },
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

  void salvar() {
    bool loteValid = txtLote.valid;
    bool usuarioValid = txtUsuario.valid;
    bool insumoValid = insumoValidate();
    bool situacaoValid = situacaoValidate();
    bool movimentacaoValid = movimentacaoValidate();
    if (!insumoValid) {
      scroll.jumpTo(0);
    } else if (!movimentacaoValid) {
      scroll.jumpTo(50);
    } else if (!loteValid) {
      scroll.jumpTo(150);
    } else if (!situacaoValid) {
      scroll.jumpTo(250);
    }

    if (!loteValid ||
        !usuarioValid ||
        !insumoValid ||
        !situacaoValid ||
        !movimentacaoValid) return;

    if (insumoTeste.resultado == '0') {
      txtUsuarioLiberacao.text = nomeUsuarioLiberacao;
      insumoTeste.codUsuarioLiberacao = codUsuarioLiberacao;
    }

    cubit.save(insumoTeste, widget.onSaved);
  }
}
