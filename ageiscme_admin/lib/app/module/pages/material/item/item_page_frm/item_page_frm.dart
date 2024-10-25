import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/etiqueta/etiqueta_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/inserir_rapido_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_etiquetas_frm/item_page_etiquetas_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm/item_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/trocar_etiqueta_page.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_data/services/processo_leitura/processo_leitura_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/item_consignado_etiqueta_print/item_consignado_etiqueta_print_dto.dart';
import 'package:ageiscme_impressoes/dto/item_tag_print/item_tag_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_item_print/processo_preparation_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:ageiscme_impressoes/prints/item_consignado_printer/item_consignado_printer_controller.dart';
import 'package:ageiscme_impressoes/prints/item_tag_printer/item_tag_printer_controller.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/processo_preparation_printer_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/item/item_etiqueta_preparo/item_etiqueta_preparo_dto.dart';
import 'package:ageiscme_models/dto/item/save/item_save_dto.dart';
import 'package:ageiscme_models/dto/item_save_result/item_save_result_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/filters/processo_leitura/processo_leitura_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_consignado/item_consignado_model.dart';
import 'package:ageiscme_models/models/item_descritor_consignado/item_descritor_consignado_model.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_preparo_response/item_etiqueta_preparo_item_response/item_etiqueta_preparo_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_preparo_response/item_etiqueta_preparo_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils_single.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ItemPageFrm extends StatefulWidget {
  const ItemPageFrm({
    Key? key,
    required this.item,
    required this.proprietarioCubit,
    required this.frmType,
    required this.onCancel,
    this.onSaved,
  }) : super(key: key);

  final ItemModel item;
  final ProprietarioCubit proprietarioCubit;
  final ItemPageFrmtype frmType;
  final void Function(int?, bool setToFirst)? onSaved;
  final void Function() onCancel;

  @override
  State<ItemPageFrm> createState() => _ItemPageFrmState(item: item);
}

class _ItemPageFrmState extends State<ItemPageFrm> {
  _ItemPageFrmState({required this.item});

  late String titulo;
  ItemModel item;
  late final EtiquetaCubit etiquetaCubit;

  final List<CustomDataColumn> colunas = [];

  late final ItemPageFrmCubit cubit = ItemPageFrmCubit(
    itemModel: item,
    service: ItemService(),
  );

  late final TextFieldStringWidget txtDescricao;
  late final TextFieldStringWidget txtIdEtiqueta;
  late final TextFieldStringWidget txtFabricante;
  late final TextFieldStringWidget txtFornecedor;
  late final TextFieldNumberWidget txtRegistroAnvisa;
  late final DatePickerWidget dtpRmsValidade;
  late final TextFieldStringWidget txtRefFornecedor;
  late final DatePickerWidget dtpDataAquisicao;
  late final TextFieldStringAreaWidget txtRestricao;
  late final DatePickerWidget dtpDataDescarte;
  late final TextFieldNumberWidget txtNumeroPatrimonio;
  late final TextFieldNumberFloatWidget txtValorItem;
  late final TextFieldNumberWidget txtNumeroNota;
  late final TextFieldStringWidget txtKitAtual;
  // late final TextFieldStringWidget txtConjuntoAtual;
  late final TextFieldNumberWidget txtQtdeProcessos;
  late final TextFieldNumberWidget txtEmbalagem;
  late final TextFieldNumberWidget txtLeitura;
  late final TextFieldStringWidget txtUsuarioCadastro;
  late final DatePickerWidget dtpDataCadastro;

  late bool Function() validateDescritor;
  late bool Function() validateProprietario;
  late bool Function() validateStatus;
  final ScrollController scroll = ScrollController();

