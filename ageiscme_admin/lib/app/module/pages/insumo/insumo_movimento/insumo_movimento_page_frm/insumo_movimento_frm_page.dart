import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/destino_residuo/destino_residuo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento_insumo/equipamento_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_drop_down_search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/insumo_movimento_page_frm/insumo_movimento_frm_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_teste/insumo_teste_page_frm/insumo_teste_page_frm.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_data/services/insumo_saldo/insumo_saldo_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/moviment_input/moviment_input_print_dto.dart';
import 'package:ageiscme_impressoes/prints/moviment_input_printer/moviment_input_printer_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/insumo_saldo/insumo_saldo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/insumo_saldo/insumo_saldo_model.dart';
import 'package:ageiscme_models/models/insumo_teste/insumo_teste_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
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
import 'package:compartilhados/componentes/toasts/sucess_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/format/number_format_parser.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class InsumoMovimentoPageFrm extends StatefulWidget {
  const InsumoMovimentoPageFrm({
    Key? key,
    required this.insumoMovimento,
    required this.onCancel,
    required this.permiteAjuste,
    required this.permiteEntrada,
    required this.permiteSaida,
    this.baseSolicitacao,
    this.numeroSolicitacao,
    this.numeroSolicitacaoItem,
    required this.onSaved,
  }) : super(key: key);

  final InsumoMovimentoModel insumoMovimento;
  final bool? baseSolicitacao;
  final int? numeroSolicitacao;
  final int? numeroSolicitacaoItem;
  final bool permiteAjuste;
  final bool permiteEntrada;
  final bool permiteSaida;
  final void Function() onCancel;
  final void Function(String) onSaved;

  @override
  State<InsumoMovimentoPageFrm> createState() => _InsumoMovimentoPageFrmState(
        insumoMovimento: insumoMovimento,
        baseSolicitacao: baseSolicitacao,
        numeroSolicitacao: numeroSolicitacao,
        numeroSolicitacaoItem: numeroSolicitacaoItem,
        permiteAjuste: permiteAjuste,
        permiteEntrada: permiteEntrada,
        permiteSaida: permiteSaida,
      );
}

class _InsumoMovimentoPageFrmState extends State<InsumoMovimentoPageFrm> {
  _InsumoMovimentoPageFrmState({
    required this.insumoMovimento,
    required this.baseSolicitacao,
    required this.numeroSolicitacao,
    required this.numeroSolicitacaoItem,
    required this.permiteAjuste,
    required this.permiteEntrada,
    required this.permiteSaida,
  });

  bool permiteAjuste;
  bool permiteEntrada;
  bool permiteSaida;
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

  late void Function(bool) setReadonlyInsumo;
  late final TextFieldNumberWidget txtCodigoInsumo = TextFieldNumberWidget(
    placeholder: 'Código Insumo',
    onChanged: (String? str) {
      // setState(() {
      insumoMovimento.codBarra = str != null ? int.tryParse(str) : null;
      bool Function(InsumoModel) exp = (InsumoModel obj) =>
          obj.codBarra == int.tryParse(str ?? '') && obj.ativo == true;
      InsumoModel? insumo = cbxInsumoKey.currentState?.setItemByExpression(exp);
      insumoMovimento.codInsumo = insumo?.cod;
      insumoMovimento.insumo = insumo;
      destinoResiduoCubit.refresh();
      checkAndCallPopulaCampos();
      // });
    },
    setReadonlyBuilder: (context, setReadonly) =>
        setReadonlyInsumo = setReadonly,
    readOnly:
        insumoMovimento.cod != 0 || baseSolicitacao == true ? true : false,
  );

  late void Function(bool) setReadonlyLote;
  late final TextFieldStringWidget txtLote = TextFieldStringWidget(
    placeholder: 'Lote *',
    onChanged: (String? str) {
      insumoMovimento.lote = str;
    },
    setReadonlyBuilder: (context, setReadonly) => setReadonlyLote = setReadonly,
    readOnly: insumoMovimento.cod != 0 ? true : false,
  );

  late bool Function() dataValidadeValidate;
  late void Function(bool, bool) setReadonlyValidade;
  late final DatePickerWidget dtpDataValidade = DatePickerWidget(
    placeholder: 'Data Validade *',
    onDateSelected: (value) => insumoMovimento.dataValidade = value,
    validateBuilder: (context, validateMethodBuilder) =>
        dataValidadeValidate = validateMethodBuilder,
    validator: (date) {
      if (date == null && insumoMovimento.flagEntradaSaida == '1') {
        return 'Obrigatório';
      }
      if (insumoMovimento.flagEntradaSaida == '1' &&
          date != null &&
          date.isBefore(DateTime.now())) {
        return 'Não pode ser antes da data atual';
      }
      return null;
    },
    initialValue: insumoMovimento.dataValidade,
    setReadonlyBuilder: (context, setReadonlyBuilder) =>
        setReadonlyValidade = setReadonlyBuilder,
    readOnly: insumoMovimento.flagEntradaSaida != '1' ? true : false,
  );

