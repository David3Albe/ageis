import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/destino_residuo/destino_residuo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento_insumo/equipamento_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/insumo_movimento_page_frm/insumo_movimento_frm_page_state.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_data/services/insumo_saldo/insumo_saldo_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/moviment_input/moviment_input_print_dto.dart';
import 'package:ageiscme_impressoes/prints/moviment_input_printer/moviment_input_printer_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/insumo_saldo/insumo_saldo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/insumo_saldo/insumo_saldo_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/read_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class InsumoMovimentoPageFrm extends StatefulWidget {
  const InsumoMovimentoPageFrm({
    Key? key,
    required this.insumoMovimento,
    this.baseSolicitacao,
    this.numeroSolicitacao,
    this.numeroSolicitacaoItem,
  }) : super(key: key);

  final InsumoMovimentoModel insumoMovimento;
  final bool? baseSolicitacao;
  final int? numeroSolicitacao;
  final int? numeroSolicitacaoItem;

  @override
  State<InsumoMovimentoPageFrm> createState() => _InsumoMovimentoPageFrmState(
        insumoMovimento: insumoMovimento,
        baseSolicitacao: baseSolicitacao,
        numeroSolicitacao: numeroSolicitacao,
        numeroSolicitacaoItem: numeroSolicitacaoItem,
      );
}

class _InsumoMovimentoPageFrmState extends State<InsumoMovimentoPageFrm> {
  _InsumoMovimentoPageFrmState({
    required this.insumoMovimento,
    required this.baseSolicitacao,
    required this.numeroSolicitacao,
    required this.numeroSolicitacaoItem,
  });

  bool? baseSolicitacao;
  int? numeroSolicitacao;
  int? numeroSolicitacaoItem;

  late final EquipamentoCubit equipamentoCubit;
  late final InsumoCubit insumoCubit;
  late final DepositoInsumoCubit depositoInsumoCubit;
  late final DestinoResiduoCubit destinoResiduoCubit;
  late String titulo;
  InsumoMovimentoModel insumoMovimento;
  final GlobalKey<DropDownSearchWidgetState<InsumoModel>> cbxInsumoKey =
      GlobalKey();

  bool isEntradaSelected = false;
  bool isSaidaSelected = false;
  bool isAjusteSelected = false;

  late final InsumoMovimentoPageFrmCubit cubit = InsumoMovimentoPageFrmCubit(
    insumoMovimentoModel: insumoMovimento,
    service: InsumoMovimentoService(),
  );

  late final TextFieldNumberWidget txtCodigoInsumo = TextFieldNumberWidget(
    placeholder: 'Código Insumo',
    onChanged: (String? str) {
      setState(() {
        insumoMovimento.codBarra = str != null ? int.tryParse(str) : null;
        bool Function(InsumoModel) exp = (InsumoModel obj) =>
            obj.codBarra == int.tryParse(str ?? '') && obj.ativo == true;
        InsumoModel? insumo =
            cbxInsumoKey.currentState?.setItemByExpression(exp);
        insumoMovimento.codInsumo = insumo?.cod;
        insumoMovimento.insumo = insumo;
        checkAndCallPopulaCampos();
      });
    },
    readOnly:
        insumoMovimento.cod != 0 || baseSolicitacao == true ? true : false,
  );

  late final TextFieldStringWidget txtLote = TextFieldStringWidget(
    placeholder: 'Lote',
    onChanged: (String? str) {
      insumoMovimento.lote = txtLote.text;
    },
    readOnly: insumoMovimento.cod != 0 ? true : false,
  );

  late final DatePickerWidget dtpDataValidade = DatePickerWidget(
    placeholder: 'Data Validade',
    onDateSelected: (value) => insumoMovimento.dataValidade = value,
    initialValue: insumoMovimento.dataValidade,
    readOnly:
        insumoMovimento.cod != 0 && insumoMovimento.flagEntradaSaida != '1'
            ? true
            : false,
  );

  late final TextFieldNumberFloatWidget txtQuantidade =
      TextFieldNumberFloatWidget(
    negative: true,
    placeholder: 'Quantidade',
    onChanged: (String? str) {
      insumoMovimento.quantidade = double.tryParse(txtQuantidade.text);
    },
    readOnly: insumoMovimento.cod != 0 ? true : false,
  );