  late void Function(ItemDescritorModel?) setDescritor;
  late void Function(EtiquetaModel?) setEtiqueta;
  late void Function(ItemSituacaoOption?) setSituacao;
  late void Function(bool) setArmazenarOutrosItens;
  late void Function(bool) setImplantavel;

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  @override
  void initState() {
    txtDescricao = TextFieldStringWidget(
      setReadonlyBuilder: (context, method) => readonlyDescricaoMethod = method,
      setValueBuilder: (context, method) => setDescription = method,
      placeholder: 'Descrição *',
      readOnly: widget.frmType == ItemPageFrmtype.Items || item.cod != 0,
      onChanged: (String? str) => item.descricao = str,
    );
    txtIdEtiqueta = TextFieldStringWidget(
      placeholder:
          'ID Etiqueta Atual ${widget.frmType == ItemPageFrmtype.Consigned ? '' : '*'}',
      readOnly: item.cod != 0 || widget.frmType == ItemPageFrmtype.Consigned,
      setReadonlyBuilder: (context, method) =>
          readonlyIdEtiquetaMethod = method,
      onChanged: (String? str) => item.idEtiqueta = str,
    );
    txtFabricante = TextFieldStringWidget(
      placeholder: 'Fabricante',
      onChanged: (String? str) => item.fabricante = str,
    );
    txtFornecedor = TextFieldStringWidget(
      placeholder: 'Fornecedor',
      onChanged: (String? str) => item.fornecedor = str,
    );
    txtRegistroAnvisa = TextFieldNumberWidget(
      placeholder: 'RMS',
      onChanged: (String? str) => item.registroAnvisa = str,
    );
    dtpRmsValidade = DatePickerWidget(
      setDateValueBuilder: (context, method) => setDateRmsValidade = method,
      placeholder: 'Validade',
      onDateSelected: (value) => item.rmsValidade = value,
      initialValue: item.rmsValidade,
    );
    txtRefFornecedor = TextFieldStringWidget(
      placeholder: widget.frmType == ItemPageFrmtype.Items
          ? 'Lote do Produto'
          : 'Ref. fornecedor *',
      onChanged: (String? str) => item.refFornecedor = str,
    );
    dtpDataAquisicao = DatePickerWidget(
      setDateValueBuilder: (context, method) => setDateAquisicao = method,
      placeholder: 'Data da Aquisição',
      onDateSelected: (value) => item.dataAquisicao = value,
      initialValue: item.dataAquisicao,
    );
    txtRestricao = TextFieldStringAreaWidget(
      placeholder: 'Observação',
      onChanged: (String? str) => item.restricao = str,
    );
    dtpDataDescarte = DatePickerWidget(
      setDateValueBuilder: (context, method) => setDateDescarte = method,
      placeholder: 'Data Descarte',
      onDateSelected: (value) => item.dataDescarte = value,
      initialValue: item.dataDescarte,
    );
    txtNumeroPatrimonio = TextFieldNumberWidget(
      placeholder: 'Número Patrimônio',
      onChanged: (String? str) {
        item.numeroPatrimonio = str == null ? null : int.parse(str);
      },
    );
    txtValorItem = TextFieldNumberFloatWidget(
      placeholder: 'Valor do Item',
      onChanged: (String? str) {
        item.valorItem = str == null ? null : double.parse(str);
      },
    );
    txtNumeroNota = TextFieldNumberWidget(
      placeholder: 'Número Nota',
      onChanged: (String? str) {
        item.numeroNota = str == null ? null : int.parse(str);
      },
    );
    txtKitAtual = TextFieldStringWidget(
      placeholder: 'Kit Atual',
      readOnly: true,
    );
    // txtConjuntoAtual = TextFieldStringWidget(
    //   placeholder: 'Conjunto Atual',
    //   readOnly: true,
    //   onChanged: (String? str) {
    //     item.codConjunto = str == null ? null : int.parse(str);
    //   },
    // );
    txtQtdeProcessos = TextFieldNumberWidget(
      placeholder: 'Qtde. Processos',
      readOnly: true,
      onChanged: (String? str) {
        item.qtdeProcessos = str == null ? null : int.parse(str);
      },
    );
    txtEmbalagem = TextFieldNumberWidget(
      placeholder: 'Embalagem',
      readOnly: true,
      onChanged: (String? str) {
        item.codEmbalagem = str == null ? null : int.parse(str);
      },
    );
    txtLeitura = TextFieldNumberWidget(
      placeholder: 'Leitura',
      readOnly: true,
      onChanged: (String? str) {
        item.codProcessoLeitura = str == null ? null : int.parse(str);
      },
    );
    txtUsuarioCadastro = TextFieldStringWidget(
      placeholder: 'Usuário Cadastro',
      readOnly: true,
    );
    dtpDataCadastro = DatePickerWidget(
      setDateValueBuilder: (context, method) => setDateCadastro = method,
      placeholder: 'Data de Cadastro',
      readOnly: true,
      onDateSelected: (value) => item.dataCadastro = value,
      initialValue: item.dataCadastro,
    );

    etiquetaCubit = EtiquetaCubit();
    etiquetaCubit.loadAll();

    txtDescricao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 250) {
        return 'Pode ter no máximo 250 caracteres';
      }
      return '';
    });

    txtIdEtiqueta.addValidator((String str) {
      if (widget.frmType == ItemPageFrmtype.Items && str.trim().isEmpty) {
        return 'Campo obrigatório';
      }
      if (widget.frmType == ItemPageFrmtype.Items && str.trim().length <= 2) {
        return 'Precisa ter no mínimo 2 caracteres';
      }
      if (widget.frmType == ItemPageFrmtype.Items) {
        String modulo = str.substring(0, 3);
        if (modulo.toUpperCase() == 'KEY' ||
            str == '000' ||
            !RegExp(r'^[a-zA-Z]').hasMatch(modulo[0])) return '';
        return 'Módulo inválido';
      }
      if (str.length > 100) return 'Pode ter no máximo 100 caracteres';
      return '';
    });

    txtFabricante.addValidator((String str) {
      if (str.length > 400) return 'Pode ter no máximo 400 caracteres';
      return '';
    });

    txtFornecedor.addValidator((String str) {
      if (str.length > 400) return 'Pode ter no máximo 400 caracteres';
      return '';
    });

    txtRegistroAnvisa.addValidator((String str) {
      if (str.length > 50) return 'Pode ter no máximo 50 caracteres';
      return '';
    });

    txtRefFornecedor.addValidator((String str) {
      if (str.length > 15) return 'Pode ter no máximo 15 caracteres';
      if (str.trim().isEmpty && widget.frmType == ItemPageFrmtype.Consigned) {
        return 'Obrigatório';
      }
      return '';
    });

    txtRestricao.addValidator((String str) {
      if (str.length > 400) return 'Pode ter no máximo 400 caracteres';
      return '';
    });

    setFields();
    super.initState();
  }

  void setFields() {
    String? usuario = item.usuario?.nome;
    if (usuario == null && txtUsuarioCadastro.text.isNotEmpty) {
      usuario = txtUsuarioCadastro.text;
    }

    txtDescricao.text = item.descricao ?? '';
    txtIdEtiqueta.text = item.idEtiqueta ?? '';
    txtUsuarioCadastro.text = usuario ?? '';
    txtKitAtual.text = item.kit?.descritor?.nome ?? '';
    // txtConjuntoAtual.text = item.codConjunto?.toString() ?? '';
    txtRegistroAnvisa.text = item.registroAnvisa ?? '';
    txtFornecedor.text = item.fornecedor ?? '';
    txtFabricante.text = item.fabricante ?? '';
    txtRefFornecedor.text = item.refFornecedor ?? '';
    txtRestricao.text = item.restricao ?? '';
    txtNumeroPatrimonio.text = (item.numeroPatrimonio ?? '').toString();
    txtNumeroNota.text = (item.numeroNota ?? '').toString();
    txtValorItem.text = (item.valorItem ?? '').toString();
    txtQtdeProcessos.text = (item.qtdeProcessos ?? '').toString();
    txtEmbalagem.text = (item.codEmbalagem ?? '').toString();
    txtLeitura.text = (item.codProcessoLeitura ?? '').toString();

    titulo = 'Cadastro de Itens';
    if (widget.frmType != ItemPageFrmtype.Consigned) {
      readonlyIdEtiquetaMethod?.call(false);
    }
    if (widget.frmType == ItemPageFrmtype.Consigned) {
      readonlyDescricaoMethod?.call(false);
    }
    colunas.clear();
    colunas.add(
      CustomDataColumn(
        text: 'Descrição',
        field: 'descricao',
      ),
    );

    colunas.add(
      CustomDataColumn(
        text: 'QTDE',
        field: 'quantidade',
        type: CustomDataColumnType.Integer,
        negative: false,
      ),
    );

    if (item.cod != 0) {
      readonlyDescricaoMethod?.call(true);
      readonlyIdEtiquetaMethod?.call(true);
      titulo = 'Edição do Item: ${item.cod} - ${item.descricao}';
      colunas.add(
        CustomDataColumn(
          text: 'ENTREGUE',
          readonly: true,
          field: 'conferenciaCadastro',
          type: CustomDataColumnType.Integer,
          negative: false,
          enableAutoEditing: true,
        ),
      );
      colunas.add(
        CustomDataColumn(
          text: 'RECEBIDA',
          readonly: true,
          field: 'conferenciaRecepcao',
          type: CustomDataColumnType.Integer,
          negative: false,
          enableAutoEditing: true,
        ),
      );
      colunas.add(
        CustomDataColumn(
          text: 'PREPARADA',
          readonly: true,
          field: 'conferenciaPreparo',
          type: CustomDataColumnType.Integer,
          negative: false,
          enableAutoEditing: true,
        ),
      );
      colunas.add(
        CustomDataColumn(
          text: 'EXPURGO',
          readonly: true,
          field: 'conferenciaExpurgo',
          type: CustomDataColumnType.Integer,
          negative: false,
          enableAutoEditing: true,
        ),
      );
    } else {
      colunas.add(
        CustomDataColumn(
          text: 'ENTREGUE',
          readonly: false,
          field: 'conferenciaCadastro',
          type: CustomDataColumnType.Integer,
          negative: false,
          enableAutoEditing: true,
        ),
      );
    }
  }

  Future<bool> validateDescritorChange(
    ItemDescritorModel? itemDescritor,
  ) async {
    if (item.cod == 0) return true;
    if (itemDescritor?.consignado != true) return true;
    int processoLeiturasExistentes = await ProcessoLeituraService()
        .countFilter(ProcessoLeituraFilter(codItem: item.cod));
    if (processoLeiturasExistentes == 0) return true;
    ErrorUtils.showErrorDialog(
      context,
      [
        'O Item Descritor selecionado é para uso de material consignado. Voce não pode cadastrar ou alterar um Item Descritor Consignado. O item já possui leitura de processo.',
      ],
    );
    return false;
  }

  late Future Function() submitMethod;
  void Function(bool)? readonlyIdEtiquetaMethod;
  void Function(bool)? readonlyDescricaoMethod;
  void Function(ItemDescritorModel?)? setSelectedItemDescritorMethod;
  void Function(ProprietarioModel?)? setSelectedProprietarioMethod;
  void Function(DateTime?)? setDateCadastro;
  void Function(DateTime?)? setDateDescarte;
  void Function(DateTime?)? setDateRmsValidade;
  void Function(DateTime?)? setDateAquisicao;
  void Function(String?)? setDescription;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ItemPageFrmCubit, ItemPageFrmState>(
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
                        maxWidth: size.width * .5,
                        minHeight: size.height * .5,
                        maxHeight: size.height * .8,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:
                                  DropDownSearchApiWidget<ItemDescritorModel>(
                                setSelectedItemBuilder:
                                    (context, setSelectedItemMethod) =>
                                        setDescritor = setSelectedItemMethod,
                                validator: (val) =>
                                    val == null ? 'Obrigatório' : null,
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    validateDescritor = validateMethodBuilder,
                                initialValue: item.descritor,
                                textFunction: (item) =>
                                    item.ItemDescritorText(),
                                search: (str) => ItemDescritorService().Filter(
                                  ItemDescritorFilter(
                                    numeroMaximoRegistros: 30,
                                    apenasAtivos: true,
                                    termoPesquisa: str,
                                    carregarImagem: false,
                                    apenasConsignados: widget.frmType ==
                                        ItemPageFrmtype.Consigned,
                                    apenasNaoConsignados:
                                        widget.frmType == ItemPageFrmtype.Items,
                                    carregarItensConsignados: widget.frmType ==
                                        ItemPageFrmtype.Consigned,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    item.codDescritor = value?.cod;
                                    item.descritor = value;
                                    setDescription
                                        ?.call(value?.descricaoCompleta ?? '');
                                    setarImagemDescritor();
                                    if (item.cod != 0) return;
                                    item.itensConsignados =
                                        buscaItensConsignadosDescritor(
                                      value,
                                    );
                                  });
                                },
                                placeholder: 'Item *',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtDescricao,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtIdEtiqueta,
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
                                    child: txtRegistroAnvisa,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: dtpRmsValidade,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtRefFornecedor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: dtpDataAquisicao,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: BlocBuilder<EtiquetaCubit,
                                        EtiquetaState>(
                                      bloc: etiquetaCubit,
                                      builder: (context, state) {
                                        if (state.loading) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }
                                        EtiquetaModel? etiqueta =
                                            state.etiquetas
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      item.codEtiqueta,
                                                )
                                                .firstOrNull;
                                        List<EtiquetaModel> etiquetasAtivas =
                                            state.etiquetas
                                                .where(
                                                  (element) =>
                                                      element.ativo == true,
                                                )
                                                .toList();
                                        etiquetasAtivas.sort(
                                          (a, b) => a.descricao!
                                              .compareTo(b.descricao!),
                                        );
                                        return DropDownSearchWidget<
                                            EtiquetaModel>(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setEtiqueta =
                                                  setSelectedItemMethod,
                                          initialValue: etiqueta,
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
                                          sourceList: etiquetasAtivas,
                                          onChanged: (value) =>
                                              item.codEtiqueta = value?.cod,
                                          placeholder: 'Etiqueta',
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
                                    child: BlocBuilder<ProprietarioCubit,
                                        ProprietarioState>(
                                      bloc: widget.proprietarioCubit,
                                      builder: (context, proprietarioState) {
                                        if (proprietarioState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<ProprietarioModel> proprietarios =
                                            proprietarioState.proprietarios;
                                        proprietarios.sort(
                                          (a, b) => a.nome!.compareTo(b.nome!),
                                        );
                                        ProprietarioModel? proprietario =
                                            proprietarios
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      item.codProprietario,
                                                )
                                                .firstOrNull;

                                        proprietarios.sort(
                                          (a, b) => a.nome!.compareTo(b.nome!),
                                        );
                                        return DropDownSearchWidget<
                                            ProprietarioModel>(
                                          validateBuilder: (
                                            context,
                                            validateMethodBuilder,
                                          ) =>
                                              validateProprietario =
                                                  validateMethodBuilder,
                                          validator: (val) => val == null
                                              ? 'Obrigatório'
                                              : null,
                                          setSelectedItemBuilder: (
                                            context,
                                            method,
                                          ) =>
                                              setSelectedProprietarioMethod =
                                                  method,
                                          textFunction: (proprietario) =>
                                              proprietario.ProprietarioText(),
                                          initialValue: proprietario,
                                          sourceList: proprietarios
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
                                              .toList(),
                                          onChanged: (value) =>
                                              item.codProprietario = value?.cod,
                                          placeholder: 'Proprietário *',
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: DropDownSearchWidget<
                                        ItemSituacaoOption>(
                                      setSelectedItemBuilder: (
                                        context,
                                        setSelectedItemMethod,
                                      ) =>
                                          setSituacao = setSelectedItemMethod,
                                      validator: (val) =>
                                          val == null ? 'Obrigatório' : null,
                                      validateBuilder:
                                          (context, validateMethodBuilder) =>
                                              validateStatus =
                                                  validateMethodBuilder,
                                      initialValue:
                                          ItemSituacaoOption.situacaoOptions
                                              .where(
                                                (element) =>
                                                    element.cod == item.status,
                                              )
                                              .firstOrNull,
                                      sourceList:
                                          ItemSituacaoOption.situacaoOptions,
                                      textFunction: (p0) =>
                                          p0.GetDropDownText(),
                                      onChanged: (value) =>
                                          item.status = value?.cod,
                                      placeholder: 'Situação *',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtRestricao,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: dtpDataDescarte,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: txtNumeroPatrimonio,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtValorItem,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: txtNumeroNota,
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
                                        setValue: (context, setValueWidget) =>
                                            setArmazenarOutrosItens =
                                                setValueWidget,
                                        checked: item.repositorio,
                                        onClick: (value) =>
                                            item.repositorio = value,
                                        text:
                                            'Função de armazenar outros Itens',
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 16.0,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomCheckboxWidget(
                                        setValue: (context, setValueWidget) =>
                                            setImplantavel = setValueWidget,
                                        checked: item.implantavel,
                                        onClick: (value) =>
                                            item.implantavel = value,
                                        text: 'Implantável',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtKitAtual,
                                  ),
                                  // const SizedBox(width: 16.0),
                                  // Expanded(
                                  //   child: txtConjuntoAtual,
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtQtdeProcessos,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: txtEmbalagem,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: txtLeitura,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtUsuarioCadastro,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: dtpDataCadastro,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: ImageDisplayWidget(
                                imageBase64: item.descritor?.foto ?? '',
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 2)),
                            widget.frmType == ItemPageFrmtype.Consigned
                                ? SizedBox(
                                    height: 400,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: PlutoGridWidget<
                                              ItemConsignadoModel>(
                                            onChanged: onChanged,
                                            items: item.itensConsignados ?? [],
                                            columns: colunas,
                                            submitBuilder: (context, method) =>
                                                submitMethod = method,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
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
                    if (item.cod != null && item.cod != 0)
                      CustomPopupItemModel(
                        text: 'Imprimir Etiqueta',
                        onTap: _imprimirEtiqueta,
                      ),
                    if (item.cod != null && item.cod != 0)
                      CustomPopupItemModel(
                        text: 'Imprimir Etiqueta Preparo',
                        onTap: _imprimirEtiquetaPreparo,
                      ),
                    if (item.cod != null && item.cod != 0)
                      CustomPopupItemModel(
                        text: 'Inserir Rápido',
                        onTap: _inserirRapido,
                      ),
                    if (item.cod != null && item.cod != 0)
                      CustomPopupItemModel(
                        text: 'Etiquetas',
                        onTap: _telaEtiquetas,
                      ),
                    if (item.cod != null &&
                        item.cod != 0 &&
                        widget.frmType == ItemPageFrmtype.Items)
                      CustomPopupItemModel(
                        text: 'Trocar Etiqueta',
                        onTap: _trocarEtiqueta,
                      ),
                    if (item.cod != null &&
                        item.cod != 0 &&
                        widget.frmType == ItemPageFrmtype.Items)
                      CustomPopupItemModel(
                        text: 'Serviços',
                        onTap: abrirMonitoramento,
                      ),
                    if (item.cod != null && item.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Item ${item.cod}',
                        child: HistoricoPage(
                          pk: item.cod!,
                          termo: 'ITEM',
                        ),
                        context: context,
                      ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: UpdateButtonWidget(
                    readonly: item.cod == 0 || item.cod == null,
                    onPressed: () => {alterarExistente()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: InsertButtonWidget(
                    readonly: item.cod != 0 && item.cod != null,
                    onPressed: () => {inserirNovo()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: CleanButtonWidget(onPressed: limpar),
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
    setState(() {
      item = ItemModel.empty();
      item.codUsuarioCadastro = auth?.usuario?.cod;
      item.usuario = auth?.usuario;
      item.codInstituicao = auth?.instituicao?.cod ?? 0;
      item.dataCadastro = DateTime.now();
      if (widget.frmType != ItemPageFrmtype.Consigned) {
        readonlyIdEtiquetaMethod?.call(false);
      }
      setFields();
      setSelectedItemDescritorMethod?.call(null);
      setSelectedProprietarioMethod?.call(null);
      txtUsuarioCadastro.text =
          auth?.usuario?.nome ?? 'Sem usuário identificado';
      setDateCadastro?.call(item.dataCadastro);
      setDateDescarte?.call(null);
      setDateRmsValidade?.call(null);
      setDateAquisicao?.call(null);
      setSituacao(ItemSituacaoOption.getSituacaoLiberado());
      setArmazenarOutrosItens(false);
      setImplantavel(false);
      setEtiqueta(null);
      setDescritor(null);
    });
  }

  void onChanged(
    PlutoGridOnChangedEvent event,
    Map<PlutoRow, ItemConsignadoModel> rowsObject,
  ) {
    if (event.column.field == 'conferenciaCadastro') {
      rowsObject[event.row]!.conferenciaCadastro = event.value;
    }
  }

  List<ItemConsignadoModel> buscaItensConsignadosDescritor(
    ItemDescritorModel? itemDescritor,
  ) {
    if (itemDescritor?.itensDescritoresConsignados == null) {
      return [];
    }
    List<ItemConsignadoModel> itensConsignado = [];
    for (ItemDescritorConsignadoModel itemDescritorConsignado
        in itemDescritor!.itensDescritoresConsignados!) {
      itensConsignado.add(
        ItemConsignadoModel(
          cod: 0,
          codItem: 0,
          codInsituicao: itemDescritorConsignado.codInstituicao,
          conferenciaCadastro: itemDescritorConsignado.quantidade,
          descricao: itemDescritorConsignado.descricao,
          quantidade: itemDescritorConsignado.quantidade,
        ),
      );
    }
    return itensConsignado;
  }

  Future setarImagemDescritor() async {
    if (item.codDescritor == null || item.codDescritor == 0) {
      item.descritor = null;
      return;
    }

    ItemDescritorModel? descritor = await ItemDescritorService().FilterOne(
      ItemDescritorFilter(
        cod: item.codDescritor,
        carregarImagem: true,
      ),
    );
    setState(() {
      item.descritor = descritor;
    });
  }

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  Future salvar(bool novo) async {
    if (widget.frmType == ItemPageFrmtype.Consigned) {
      await submitMethod.call();
    }
    bool descricaoValid = txtDescricao.valid;
    bool etiquetaValid = txtIdEtiqueta.valid;
    bool fabricanteValid = txtFabricante.valid;
    bool registroAnvisaValid = txtRegistroAnvisa.valid;
    bool refFornecedorValid = txtRefFornecedor.valid;
    bool restricaoValid = txtRestricao.valid;
    bool descritorValid = validateDescritor();
    bool proprietarioValid = validateProprietario();
    bool statusValid = validateStatus();
    if (!descritorValid) {
      scroll.jumpTo(0);
    } else if (!descricaoValid) {
      scroll.jumpTo(50);
    } else if (!etiquetaValid) {
      scroll.jumpTo(100);
    } else if (!proprietarioValid) {
      scroll.jumpTo(350);
    }

    if (!descricaoValid ||
        !etiquetaValid ||
        !fabricanteValid ||
        !refFornecedorValid ||
        !registroAnvisaValid ||
        !restricaoValid ||
        !descritorValid ||
        !proprietarioValid ||
        !statusValid) {
      return;
    }
    bool atualizarTodosItensZ = false;
    if (!novo &&
        item.idEtiqueta != null &&
        item.idEtiqueta!.toUpperCase().startsWith('Z') &&
        atualizarTodosItensZ != true) {
      atualizarTodosItensZ =
          await ConfirmDialogUtilsSingle.showConfirmAlertDialog(
        context,
        'Deseja atualizar todas etiquetas deste item Z?',
      );
    }
    ItemSaveDTO itemSave = ItemSaveDTO(
      atualizarTodosItensZ: atualizarTodosItensZ,
      item: novo ? item.copyWith(cod: 0, tstamp: null) : item,
    );
    (String, ItemSaveResultDTO)? result = await cubit.save(
      itemSave,
    );
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    await _printConsignado(result.$2.item);
    setState(() {
      KitModel? kit = item.kit;
      item = result.$2.item;
      item.kit = kit;
      setFields();
    });
  }

  void loadEquipamentoCubit(EquipamentoCubit cubit) {
    if (!cubit.state.loaded) {
      cubit.loadFilter(
        EquipamentoFilter(
          incluirTipoServicos: true,
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future abrirMonitoramento() async {
    if (item.cod == null || item.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o item cadastrado para acessar a tela de serviços.',
      );
      return;
    }
    EquipamentoCubit cubit = EquipamentoCubit();
    loadEquipamentoCubit(cubit);
    RegistroServicoModel registroServicoModel = RegistroServicoModel.empty();
    registroServicoModel.codItem = item.cod;
    registroServicoModel.item = item;
    registroServicoModel.dataInicio = DateTime.now();
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (registroServicoModel.cod ?? 0).toString(),
      title: 'Cadastro/Edição Monitoramento Item',
      widget: RegistroServicoPageFrm(
        equipamentoReadOnly: true,
        itemReadOnly: true,
        equipamentoCubit: cubit,
        itemFilter: ItemFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
        registroServico: registroServicoModel,
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSavedRegistroServico(str, chave),
      ),
    );
  }

  void onSavedRegistroServico(String message, int chave) {
    if (widget.onSaved != null) widget.onSaved!(item.cod, false);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  Future _trocarEtiqueta() async {
    if (item.idEtiqueta == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário um item criado para realizar a alteração da etiqueta',
      );
      return;
    }
    if (widget.frmType != ItemPageFrmtype.Items) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não é possível trocar a etiqueta de um item consignado',
      );
      return;
    }
    (bool, String, int?)? trocou = await showDialog<(bool, String, int?)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return TrocarEtiquetaPage(
          item: item,
        );
      },
    );
    if (trocou?.$1 != true) return;
    if (widget.onSaved != null) widget.onSaved!(item.cod, true);
  }

  Future _telaEtiquetas() async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ItemPageEtiquetasFrm(
          item: item,
        );
      },
    );
  }

  Future _imprimirEtiqueta() async {
    ItemTagPrintDTO dto = ItemTagPrintDTO(
      descricaoItem: item.descricao ?? '',
      descricaoProprietario: item.proprietario?.nome ?? '',
      idEtiqueta: item.idEtiqueta ?? '',
      restricao: item.restricao,
    );
    ItemTagPritnerController controller =
        ItemTagPritnerController(context: context, dto: dto);
    LoadingController loading = LoadingController(context: context);
    await controller.print();
    loading.close(context, mounted);
  }

  Future _inserirRapido() async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return InserirRapidoPage(
          item: item,
        );
      },
    );
  }

  Future _imprimirEtiquetaPreparo() async {
    (String, ItemEtiquetaPreparoResponseDTO)? response = await ItemService()
        .getEtiquetaPreparo(dto: ItemEtiquetaPreparoDTO(codItem: item.cod!));
    if (response == null) return;
    ItemEtiquetaPreparoItemResponseDTO itemEtiqueta = response.$2.item;
    ProcessoPreparationPrintDTO dto = ProcessoPreparationPrintDTO(
      actualTime: response.$2.dataLeitura,
      companyName: response.$2.instituicao.nome,
      userName: response.$2.usuario.nome,
      userDoc: response.$2.usuario.docClasse,
      kits: [],
      itens: [
        ProcessoPreparationItemPrintDTO(
          nome: itemEtiqueta.nome,
          nomeProprietario: itemEtiqueta.nomeProprietario,
          nomeProcesso: itemEtiqueta.nomeTipoProcesso,
          validadeEmbalagem: response.$2.validadeEmbalagem,
          tagId: itemEtiqueta.idEtiqueta,
          urgency: itemEtiqueta.urgencia,
          ordemLeitura: 0,
        ),
      ],
    );
    ProcessoPreparationPrinterController controller =
        ProcessoPreparationPrinterController(
      context: context,
      dto: dto,
    );
    LoadingController loading = LoadingController(context: context);
    await controller.print();
    loading.closeDefault();
  }

  Future _printConsignado(ItemModel item) async {
    if (item.descritor?.consignado != true) return;
    bool? sucess = await ItemConsignadoPrinterController(
      context: context,
      dto: ItemConsignadoEtiquetaPrintDTO(
        idEtiqueta: item.idEtiqueta!,
      ),
    ).print();
    if (sucess == false) {
      ErrorUtils.showErrorDialog(context, [
        'Houve um erro ao realizar a impressão de consignado, entre em contato com o T.I.',
      ]);
    }
  }
}