  late void Function(bool) setReadonlyQuantidade;
  late final TextFieldNumberWidget txtQuantidade = TextFieldNumberWidget(
    negative: true,
    placeholder: 'Quantidade *',
    onChanged: (String? str) {
      insumoMovimento.quantidade =
          str == null || str.isEmpty ? null : double.tryParse(str);
    },
    setReadonlyBuilder: (context, setReadonly) =>
        setReadonlyQuantidade = setReadonly,
    readOnly: insumoMovimento.cod != 0 ? true : false,
  );

  late bool Function() dataFabricacaoValidate;
  late void Function(bool, bool) setReadonlyFabricacao;
  late final DatePickerWidget dtpDataFabricacao = DatePickerWidget(
    placeholder: 'Data Fabricação *',
    validator: (date) {
      return date == null && insumoMovimento.flagEntradaSaida == '1'
          ? 'Obrigatório'
          : null;
    },
    validateBuilder: (context, validateMethodBuilder) =>
        dataFabricacaoValidate = validateMethodBuilder,
    onDateSelected: (value) => insumoMovimento.dataFabricacao = value,
    initialValue: insumoMovimento.dataFabricacao,
    setReadonlyBuilder: (context, setReadonlyBuilder) =>
        setReadonlyFabricacao = setReadonlyBuilder,
    readOnly: insumoMovimento.flagEntradaSaida != '1' ? true : false,
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
      insumoMovimento.precoCusto3Albe =
          str == null ? null : double.tryParse(str);
    },
  );

  late final TextFieldNumberFloatWidget txtPrecoNotaFiscal =
      TextFieldNumberFloatWidget(
    placeholder: 'Preço Nota Fiscal',
    onChanged: (String? str) {
      insumoMovimento.precoNotaFiscal =
          str == null ? null : double.tryParse(str);
    },
  );

  late bool Function() dataNotaFiscalValidate;
  late final DatePickerWidget dtpDataNotaFiscal = DatePickerWidget(
    placeholder: 'Data Nota Fiscal *',
    validateBuilder: (context, validateMethodBuilder) =>
        dataNotaFiscalValidate = validateMethodBuilder,
    validator: (date) => date == null && insumoMovimento.flagEntradaSaida == '1'
        ? 'Obrigatório'
        : null,
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

  late final TextFieldStringWidget dtpDataHora = TextFieldStringWidget(
    placeholder: 'Data e Hora',
    initialValue: insumoMovimento.dataHora != null
        ? DateFormat('dd/MM/yyyy HH:mm').format(insumoMovimento.dataHora!)
        : '',
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

  late bool Function() depositoValidate;
  late bool Function() insumoValidate;
  late void Function(DepositoInsumoModel?) setDeposito;

  final ScrollController scroll = ScrollController();

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
      } else if (str == '0') {
        return 'Quantidade não pode ser Zero';
      } else if (insumoMovimento.flagEntradaSaida != '0' && str.contains('-')) {
        return 'Quantidade não pode ser Negativa';
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
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    recuperaUsuario().then((value) {
      if (insumoMovimento.codUsuario != null) {
        txtUsuario.text = insumoMovimento.usuario!.nome ?? '';
        return;
      }
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
    txtQuantidade.text = insumoMovimento.quantidade?.round().toString() ?? '';
    txtPrecoNotaFiscal.text = NumberFormatParser.toFixed(
      insumoMovimento.precoNotaFiscal,
      2,
    );
    txtPrecoUnitario.text = NumberFormatParser.toFixed(
      insumoMovimento.precoCusto3Albe,
      2,
    );
    txtRegistro.text = insumoMovimento.cod?.toString() ?? '';
    txtNroNotaFiscal.text = insumoMovimento.nroTotalFiscal?.toString() ?? '';
    txtLote.text = insumoMovimento.lote?.toString() ?? '';
    if (!inInit) {
      dtpDataNotaFiscal.setValue(insumoMovimento.dataNotaFiscal);
      setReadonlyQuantidade(
        insumoMovimento.cod != null && insumoMovimento.cod != 0,
      );
      setReadonlyInsumo(
        insumoMovimento.cod != 0 || baseSolicitacao == true,
      );
      setReadonlyLote(insumoMovimento.cod != 0 && insumoMovimento.cod != null);
      setReadonlyValidade(
        insumoMovimento.flagEntradaSaida != '1' ? true : false,
        false,
      );
      setReadonlyFabricacao(
        insumoMovimento.flagEntradaSaida != '1' ? true : false,
        false,
      );
      txtLote.valid;
      setFieldsAfterInit();
    }
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
    return BlocBuilder<InsumoMovimentoPageFrmCubit,
        InsumoMovimentoPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                TitleWidget(
                  text: titulo,
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
                      height: size.height * .8,
                      width: size.width * .7,
                      constraints: const BoxConstraints(
                        minWidth: 1000,
                        maxWidth: 1500,
                        minHeight: 600,
                        maxHeight: 1000,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Visibility(
                                        visible: permiteEntrada,
                                        maintainState: true,
                                        child: InkWell(
                                          onTap: insumoMovimento.cod == 0 &&
                                                  baseSolicitacao != true
                                              ? () {
                                                  setState(() {
                                                    int? codUsuario =
                                                        insumoMovimento
                                                            .codUsuario;
                                                    insumoMovimento =
                                                        InsumoMovimentoModel
                                                            .empty();
                                                    insumoMovimento.codUsuario =
                                                        codUsuario;
                                                    isEntradaSelected = true;
                                                    isSaidaSelected = false;
                                                    isAjusteSelected = false;
                                                    insumoMovimento
                                                        .flagEntradaSaida = '1';
                                                    baseSolicitacao = null;
                                                    numeroSolicitacao = null;
                                                    numeroSolicitacaoItem =
                                                        null;
                                                    cbxInsumoKey.currentState
                                                        ?.setItem(null);
                                                    equipamentoInsumoCubit
                                                        .reload();
                                                    cbxInsumoKey.currentState
                                                        ?.reload();
                                                  });
                                                  txtSaldoAtual.text = '';
                                                  setFields(false);
                                                }
                                              : null,
                                          child: Row(
                                            children: [
                                              Radio<int>(
                                                value: 1,
                                                groupValue: insumoMovimento
                                                            .flagEntradaSaida ==
                                                        '1'
                                                    ? 1
                                                    : (isAjusteSelected
                                                        ? 0
                                                        : null),
                                                onChanged: insumoMovimento
                                                                .cod ==
                                                            0 &&
                                                        baseSolicitacao != true
                                                    ? (value) {
                                                        setState(() {
                                                          int? codUsuario =
                                                              insumoMovimento
                                                                  .codUsuario;
                                                          insumoMovimento =
                                                              InsumoMovimentoModel
                                                                  .empty();
                                                          insumoMovimento
                                                                  .codUsuario =
                                                              codUsuario;
                                                          isEntradaSelected =
                                                              value == 1;
                                                          isSaidaSelected =
                                                              false;
                                                          isAjusteSelected =
                                                              false;
                                                          insumoMovimento
                                                                  .flagEntradaSaida =
                                                              isEntradaSelected
                                                                  ? '1'
                                                                  : null;
                                                          baseSolicitacao =
                                                              null;
                                                          numeroSolicitacao =
                                                              null;
                                                          numeroSolicitacaoItem =
                                                              null;
                                                          cbxInsumoKey
                                                              .currentState
                                                              ?.setItem(null);
                                                          equipamentoInsumoCubit
                                                              .reload();
                                                          cbxInsumoKey
                                                              .currentState
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
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 1.0),
                                Expanded(
                                  child: Visibility(
                                    visible: permiteSaida,
                                    maintainState: true,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: insumoMovimento.cod == 0
                                              ? () {
                                                  setState(() {
                                                    int? codUsuario =
                                                        insumoMovimento
                                                            .codUsuario;
                                                    insumoMovimento =
                                                        InsumoMovimentoModel
                                                            .empty();
                                                    insumoMovimento.codUsuario =
                                                        codUsuario;
                                                    isSaidaSelected = true;
                                                    isEntradaSelected = false;
                                                    isAjusteSelected = false;
                                                    insumoMovimento
                                                        .flagEntradaSaida = '2';
                                                    baseSolicitacao = null;
                                                    numeroSolicitacao = null;
                                                    numeroSolicitacaoItem =
                                                        null;
                                                    cbxInsumoKey.currentState
                                                        ?.setItem(null);
                                                    equipamentoInsumoCubit
                                                        .reload();
                                                    cbxInsumoKey.currentState
                                                        ?.reload();
                                                  });
                                                  txtSaldoAtual.text = '';
                                                  setFields(false);
                                                }
                                              : null,
                                          child: Row(
                                            children: [
                                              Radio<int>(
                                                value: 2,
                                                groupValue: insumoMovimento
                                                            .flagEntradaSaida ==
                                                        '2'
                                                    ? 2
                                                    : (isAjusteSelected
                                                        ? 0
                                                        : null),
                                                onChanged: insumoMovimento
                                                            .cod ==
                                                        0
                                                    ? (value) {
                                                        setState(() {
                                                          int? codUsuario =
                                                              insumoMovimento
                                                                  .codUsuario;
                                                          insumoMovimento =
                                                              InsumoMovimentoModel
                                                                  .empty();
                                                          insumoMovimento
                                                                  .codUsuario =
                                                              codUsuario;
                                                          isSaidaSelected =
                                                              value == 2;
                                                          isEntradaSelected =
                                                              false;
                                                          isAjusteSelected =
                                                              false;
                                                          insumoMovimento
                                                                  .flagEntradaSaida =
                                                              isSaidaSelected
                                                                  ? '2'
                                                                  : null;
                                                          baseSolicitacao =
                                                              null;
                                                          numeroSolicitacao =
                                                              null;
                                                          numeroSolicitacaoItem =
                                                              null;
                                                          cbxInsumoKey
                                                              .currentState
                                                              ?.setItem(null);
                                                          equipamentoInsumoCubit
                                                              .reload();
                                                          cbxInsumoKey
                                                              .currentState
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
                                ),
                                const SizedBox(width: 1.0),
                                Expanded(
                                  child: Visibility(
                                    maintainState: true,
                                    visible: permiteAjuste,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: insumoMovimento.cod == 0 &&
                                                  baseSolicitacao != true
                                              ? () {
                                                  setState(() {
                                                    int? codUsuario =
                                                        insumoMovimento
                                                            .codUsuario;
                                                    insumoMovimento =
                                                        InsumoMovimentoModel
                                                            .empty();
                                                    insumoMovimento.codUsuario =
                                                        codUsuario;
                                                    isAjusteSelected = true;
                                                    isEntradaSelected = false;
                                                    isSaidaSelected = false;
                                                    insumoMovimento
                                                        .flagEntradaSaida = '0';
                                                    baseSolicitacao = null;
                                                    numeroSolicitacao = null;
                                                    numeroSolicitacaoItem =
                                                        null;
                                                    cbxInsumoKey.currentState
                                                        ?.setItem(null);
                                                    equipamentoInsumoCubit
                                                        .reload();
                                                    cbxInsumoKey.currentState
                                                        ?.reload();
                                                  });
                                                  txtSaldoAtual.text = '';
                                                  setFields(false);
                                                }
                                              : null,
                                          child: Row(
                                            children: [
                                              Radio<int>(
                                                value: 0,
                                                groupValue: insumoMovimento
                                                            .flagEntradaSaida ==
                                                        '0'
                                                    ? 0
                                                    : (isEntradaSelected
                                                        ? 1
                                                        : null),
                                                onChanged: insumoMovimento
                                                                .cod ==
                                                            0 &&
                                                        baseSolicitacao != true
                                                    ? (value) {
                                                        setState(() {
                                                          int? codUsuario =
                                                              insumoMovimento
                                                                  .codUsuario;
                                                          insumoMovimento =
                                                              InsumoMovimentoModel
                                                                  .empty();
                                                          insumoMovimento
                                                                  .codUsuario =
                                                              codUsuario;
                                                          isAjusteSelected =
                                                              value == 0;
                                                          isEntradaSelected =
                                                              false;
                                                          isSaidaSelected =
                                                              false;
                                                          insumoMovimento
                                                                  .flagEntradaSaida =
                                                              isAjusteSelected
                                                                  ? '0'
                                                                  : null;
                                                          baseSolicitacao =
                                                              null;
                                                          numeroSolicitacao =
                                                              null;
                                                          numeroSolicitacaoItem =
                                                              null;
                                                          cbxInsumoKey
                                                              .currentState
                                                              ?.setItem(null);
                                                          cbxInsumoKey
                                                              .currentState
                                                              ?.reload();
                                                          equipamentoInsumoCubit
                                                              .reload();
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

                                        EquipamentoModel? equipamento =
                                            equipamentos
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      insumoMovimento
                                                          .codEquipamentoInsumo,
                                                )
                                                .firstOrNull;
                                        insumoMovimento.equipamento =
                                            equipamento;
                                        return DropDownSearchWidget<
                                            EquipamentoModel>(
                                          readOnly: insumoMovimento.cod != 0 ||
                                                  baseSolicitacao == true
                                              ? true
                                              : false,
                                          textFunction: (equipamento) =>
                                              equipamento.EquipamentoNomeText(),
                                          initialValue: equipamento,
                                          sourceList: equipamentos,
                                          onChanged: (value) {
                                            insumoMovimento
                                                    .codEquipamentoInsumo =
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
                                      return BlocBuilder<InsumoCubit,
                                          InsumoState>(
                                        bloc: insumoCubit,
                                        builder: (context, insumoState) {
                                          if (insumoState.loading ||
                                              equipamentoInsumoState.loading) {
                                            return const LoadingWidget();
                                          }
                                          List<int>? insumosConsiderar;
                                          if (insumoMovimento
                                                  .codEquipamentoInsumo !=
                                              null) {
                                            insumosConsiderar =
                                                equipamentoInsumoState
                                                    .obj?.consumos
                                                    .where(
                                                      (element) =>
                                                          element.codEquipamento ==
                                                              insumoMovimento
                                                                  .codEquipamentoInsumo &&
                                                          element.codInsumo !=
                                                              null,
                                                    )
                                                    .map((e) => e.codInsumo!)
                                                    .toList();
                                          }

                                          List<InsumoModel> insumos =
                                              insumoState.objs
                                                  .where(
                                                    (element) =>
                                                        insumosConsiderar ==
                                                            null ||
                                                        insumosConsiderar
                                                            .contains(
                                                          element.cod,
                                                        ) ||
                                                        (insumoMovimento.cod !=
                                                                0 &&
                                                            insumoMovimento
                                                                    .cod !=
                                                                null),
                                                  )
                                                  .toList();

                                          insumos.sort(
                                            (a, b) =>
                                                a.nome!.compareTo(b.nome!),
                                          );

                                          InsumoModel? insumo = insumos
                                              .where(
                                                (insumo) =>
                                                    insumo.cod ==
                                                    insumoMovimento.codInsumo,
                                              )
                                              .firstOrNull;
                                          if (insumo == null && mounted) {
                                            insumoMovimento.codInsumo = null;
                                            insumoMovimento.codBarra = null;
                                            insumoMovimento.insumo = null;
                                            txtCodigoInsumo.text = '';
                                            cbxInsumoKey.currentState
                                                ?.setItem(null);
                                          }
                                          return DropDownSearchWidget<
                                              InsumoModel>(
                                            validator: (val) => val == null
                                                ? 'Obrigatório'
                                                : null,
                                            validateBuilder: (
                                              context,
                                              validateMethodBuilder,
                                            ) =>
                                                insumoValidate =
                                                    validateMethodBuilder,
                                            readOnly:
                                                insumoMovimento.cod != 0 ||
                                                        baseSolicitacao == true
                                                    ? true
                                                    : false,
                                            key: cbxInsumoKey,
                                            initialValue: insumo,
                                            sourceList: insumos
                                                .where(
                                                  (element) =>
                                                      element.ativo == true,
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              insumoMovimento.codInsumo =
                                                  value?.cod;
                                              insumoMovimento.insumo = value;
                                              txtCodigoInsumo.text =
                                                  value?.codBarra == null
                                                      ? ''
                                                      : value!.codBarra!
                                                          .toString();
                                              insumoMovimento.codBarra =
                                                  value?.codBarra;
                                              destinoResiduoCubit.refresh();
                                              checkAndCallPopulaCampos();
                                            },
                                            placeholder: 'Insumo *',
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
                              child: BlocBuilder<DepositoInsumoCubit,
                                  DepositoInsumoState>(
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
                                            element.cod ==
                                            insumoMovimento.codDeposito,
                                      )
                                      .firstOrNull;
                                  return DropDownSearchWidget<
                                      DepositoInsumoModel>(
                                    setSelectedItemBuilder:
                                        (context, setSelectedItemMethod) =>
                                            setDeposito = setSelectedItemMethod,
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            depositoValidate =
                                                validateMethodBuilder,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    readOnly:
                                        insumoMovimento.cod != 0 ? true : false,
                                    textFunction: (deposito) =>
                                        deposito.GetNomeDepositoText(),
                                    initialValue: deposito,
                                    sourceList: depositos,
                                    onChanged: (value) {
                                      insumoMovimento.codDeposito = value?.cod!;
                                      checkAndCallPopulaCampos();
                                    },
                                    placeholder: 'Depósito *',
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
                                if (insumoMovimento.flagEntradaSaida ==
                                    '1') ...{
                                  const SizedBox(width: DEFAULT_HEIGHT),
                                  Expanded(
                                    child: txtPrecoUnitario,
                                  ),
                                },
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
                                child: BlocBuilder<DestinoResiduoCubit,
                                    DestinoResiduoState>(
                                  bloc: destinoResiduoCubit,
                                  builder: (context, destinoState) {
                                    if (destinoState.loading) {
                                      return const Center(
                                        child: LoadingWidget(),
                                      );
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
                                              insumoMovimento
                                                  .insumo?.codDestinoResiduo,
                                        )
                                        .firstOrNull;
                                    return DropDownSearchWidget<
                                        DestinoResiduoModel>(
                                      readOnly: true,
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
                              Column(
                                children: [
                                  const SizedBox(height: 50),
                                  const Row(
                                    children: [
                                      Expanded(
                                        child: const Text(
                                          'Documento de Entrada',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: txtNroNotaFiscal,
                                      ),
                                      const SizedBox(width: DEFAULT_HEIGHT),
                                      Expanded(
                                        child: txtPrecoNotaFiscal,
                                      ),
                                      const SizedBox(width: DEFAULT_HEIGHT),
                                      Expanded(
                                        child: dtpDataNotaFiscal,
                                      ),
                                    ],
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
                                            padding: const EdgeInsets.only(
                                              top: 24.0,
                                            ),
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
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    CustomPopupItemModel(
                      text: 'Imprimir Etiqueta',
                      onTap: printTag,
                    ),
                    if (insumoMovimento.cod != null && insumoMovimento.cod != 0)
                      CustomPopupItemModel(
                        text: 'Testes',
                        onTap: _abrirTestes,
                      ),
                    if (insumoMovimento.cod != null && insumoMovimento.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Movimentação de Insumo ${insumoMovimento.cod}',
                        child: HistoricoPage(
                          pk: insumoMovimento.cod!,
                          termo: 'INSUMO_MOVIMENTO',
                        ),
                        context: context,
                      ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: UpdateButtonWidget(
                    readonly:
                        insumoMovimento.cod == 0 || insumoMovimento.cod == null,
                    onPressed: () => {
                      salvarConfirmacao(
                        novo: false,
                        context: context,
                        insumoMovimento: insumoMovimento,
                        insumoSaldo: null,
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: InsertButtonWidget(
                    readonly:
                        insumoMovimento.cod != 0 && insumoMovimento.cod != null,
                    onPressed: () => {
                      salvarConfirmacao(
                        novo: true,
                        context: context,
                        insumoMovimento: insumoMovimento,
                        insumoSaldo: null,
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: CleanButtonWidget(
                    onPressed: limpar,
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

  void limpar() async {
    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    insumoMovimento.cod = 0;
    insumoMovimento.codBarra = null;
    insumoMovimento.codDeposito = null;
    insumoMovimento.codDestinoResiduos = null;
    insumoMovimento.codEquipamentoInsumo = null;
    insumoMovimento.codInsumo = null;
    insumoMovimento.codUsuario = auth?.usuario?.cod;
    insumoMovimento.dataFabricacao = null;
    insumoMovimento.dataHora = DateTime.now();
    dtpDataHora.text =
        DateFormat('dd/MM/yyyy HH:mm').format(insumoMovimento.dataHora!);
    insumoMovimento.dataNotaFiscal = null;
    insumoMovimento.dataValidade = null;
    insumoMovimento.destinoResiduo = null;
    insumoMovimento.equipamento = null;
    insumoMovimento.flagEntradaSaida = '1';
    insumoMovimento.insumo = null;
    insumoMovimento.lote = null;
    insumoMovimento.nroTotalFiscal = null;
    insumoMovimento.precoCusto3Albe = null;
    insumoMovimento.precoNotaFiscal = null;
    insumoMovimento.precoVenda3Albe = null;
    insumoMovimento.quantidade = null;
    insumoMovimento.codInstituicao = auth?.instituicao?.cod;
    insumoMovimento.ultimaAlteracao = null;
    insumoMovimento.tstamp = null;
    insumoMovimento.deposito = null;
    insumoMovimento.usuario = null;

    permiteAjuste = (insumoMovimento.cod != null && insumoMovimento.cod != 0) ||
        await AccessUserService.validateUserHasRight(
          DireitoEnum.InsumosMovimentosAjustes,
        );

    permiteEntrada =
        (insumoMovimento.cod != null && insumoMovimento.cod != 0) ||
            await AccessUserService.validateUserHasRight(
              DireitoEnum.InsumosMovimentosEntradas,
            );

    permiteSaida = (insumoMovimento.cod != null && insumoMovimento.cod != 0) ||
        await AccessUserService.validateUserHasRight(
          DireitoEnum.InsumosMovimentosSaidas,
        );

    txtUsuario.text = auth?.usuario?.nome ?? 'Usuário não identificado';
    setDeposito(null);

    setState(() {
      baseSolicitacao = null;
      numeroSolicitacao = null;
      numeroSolicitacaoItem = null;
      cbxInsumoKey.currentState?.setItem(null);
    });

    txtSaldoAtual.text = '';
    setFields(false);
  }

  void populaCampos() async {
    bool ajuste = insumoMovimento.flagEntradaSaida == '0';
    bool saida = insumoMovimento.flagEntradaSaida == '2';
    InsumoSaldoModel? insumoSaldo = await InsumoSaldoService().filterOne(
      InsumoSaldoFilter(
        codDeposito: insumoMovimento.codDeposito,
        codInsumo: insumoMovimento.codInsumo,
        dataVaidadeMaiorQueAtual: ajuste ? null : true,
        qtdeMaiorQueZero: true,
        numeroRegistros: 1,
        ordenarPorDataValidadeAscendente: true,
        status: saida ? '0' : null,
      ),
    );

    if (insumoSaldo == null) {
      ErrorUtils.showErrorDialog(context, [
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

  Future _abrirTestes() async {
    if (insumoMovimento.cod == null || insumoMovimento.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter a movimentação de insumo cadastrada para acessar a tela de Testes de Insumo',
      );
      return;
    }
    final UsuarioDropDownSearchCubit usuarioCubit =
        UsuarioDropDownSearchCubit();
    await usuarioCubit.loadDropDownSearch(
      UsuarioDropDownSearchDTO(
        numeroRegistros: 10000,
      ),
    );
    DepositoInsumoCubit depositoInsumoBloc = DepositoInsumoCubit();
    depositoInsumoBloc.loadAll();

    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();

    void Function(String, int) onSaved = (str, chave) {
      ToastUtils.showCustomToastSucess(context, str);
      WindowsHelper.RemoverWidget(chave);
    };
    late int chave;

    chave = WindowsHelper.OpenDefaultWindows(
      identificador: '0',
      title: 'Teste da Movimentação de Insumo',
      widget: InsumoTestePageFrm(
        usuarioCubit: usuarioCubit,
        depositoInsumoCubit: depositoInsumoBloc,
        onCancel: () => WindowsHelper.RemoverWidget(chave),
        onSaved: (str) => onSaved(str, chave),
        insumoReadOnly: true,
        insumoTeste: InsumoTesteModel(
          cod: 0,
          codInsumo: insumoMovimento.codInsumo,
          insumo: insumoMovimento.insumo,
          codDeposito: insumoMovimento.codDeposito,
          depositoInsumo: insumoMovimento.deposito,
          lote: insumoMovimento.lote,
          codInstituicao: insumoMovimento.codInstituicao,
          codMovimentoInsumo: insumoMovimento.cod,
          codUsuario: auth?.usuario?.cod,
          codUsuarioLiberacao: null,
          comunicadoAnvisa: null,
          comunicadoFabricante: null,
          data: DateTime.now(),
          imagemDocAnexo: null,
          indicador: null,
          insumoMovimento: insumoMovimento,
          resultado: null,
          tstamp: null,
          ultimaAlteracao: null,
          usuarioLiberacao: null,
          usuario: auth?.usuario,
        ),
      ),
    );
  }

  Future printTag() async {
    // if (insumoMovimento.cod == null || insumoMovimento.cod == 0) {
    //   ToastUtils.showCustomToastWarning(
    //     context,
    //     'É necessário ter o Movimento do Insumo cadastrado para fazer a impressão da etiqueta.',
    //   );
    //   return;
    // }
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

  void salvarConfirmacao({
    required BuildContext context,
    required InsumoMovimentoModel insumoMovimento,
    required InsumoSaldoModel? insumoSaldo,
    required bool novo,
    bool confirmouCriacaoLote = false,
    bool confirmaDados = false,
  }) async {
    bool dataFabricacaoValid = dataFabricacaoValidate();
    bool insumoValid = insumoValidate();
    bool depositoValid = depositoValidate();
    bool loteValid = txtLote.valid;
    bool quantidadeValid = txtQuantidade.valid;
    bool dataValidadeValid = dataValidadeValidate();

    if (!insumoValid) {
      scroll.jumpTo(30);
    } else if (!depositoValid) {
      scroll.jumpTo(80);
    } else if (!loteValid || !dataFabricacaoValid) {
      scroll.jumpTo(130);
    } else if (!dataValidadeValid) {
      scroll.jumpTo(180);
    } else if (!quantidadeValid) {
      scroll.jumpTo(230);
    }

    if (insumoMovimento.flagEntradaSaida == '1') {
      bool dtpDataNotaFiscal = dataNotaFiscalValidate();
      if (!dtpDataNotaFiscal) {
        scroll.jumpTo(330);
      }
      if (!txtNroNotaFiscal.valid || !loteValid || !dtpDataNotaFiscal) {
        return;
      }
    }
    if (!dataFabricacaoValid ||
        !insumoValid ||
        !depositoValid ||
        !loteValid ||
        !quantidadeValid ||
        !dataValidadeValid) {
      return;
    }

    if (insumoSaldo == null) {
      insumoSaldo = await InsumoSaldoService().filterOne(
        InsumoSaldoFilter(
          codDeposito: insumoMovimento.codDeposito,
          codInsumo: insumoMovimento.codInsumo,
          lote: insumoMovimento.lote,
        ),
      );
    }

    if (insumoMovimento.cod == 0 && confirmouCriacaoLote != true) {
      if (insumoSaldo == null) {
        if (insumoMovimento.flagEntradaSaida == '1') {
          ConfirmDialogUtils.showConfirmAlertDialog(
            context: context,
            message:
                'INSUMO NÃO ENCONTRADO: O INSUMO/LOTE informado não foi\nencontrado no DEPÓSITO indicado. Deseja criar?',
            onConfirm: () => salvarConfirmacao(
              novo: novo,
              context: context,
              insumoMovimento: insumoMovimento,
              insumoSaldo: insumoSaldo,
              confirmouCriacaoLote: true,
            ),
          );
          return;
        } else {
          WarningUtils.showWarningDialog(
            context,
            'MOVIMENTAÇÃO DE SAÍDA: O INSUMO/LOTE informado não foi encontrado no DEPÓSITO indicado. Revise seu Procedimento',
          );
          return;
        }
      }

      if (insumoMovimento.flagEntradaSaida == '1' && !confirmaDados) {
        ConfirmDialogUtils.showConfirmAlertDialog(
          context: context,
          message:
              'Confira atentamente a movimentação preenchida.\nVocê confirma os dados informados?',
          onConfirm: () => salvarConfirmacao(
            context: context,
            novo: novo,
            insumoMovimento: insumoMovimento,
            insumoSaldo: insumoSaldo,
            confirmouCriacaoLote: confirmouCriacaoLote,
            confirmaDados: true,
          ),
        );
        return;
      }
    }

    if (insumoMovimento.flagEntradaSaida != '1') {
      ReadDialogUtils dialog = ReadDialogUtils();
      (bool, String) confirmacao = await dialog.showReadDialog(
        context,
        'Faça a leitura do Lote indicado ou Cancele a operação',
      );
      if (!confirmacao.$1) {
        WarningUtils.showWarningDialog(
          context,
          'Falha na conferência do lote. Revise seu procedimento.',
        );
        return;
      }

      if (insumoMovimento.lote == null ||
          confirmacao.$2 != insumoMovimento.lote) {
        WarningUtils.showWarningDialog(
          context,
          'O Lote lido não confere com o lote indicado. Revise seu procedimento.',
        );
        return;
      }
    }

    if (insumoMovimento.flagEntradaSaida == '1') {
      insumoMovimento.codEquipamentoInsumo = null;
      insumoMovimento.codDestinoResiduos = null;
      insumoMovimento.insumo!.validadeAposAtivacaoDias = null;
      await salvar(novo);
    }
    if (insumoMovimento.flagEntradaSaida == '2') {
      insumoMovimento.nroTotalFiscal = null;
      txtNroNotaFiscal.text = '';
      insumoMovimento.precoCusto3Albe = null;
      txtPrecoUnitario.text = '';
      insumoMovimento.precoNotaFiscal = null;
      txtPrecoNotaFiscal.text = '';
      insumoMovimento.dataNotaFiscal = null;
      await salvar(novo);
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
      await salvar(novo);
    }
  }

  Future salvar(bool novo) async {
    InsumoModel? insumo = insumoMovimento.insumo;
    InsumoMovimentoModel? movInsumo = await cubit.save(
      novo ? insumoMovimento.copyWith(cod: 0, tstamp: null) : insumoMovimento,
      numeroSolicitacaoItem,
      widget.onSaved,
    );
    if (movInsumo == null) return;
    if (insumo?.testeInsumoObrigatorio == true &&
        movInsumo.flagEntradaSaida == '1') {
      await SucessUtils.showSucessDialog(
        context,
        'MOV. ENTRADA: Este Insumo exige Teste de Conformidade e somente será liberado após o registro do Teste.\nMovimentação de Entrada Salva!',
      );
    } else {
      ToastUtils.showCustomToastSucess(context, 'Movimentação salva!');
    }
    widget.onSaved('');
    setState(() {
      insumoMovimento = movInsumo;
      setFields(false);
    });
  }
}