  late final DatePickerWidget dtpDataFabricacao = DatePickerWidget(
    placeholder: 'Data Fabricação',
    onDateSelected: (value) => insumoMovimento.dataFabricacao = value,
    initialValue: insumoMovimento.dataFabricacao,
    readOnly:
        insumoMovimento.cod != 0 && insumoMovimento.flagEntradaSaida != '1'
            ? true
            : false,
  );

  late final TextFieldStringWidget txtNroNotaFiscal = TextFieldStringWidget(
    placeholder: 'Nro Nota Fiscal',
    onChanged: (String? str) {
      insumoMovimento.nroTotalFiscal = txtNroNotaFiscal.text;
    },
  );

  late final TextFieldNumberFloatWidget txtPrecoUnitario =
      TextFieldNumberFloatWidget(
    placeholder: 'Preço Unitário',
    onChanged: (String? str) {
      insumoMovimento.precoCusto3Albe = double.tryParse(txtPrecoUnitario.text);
    },
  );

  late final TextFieldNumberFloatWidget txtPrecoNotaFiscal =
      TextFieldNumberFloatWidget(
    placeholder: 'Preço Nota Fiscal',
    onChanged: (String? str) {
      insumoMovimento.precoNotaFiscal =
          str == null ? null : double.tryParse(txtPrecoNotaFiscal.text);
    },
  );

  late final DatePickerWidget dtpDataNotaFiscal = DatePickerWidget(
    placeholder: 'Data Nota Fiscal',
    onDateSelected: (value) => insumoMovimento.dataNotaFiscal = value,
    initialValue: insumoMovimento.dataNotaFiscal,
  );

  late final TextFieldStringWidget txtUsuario = TextFieldStringWidget(
    placeholder: 'Usuário',
    onChanged: (String? str) {
      insumoMovimento.codUsuario = int.tryParse(txtUsuario.text);
    },
    readOnly: true,
  );

  late final DatePickerWidget dtpDataHora = DatePickerWidget(
    placeholder: 'Data e Hora',
    onDateSelected: (value) => insumoMovimento.dataHora = value,
    initialValue: insumoMovimento.dataHora,
    readOnly: true,
  );

  late final TextFieldStringWidget txtRegistro = TextFieldStringWidget(
    placeholder: 'Registro',
    initialValue: insumoMovimento.cod.toString(),
    readOnly: true,
  );

  late final TextFieldStringWidget txtValidadePosAtivaco =
      TextFieldStringWidget(
    placeholder: 'Validade Pós-Ativação',
    readOnly: true,
  );

  late final TextFieldStringWidget txtSaldoAtual = TextFieldStringWidget(
    placeholder: 'Saldo Atual',
    readOnly: true,
  );

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  late bool isUserValidEntrada = true;
  late bool isUserValidSaida = true;
  late bool isUserValidAjuste = true;

  static const double DEFAULT_HEIGHT = 36;

  late EquipamentoInsumoCubit equipamentoInsumoCubit;

