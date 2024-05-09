import 'package:flutter/material.dart';

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo_movimento/insumo_movimento_cubit.dart';
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
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
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
    this.usuarioCubit,
    this.insumoReadOnly,
  }) : super(key: key);

  final InsumoTesteModel insumoTeste;
  final DepositoInsumoCubit depositoInsumoCubit;
  final UsuarioCubit? usuarioCubit;
  final bool? insumoReadOnly;

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
  late final InsumoMovimentoCubit insumoMovimentoCubit;
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
    insumoMovimentoCubit = InsumoMovimentoCubit();
    insumoMovimentoCubit.loadAll();
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
            widget.usuarioCubit!.state.usuarios.firstWhere(
          (user) => user.cod == insumoTeste.codUsuarioLiberacao,
        );

        txtUsuarioLiberacao.text = nomeUsuarioLiberacao.nome!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<InsumoTestePageFrmCubit, InsumoTestePageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<InsumoTestePageFrmCubit, InsumoTestePageFrmState>(
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
                                    element.cod == insumoTeste.codInsumo,
                              )
                              .firstOrNull;
                          return DropDownSearchWidget<InsumoModel>(
                            readOnly: widget.insumoReadOnly ?? false,
                            textFunction: (insumo) =>
                                insumo.GetNomeInsumoText(),
                            initialValue: insumo,
                            sourceList: insumos,
                            onChanged: (value) {
                              insumoTeste.codInsumo = value?.cod!;
                            },
                            placeholder: 'Insumo',
                          );
                        },
                      ),
                    ),
                    DropDownSearchApiWidget<
                        InsumoMovimentoDropDownSearchResponseDTO>(
                      textFunction: (insumoMovimento) =>
                          insumoMovimento.InsumoMovimentoText(),
                      initialValue: insumoTeste.insumoMovimento == null
                          ? null
                          : InsumoMovimentoDropDownSearchResponseDTO(
                              cod: insumoTeste.codMovimentoInsumo!,
                              data: insumoTeste.insumoMovimento!.dataHora!,
                              flagEntradaSaida:
                                  insumoTeste.insumoMovimento!.flagEntradaSaida,
                              lote: insumoTeste.insumoMovimento!.lote,
                              nomeInsumo:
                                  insumoTeste.insumoMovimento?.insumo?.nome,
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
                        InsumoMovimentoFilterCubit().setInsumoMovimento(value);
                        insumoTeste.codMovimentoInsumo = value!.cod;
                      },
                      placeholder: 'Movimento',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child:
                          BlocBuilder<DepositoInsumoCubit, DepositoInsumoState>(
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
                                    element.cod == insumoTeste.codDeposito,
                              )
                              .firstOrNull;
                          return DropDownSearchWidget<DepositoInsumoModel>(
                            textFunction: (deposito) =>
                                deposito.GetNomeDepositoText(),
                            initialValue: deposito,
                            sourceList: depositos,
                            onChanged: (value) {
                              insumoTeste.codDeposito = value?.cod!;
                            },
                            placeholder: 'Depósito',
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
                      child: DropDownWidget<SituacaoOption>(
                        initialValue: SituacaoOption.situacaoOption
                            .where(
                              (element) => element.cod == insumoTeste.resultado,
                            )
                            .firstOrNull,
                        sourceList: SituacaoOption.situacaoOption,
                        onChanged: (value) =>
                            insumoTeste.resultado = value.cod.toString(),
                        placeholder: 'Situação',
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
            actions: [
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: [
                      CustomPopupItemHistoryModel.getHistoryItem(),
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
    if (!txtLote.valid && !txtUsuario.valid) return;

    if (insumoTeste.resultado == '0') {
      print(10);
      txtUsuarioLiberacao.text = nomeUsuarioLiberacao;
      insumoTeste.codUsuarioLiberacao = codUsuarioLiberacao;
    }

    cubit.save(insumoTeste);
  }
}