  @override
  void initState() {
    equipamentoInsumoCubit = EquipamentoInsumoCubit();
    equipamentoInsumoCubit.loadFilter(
      filter: EquipamentoInsumoDTO(),
    );
    depositoInsumoCubit = DepositoInsumoCubit();
    depositoInsumoCubit.loadAll();
    insumoCubit = InsumoCubit();
    insumoCubit.loadAll();
    equipamentoCubit = EquipamentoCubit();
    equipamentoCubit.loadAll();
    destinoResiduoCubit = DestinoResiduoCubit();
    destinoResiduoCubit.loadAll();

    txtQuantidade.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str == 0) {
        return 'Quantidade não pode ser Zero';
      }
      return '';
    });

    txtNroNotaFiscal.addValidator((String str) {
      if (str.length > 15) {
        return 'Pode ter no máximo 15 caracteres';
      }
      return '';
    });

    txtLote.addValidator((String str) {
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
      insumoMovimento.codUsuario = value.usuario!.cod;
    });

    setFields(true);
    super.initState();
  }

  void checkAndCallPopulaCampos() {
    if (insumoMovimento.codBarra != 0 &&
        insumoMovimento.codInsumo != null &&
        insumoMovimento.codDeposito != null &&
        insumoMovimento.flagEntradaSaida != '1') {
      populaCampos();
    }
  }

  void recuperarPermissoes() async {
    isUserValidEntrada = await AccessUserService.validateUserHasRight(
      DireitoEnum.InsumosMovimentosEntradas,
    );

    isUserValidSaida = await AccessUserService.validateUserHasRight(
      DireitoEnum.InsumosMovimentosSaidas,
    );

    isUserValidAjuste = await AccessUserService.validateUserHasRight(
      DireitoEnum.InsumosMovimentosAjustes,
    );
  }

  void setFields(bool inInit) async {
    txtCodigoInsumo.text = insumoMovimento.codBarra?.toString() ?? '';
    txtQuantidade.text = insumoMovimento.quantidade?.toString() ?? '';
    txtPrecoNotaFiscal.text = insumoMovimento.precoNotaFiscal?.toString() ?? '';
    txtPrecoUnitario.text = insumoMovimento.precoCusto3Albe?.toString() ?? '';
    txtRegistro.text = insumoMovimento.cod?.toString() ?? '';
    txtNroNotaFiscal.text = insumoMovimento.nroTotalFiscal?.toString() ?? '';
    txtLote.text = insumoMovimento.lote?.toString() ?? '';
    if (!inInit) setFieldsAfterInit();

    titulo = 'Cadastro de Movimentos dos Insumos';
    if (insumoMovimento.cod != 0) {
      titulo = 'Edição de Movimento do Insumo: ${insumoMovimento.cod}';
    }
  }

  void setFieldsAfterInit() {
    if (insumoMovimento.dataFabricacao == null) {
      dtpDataFabricacao.clear();
    } else {
      dtpDataFabricacao.setValue(insumoMovimento.dataFabricacao);
    }

    if (insumoMovimento.dataValidade == null) {
      dtpDataValidade.clear();
    } else {
      dtpDataValidade.setValue(insumoMovimento.dataValidade);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<InsumoMovimentoPageFrmCubit,
        InsumoMovimentoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {},
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
            height: size.height * .8,
            width: size.width * .7,
            constraints: const BoxConstraints(
              minWidth: 1000,
              maxWidth: 1500,
              minHeight: 600,
              maxHeight: 1000,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 14),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: insumoMovimento.cod == 0 &&
                                      baseSolicitacao != true
                                  ? () {
                                      setState(() {
                                        int? codUsuario =
                                            insumoMovimento.codUsuario;
                                        insumoMovimento =
                                            InsumoMovimentoModel.empty();
                                        insumoMovimento.codUsuario = codUsuario;
                                        isEntradaSelected = true;
                                        isSaidaSelected = false;
                                        isAjusteSelected = false;
                                        insumoMovimento.flagEntradaSaida = '1';
                                        baseSolicitacao = null;
                                        numeroSolicitacao = null;
                                        numeroSolicitacaoItem = null;
                                        cbxInsumoKey.currentState
                                            ?.setItem(null);
                                        equipamentoInsumoCubit.reload();
                                        cbxInsumoKey.currentState?.reload();
                                      });
                                      txtSaldoAtual.text = '';
                                      setFields(false);
                                    }
                                  : null,
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: 1,
                                    groupValue:
                                        insumoMovimento.flagEntradaSaida == '1'
                                            ? 1
                                            : (isAjusteSelected ? 0 : null),
                                    onChanged: insumoMovimento.cod == 0 &&
                                            baseSolicitacao != true
                                        ? (value) {
                                            setState(() {
                                              int? codUsuario =
                                                  insumoMovimento.codUsuario;
                                              insumoMovimento =
                                                  InsumoMovimentoModel.empty();
                                              insumoMovimento.codUsuario =
                                                  codUsuario;
                                              isEntradaSelected = value == 1;
                                              isSaidaSelected = false;
                                              isAjusteSelected = false;
                                              insumoMovimento.flagEntradaSaida =
                                                  isEntradaSelected
                                                      ? '1'
                                                      : null;
                                              baseSolicitacao = null;
                                              numeroSolicitacao = null;
                                              numeroSolicitacaoItem = null;
                                              cbxInsumoKey.currentState
                                                  ?.setItem(null);
                                              equipamentoInsumoCubit.reload();
                                              cbxInsumoKey.currentState
                                                  ?.reload();
                                            });
                                            txtSaldoAtual.text = '';
                                            setFields(false);
                                          }
                                        : null,
                                  ),
                                  const Text('Entrada'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 1.0),
                      Expanded(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: insumoMovimento.cod == 0
                                  ? () {
                                      setState(() {
                                        int? codUsuario =
                                            insumoMovimento.codUsuario;
                                        insumoMovimento =
                                            InsumoMovimentoModel.empty();
                                        insumoMovimento.codUsuario = codUsuario;
                                        isSaidaSelected = true;
                                        isEntradaSelected = false;
                                        isAjusteSelected = false;
                                        insumoMovimento.flagEntradaSaida = '2';
                                        baseSolicitacao = null;
                                        numeroSolicitacao = null;
                                        numeroSolicitacaoItem = null;
                                        cbxInsumoKey.currentState
                                            ?.setItem(null);
                                        equipamentoInsumoCubit.reload();
                                        cbxInsumoKey.currentState?.reload();
                                      });
                                      txtSaldoAtual.text = '';
                                      setFields(false);
                                    }
                                  : null,
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: 2,
                                    groupValue:
                                        insumoMovimento.flagEntradaSaida == '2'
                                            ? 2
                                            : (isAjusteSelected ? 0 : null),
                                    onChanged: insumoMovimento.cod == 0
                                        ? (value) {
                                            setState(() {
                                              int? codUsuario =
                                                  insumoMovimento.codUsuario;
                                              insumoMovimento =
                                                  InsumoMovimentoModel.empty();
                                              insumoMovimento.codUsuario =
                                                  codUsuario;
                                              isSaidaSelected = value == 2;
                                              isEntradaSelected = false;
                                              isAjusteSelected = false;
                                              insumoMovimento.flagEntradaSaida =
                                                  isSaidaSelected ? '2' : null;
                                              baseSolicitacao = null;
                                              numeroSolicitacao = null;
                                              numeroSolicitacaoItem = null;
                                              cbxInsumoKey.currentState
                                                  ?.setItem(null);
                                              equipamentoInsumoCubit.reload();
                                              cbxInsumoKey.currentState
                                                  ?.reload();
                                            });
                                            txtSaldoAtual.text = '';
                                            setFields(false);
                                          }
                                        : null,
                                  ),
                                  const Text('Saída'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 1.0),
                      Expanded(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: insumoMovimento.cod == 0 &&
                                      baseSolicitacao != true
                                  ? () {
                                      setState(() {
                                        int? codUsuario =
                                            insumoMovimento.codUsuario;
                                        insumoMovimento =
                                            InsumoMovimentoModel.empty();
                                        insumoMovimento.codUsuario = codUsuario;
                                        isAjusteSelected = true;
                                        isEntradaSelected = false;
                                        isSaidaSelected = false;
                                        insumoMovimento.flagEntradaSaida = '0';
                                        baseSolicitacao = null;
                                        numeroSolicitacao = null;
                                        numeroSolicitacaoItem = null;
                                        cbxInsumoKey.currentState
                                            ?.setItem(null);
                                        equipamentoInsumoCubit.reload();
                                        cbxInsumoKey.currentState?.reload();
                                      });
                                      txtSaldoAtual.text = '';
                                      setFields(false);
                                    }
                                  : null,
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: 0,
                                    groupValue:
                                        insumoMovimento.flagEntradaSaida == '0'
                                            ? 0
                                            : (isEntradaSelected ? 1 : null),
                                    onChanged: insumoMovimento.cod == 0 &&
                                            baseSolicitacao != true
                                        ? (value) {
                                            setState(() {
                                              int? codUsuario =
                                                  insumoMovimento.codUsuario;
                                              insumoMovimento =
                                                  InsumoMovimentoModel.empty();
                                              insumoMovimento.codUsuario =
                                                  codUsuario;
                                              isAjusteSelected = value == 0;
                                              isEntradaSelected = false;
                                              isSaidaSelected = false;
                                              insumoMovimento.flagEntradaSaida =
                                                  isAjusteSelected ? '0' : null;
                                              baseSolicitacao = null;
                                              numeroSolicitacao = null;
                                              numeroSolicitacaoItem = null;
                                              cbxInsumoKey.currentState
                                                  ?.setItem(null);
                                              cbxInsumoKey.currentState
                                                  ?.reload();
                                              equipamentoInsumoCubit.reload();
                                            });
                                            txtSaldoAtual.text = '';
                                            setFields(false);
                                          }
                                        : null,
                                  ),
                                  const Text('Ajuste'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (insumoMovimento.flagEntradaSaida == '2') ...{
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Builder(
                        builder: (context) {
                          return BlocBuilder<EquipamentoCubit,
                              EquipamentoState>(
                            bloc: equipamentoCubit,
                            builder: (context, equipamentoState) {
                              if (equipamentoState.loading) {
                                return const LoadingWidget();
                              }
                              List<EquipamentoModel> equipamentos =
                                  equipamentoState.objs;

                              equipamentos.sort(
                                (a, b) => a.nome!.compareTo(b.nome!),
                              );

                              EquipamentoModel? equipamento = equipamentos
                                  .where(
                                    (element) =>
                                        element.cod ==
                                        insumoMovimento.codEquipamentoInsumo,
                                  )
                                  .firstOrNull;
                              insumoMovimento.equipamento = equipamento;
                              return DropDownSearchWidget<EquipamentoModel>(
                                readOnly: insumoMovimento.cod != 0 ||
                                        baseSolicitacao == true
                                    ? true
                                    : false,
                                textFunction: (equipamento) =>
                                    equipamento.EquipamentoNomeText(),
                                initialValue: equipamento,
                                sourceList: equipamentos,
                                onChanged: (value) {
                                  insumoMovimento.codEquipamentoInsumo =
                                      value?.cod!;
                                  insumoMovimento.equipamento = value;
                                  equipamentoInsumoCubit.refresh();
                                  cbxInsumoKey.currentState?.reload();
                                },
                                placeholder: 'Equipamento',
                              );
                            },
                          );
                        },
                      ),
                    ),
                  },
                  Row(
                    children: [
                      Expanded(
                        child: txtCodigoInsumo,
                      ),
                      const SizedBox(width: DEFAULT_HEIGHT),
                      Expanded(
                        child: BlocBuilder<EquipamentoInsumoCubit,
                            EquipamentoInsumoState>(
                          bloc: equipamentoInsumoCubit,
                          builder: (context, equipamentoInsumoState) {
                            return BlocBuilder<InsumoCubit, InsumoState>(
                              bloc: insumoCubit,
                              builder: (context, insumoState) {
                                if (insumoState.loading ||
                                    equipamentoInsumoState.loading) {
                                  return const LoadingWidget();
                                }
                                List<int>? insumosConsiderar;
                                print(insumoMovimento.codEquipamentoInsumo);
                                if (insumoMovimento.codEquipamentoInsumo !=
                                    null) {
                                  insumosConsiderar =
                                      equipamentoInsumoState.obj?.consumos
                                          .where(
                                            (element) =>
                                                element.codEquipamento ==
                                                    insumoMovimento
                                                        .codEquipamentoInsumo &&
                                                element.codInsumo != null,
                                          )
                                          .map((e) => e.codInsumo!)
                                          .toList();
                                }

                                List<InsumoModel> insumos = insumoState.objs
                                    .where(
                                      (element) =>
                                          insumosConsiderar == null ||
                                          insumosConsiderar
                                              .contains(element.cod),
                                    )
                                    .toList();

                                insumos.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );

                                InsumoModel? insumo = insumos
                                    .where(
                                      (insumo) =>
                                          insumo.cod ==
                                          insumoMovimento.codInsumo,
                                    )
                                    .firstOrNull;
                                if (insumo == null) {
                                  insumoMovimento.codInsumo = null;
                                  insumoMovimento.codBarra = null;
                                  insumoMovimento.insumo = null;
                                  txtCodigoInsumo.text = '';
                                  cbxInsumoKey.currentState?.setItem(null);
                                }
                                return DropDownSearchWidget<InsumoModel>(
                                  readOnly: insumoMovimento.cod != 0 ||
                                          baseSolicitacao == true
                                      ? true
                                      : false,
                                  key: cbxInsumoKey,
                                  initialValue: insumo,
                                  sourceList: insumos
                                      .where(
                                        (element) => element.ativo == true,
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    insumoMovimento.codInsumo = value?.cod;
                                    insumoMovimento.insumo = value;
                                    txtCodigoInsumo.text =
                                        value?.codBarra == null
                                            ? ''
                                            : value!.codBarra!.toString();
                                    insumoMovimento.codBarra = value?.codBarra;
                                    checkAndCallPopulaCampos();
                                  },
                                  placeholder: 'Insumo',
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child:
                        BlocBuilder<DepositoInsumoCubit, DepositoInsumoState>(
                      bloc: depositoInsumoCubit,
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
                                  element.cod == insumoMovimento.codDeposito,
                            )
                            .firstOrNull;
                        return DropDownSearchWidget<DepositoInsumoModel>(
                          readOnly: insumoMovimento.cod != 0 ? true : false,
                          textFunction: (deposito) =>
                              deposito.GetNomeDepositoText(),
                          initialValue: deposito,
                          sourceList: depositos,
                          onChanged: (value) {
                            insumoMovimento.codDeposito = value?.cod!;
                            checkAndCallPopulaCampos();
                          },
                          placeholder: 'Depósito',
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: txtLote,
                      ),
                      const SizedBox(width: DEFAULT_HEIGHT),
                      Expanded(
                        child: dtpDataFabricacao,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: dtpDataValidade,
                      ),
                      if (insumoMovimento.flagEntradaSaida == '2' &&
                          insumoMovimento.cod == 0) ...{
                        const SizedBox(width: DEFAULT_HEIGHT),
                        Expanded(
                          child: txtValidadePosAtivaco,
                        ),
                      },
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: txtQuantidade,
                      ),
                      if (insumoMovimento.flagEntradaSaida != '1' &&
                          insumoMovimento.cod == 0) ...{
                        const SizedBox(width: DEFAULT_HEIGHT),
                        Expanded(
                          child: txtSaldoAtual,
                        ),
                      },
                    ],
                  ),
                  if (insumoMovimento.flagEntradaSaida == '2') ...{
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
                                    element.cod ==
                                    insumoMovimento.codDestinoResiduos,
                              )
                              .firstOrNull;
                          return DropDownSearchWidget<DestinoResiduoModel>(
                            textFunction: (destino) =>
                                destino.GetNomeDestinoText(),
                            initialValue: destino,
                            sourceList: destinos,
                            onChanged: (value) => insumoMovimento
                                .codDestinoResiduos = value?.cod!,
                            placeholder: 'Destino Resíduos',
                          );
                        },
                      ),
                    ),
                  },
                  if (insumoMovimento.flagEntradaSaida == '1') ...{
                    Row(
                      children: [
                        Expanded(
                          child: txtNroNotaFiscal,
                        ),
                        const SizedBox(width: DEFAULT_HEIGHT),
                        Expanded(
                          child: txtPrecoNotaFiscal,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: txtPrecoUnitario,
                        ),
                        const SizedBox(width: DEFAULT_HEIGHT),
                        Expanded(
                          child: dtpDataNotaFiscal,
                        ),
                      ],
                    ),
                  },
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(child: txtUsuario),
                        const SizedBox(width: DEFAULT_HEIGHT),
                        Expanded(
                          child: baseSolicitacao != true
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: Text(
                                    'Nº Solicitação: $numeroSolicitacao',
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: dtpDataHora,
                      ),
                      const SizedBox(width: DEFAULT_HEIGHT),
                      Expanded(
                        child: txtRegistro,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                if (insumoMovimento.cod != null && insumoMovimento.cod != 0)
                  CustomPopupMenuWidget(
                    items: [
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: insumoMovimento.cod!,
                          termo: 'INSUMO_MOVIMENTO',
                        ),
                        context: context,
                      ),
                      CustomPopupItemModel(
                        text: 'Imprimir Etiqueta',
                        onTap: printTag,
                      ),
                    ],
                  ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SaveButtonWidget(
                    // readonly: isUserValidSaida == true ||
                    //         isUserValidEntrada == true ||
                    //         isUserValidAjuste == true &&
                    //             insumoMovimento.cod != 0
                    //     ? false
                    //     : true,
                    onPressed: () =>
                        {salvarConfirmacao(context, insumoMovimento)},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CleanButtonWidget(
                    onPressed: () {
                      setState(() {
                        insumoMovimento = InsumoMovimentoModel.empty();
                        baseSolicitacao = null;
                        numeroSolicitacao = null;
                        numeroSolicitacaoItem = null;
                        cbxInsumoKey.currentState?.setItem(null);
                      });
                      txtSaldoAtual.text = '';
                      setFields(false);
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

  void populaCampos() async {
    bool ajuste = insumoMovimento.flagEntradaSaida == '0';
    InsumoSaldoModel? insumoSaldo = await InsumoSaldoService().filterOne(
      InsumoSaldoFilter(
        codDeposito: insumoMovimento.codDeposito,
        codInsumo: insumoMovimento.codInsumo,
        dataVaidadeMaiorQueAtual: ajuste ? null : true,
        qtdeMaiorQueZero: true,
        numeroRegistros: 1,
        ordenarPorDataValidadeAscendente: true,
      ),
    );

    if (insumoSaldo == null) {
      await ErrorUtils.showErrorDialog(context, [
        'MOV. SAÍDA: Não foi encontrado LOTE com QTDE disponível no DEPÓSITO indicado.',
      ]);
      return;
    }

    txtSaldoAtual.text = insumoSaldo.qtdeDisponivel.toString();
    insumoMovimento.lote = insumoSaldo.lote.toString();

    if (insumoSaldo.dataValidadePosAtividade != null) {
      txtValidadePosAtivaco.text =
          insumoSaldo.dataValidadePosAtividade.toString();
    }
    txtValidadePosAtivaco.text = '';
    insumoMovimento.dataFabricacao = insumoSaldo.dataFabricacao;
    insumoMovimento.dataValidade = insumoSaldo.dataValidade;
    setFields(false);
  }

  Future printTag() async {
    if (insumoMovimento.cod == null || insumoMovimento.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o Movimento do Insumo cadastrado para fazer a impressão da etiqueta.',
      );
      return;
    }
    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();

    MovimentInputPrintDTO movimentInputPrintDTO = MovimentInputPrintDTO(
      companyName: auth!.instituicao!.nome!,
      dataHora: insumoMovimento.dataHora ?? DateTime.now(),
      equipamentName: insumoMovimento.equipamento?.nome,
      entryOut: insumoMovimento.flagEntradaSaida ?? '',
      inputName: insumoMovimento.insumo?.nome ?? '',
      batch: insumoMovimento.lote,
      nroNotaFiscal: insumoMovimento.nroTotalFiscal,
      validity: insumoMovimento.dataValidade,
    );
    MovimentInputPrinterController controller = MovimentInputPrinterController(
      context: context,
      dto: movimentInputPrintDTO,
    );
    await controller.print();
  }

  void salvarConfirmacao(
    BuildContext context,
    InsumoMovimentoModel insumoMovimento,
  ) async {
    if (insumoMovimento.dataFabricacao == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Data de fabricação deve ser informada!',
      );
      return;
    }
    if (insumoMovimento.flagEntradaSaida == '1') {
      if (!txtQuantidade.valid ||
          !txtNroNotaFiscal.valid ||
          !txtLote.valid ||
          insumoMovimento.dataNotaFiscal == null) {
        await ErrorUtils.showErrorDialog(
          context,
          ['Data Nota Fiscal precisa ser informado'],
        );
        return;
      }
    }

    if (insumoMovimento.flagEntradaSaida == '2') {
      if (!txtQuantidade.valid || insumoMovimento.codDestinoResiduos == null) {
        await ErrorUtils.showErrorDialog(
          context,
          ['Destino de resíduos precisa ser informado'],
        );
        return;
      }
    }

    if (insumoMovimento.flagEntradaSaida == '0') {
      if (insumoMovimento.lote == null || !txtQuantidade.valid) {
        await ErrorUtils.showErrorDialog(
          context,
          ['Lote precisa ser informado'],
        );
        return;
      }
    }

    if (insumoMovimento.dataValidade!.isBefore(DateTime.now()) &&
        insumoMovimento.flagEntradaSaida != '0') {
      ToastUtils.showCustomToastError(
        context,
        'Movimentação Geral: Data da Validade Vencida',
      );
      return;
    }

    InsumoSaldoModel? insumoSaldo = await InsumoSaldoService().filterOne(
      InsumoSaldoFilter(
        codDeposito: insumoMovimento.codDeposito,
        codInsumo: insumoMovimento.codInsumo,
        lote: insumoMovimento.lote,
      ),
    );
    if (insumoMovimento.cod == 0) {
      if (insumoSaldo == null) {
        if (insumoMovimento.flagEntradaSaida == '1') {
          bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
            context,
            'INSUMO NÃO ENCONTRADO: O INSUMO/LOTE informado não foi\nencontrado no DEPÓSITO indicado. Deseja criar?',
          );
          if (!confirmacao) {
            ToastUtils.showCustomToastWarning(
              context,
              'Revise seu Procedimento',
            );
            return;
          }
        } else {
          await ErrorUtils.showErrorDialog(context, [
            'MOVIMENTAÇÃO DE SAÍDA: O INSUMO/LOTE informado não foi encontrado no DEPÓSITO indicado.',
          ]);
          return;
        }
      }

      if (insumoMovimento.flagEntradaSaida == '1') {
        bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
          context,
          'Confira atentamente a movimentação preenchida.\nVocê confirma os dados informados?',
        );
        if (!confirmacao) {
          ToastUtils.showCustomToastWarning(
            context,
            'Revise seu Procedimento',
          );
          return;
        }
      }
    }

    if (insumoMovimento.flagEntradaSaida != '1') {
      ReadDialogUtils dialog = ReadDialogUtils();
      (bool, String) confirmacao = await dialog.showReadDialog(
        context,
        'Faça a leitura do Lote indicado ou Cancele a operação',
      );
      if (!confirmacao.$1) {
        ToastUtils.showCustomToastWarning(
          context,
          'Falha na conferência do lote. Revise seu procedimento.',
        );
        return;
      }

      if (insumoMovimento.lote == null ||
          confirmacao.$2 != insumoMovimento.lote) {
        await ErrorUtils.showErrorDialog(context, [
          'O Lote lido não confere com o lote indicado. Revise seu procedimento.',
        ]);
        return;
      }
    }

    if (insumoMovimento.flagEntradaSaida == '1') {
      insumoMovimento.codEquipamentoInsumo = null;
      insumoMovimento.codDestinoResiduos = null;
      insumoMovimento.insumo!.validadeAposAtivacaoDias = null;
      await salvar();
    }
    if (insumoMovimento.flagEntradaSaida == '2') {
      insumoMovimento.nroTotalFiscal = null;
      txtNroNotaFiscal.text = '';
      insumoMovimento.precoCusto3Albe = null;
      txtPrecoUnitario.text = '';
      insumoMovimento.precoNotaFiscal = null;
      txtPrecoNotaFiscal.text = '';
      insumoMovimento.dataNotaFiscal = null;
      await salvar();
    }
    if (insumoMovimento.flagEntradaSaida == '0') {
      insumoMovimento.codEquipamentoInsumo = null;
      insumoMovimento.codDestinoResiduos = null;
      insumoMovimento.nroTotalFiscal = null;
      txtNroNotaFiscal.text = '';
      insumoMovimento.precoCusto3Albe = null;
      txtPrecoUnitario.text = '';
      insumoMovimento.precoNotaFiscal = null;
      txtPrecoNotaFiscal.text = '';
      insumoMovimento.dataNotaFiscal = null;
      await salvar();
    }
  }

  Future salvar() async {
    InsumoMovimentoModel? insumo =
        await cubit.save(insumoMovimento, numeroSolicitacaoItem);
    if (insumo == null) return;
    ToastUtils.showCustomToastSucess(context, 'Movimentação salva!');
    setState(() {
      insumoMovimento = insumo;
      setFields(false);
    });
  }
}
