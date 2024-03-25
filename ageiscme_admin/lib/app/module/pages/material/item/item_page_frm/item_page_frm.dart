import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/etiqueta/etiqueta_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm/item_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_data/services/processo_leitura/processo_leitura_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/item_consignado_etiqueta_print/item_consignado_etiqueta_print_dto.dart';
import 'package:ageiscme_impressoes/prints/item_consignado_printer/item_consignado_printer_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/filters/processo_leitura/processo_leitura_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_consignado/item_consignado_model.dart';
import 'package:ageiscme_models/models/item_descritor_consignado/item_descritor_consignado_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
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
  }) : super(key: key);

  final ItemModel item;
  final ProprietarioCubit proprietarioCubit;
  final ItemPageFrmtype frmType;

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
  late final TextFieldStringWidget txtRestricao;
  late final DatePickerWidget dtpDataDescarte;
  late final TextFieldNumberWidget txtNumeroPatrimonio;
  late final TextFieldNumberFloatWidget txtValorItem;
  late final TextFieldNumberWidget txtNumeroNota;
  late final TextFieldStringWidget txtKitAtual;
  late final TextFieldStringWidget txtConjuntoAtual;
  late final TextFieldNumberWidget txtQtdeProcessos;
  late final TextFieldNumberWidget txtEmbalagem;
  late final TextFieldNumberWidget txtLeitura;
  late final TextFieldStringWidget txtUsuarioCadastro;
  late final DatePickerWidget dtpDataCadastro;

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  @override
  void initState() {
    txtDescricao = TextFieldStringWidget(
      setReadonlyBuilder: (context, method) => readonlyDescricaoMethod = method,
      setValueBuilder: (context, method) => setDescription = method,
      placeholder: 'Descrição',
      readOnly: widget.frmType == ItemPageFrmtype.Items || item.cod != 0,
      onChanged: (String? str) => item.descricao = str,
    );
    txtIdEtiqueta = TextFieldStringWidget(
      placeholder: 'ID Etiqueta Atual',
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
          : 'Ref. fornecedor',
      onChanged: (String? str) => item.refFornecedor = str,
    );
    dtpDataAquisicao = DatePickerWidget(
      setDateValueBuilder: (context, method) => setDateAquisicao = method,
      placeholder: 'Data da Aquisição',
      onDateSelected: (value) => item.dataAquisicao = value,
      initialValue: item.dataAquisicao,
    );
    txtRestricao = TextFieldStringWidget(
      placeholder: 'Restrição',
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
    txtConjuntoAtual = TextFieldStringWidget(
      placeholder: 'Conjunto Atual',
      readOnly: true,
      onChanged: (String? str) {
        item.codConjunto = str == null ? null : int.parse(str);
      },
    );
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
      if (widget.frmType == ItemPageFrmtype.Items && str.isEmpty) {
        return 'Campo obrigatório';
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
      if (str.isEmpty && widget.frmType == ItemPageFrmtype.Consigned) {
        return 'Obrigatório';
      }
      return '';
    });

    txtRestricao.addValidator((String str) {
      if (str.length > 400) return 'Pode ter no máximo 400 caracteres';
      return '';
    });

    recuperaUsuario().then((value) {
      if (value == null ||
          value.usuario == null ||
          value.usuario!.cod == null) {
        return;
      }
      txtUsuarioCadastro.text = value.usuario!.nome ?? '';
      item.codUsuarioCadastro = value.usuario!.cod;
    });

    setFields();
    super.initState();
  }

  void setFields() {
    txtDescricao.text = item.descricao ?? '';
    txtIdEtiqueta.text = item.idEtiqueta ?? '';
    txtUsuarioCadastro.text = item.usuario?.nome ?? '';
    txtKitAtual.text = item.kit?.descritor?.nome ?? '';
    txtConjuntoAtual.text = item.codConjunto?.toString() ?? '';
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
    await ErrorUtils.showErrorDialog(
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
    return BlocListener<ItemPageFrmCubit, ItemPageFrmState>(
      bloc: cubit,
      listener: (context, state) async {
        if (state.saved) {
          if (state.novo) await _printConsignado(state.item);
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<ItemPageFrmCubit, ItemPageFrmState>(
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
                maxWidth: size.width * .5,
                minHeight: size.height * .5,
                maxHeight: size.height * .8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropDownSearchApiWidget<ItemDescritorModel>(
                        initialValue: item.descritor,
                        textFunction: (item) => item.ItemDescritorText(),
                        search: (str) => ItemDescritorService().Filter(
                          ItemDescritorFilter(
                            numeroMaximoRegistros: 30,
                            termoPesquisa: str,
                            carregarImagem: false,
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
                        placeholder: 'Item',
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
                            child:
                                BlocBuilder<EtiquetaCubit, List<EtiquetaModel>>(
                              bloc: etiquetaCubit,
                              builder: (context, etiquetas) {
                                EtiquetaModel? etiqueta = etiquetas
                                    .where(
                                      (element) =>
                                          element.cod == item.codEtiqueta,
                                    )
                                    .firstOrNull;

                                etiquetas.sort(
                                  (a, b) =>
                                      a.descricao!.compareTo(b.descricao!),
                                );
                                return DropDownWidget<EtiquetaModel>(
                                  initialValue: etiqueta,
                                  sourceList: etiquetas
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      item.codEtiqueta = value.cod!,
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
                                ProprietarioModel? proprietario = proprietarios
                                    .where(
                                      (element) =>
                                          element.cod == item.codProprietario,
                                    )
                                    .firstOrNull;

                                proprietarios.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                return DropDownSearchWidget<ProprietarioModel>(
                                  setSelectedItemBuilder: (context, method) =>
                                      setSelectedProprietarioMethod = method,
                                  textFunction: (proprietario) =>
                                      proprietario.ProprietarioText(),
                                  initialValue: proprietario,
                                  sourceList: proprietarios
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      item.codProprietario = value?.cod,
                                  placeholder: 'Proprietário',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: DropDownWidget<ItemSituacaoOption>(
                              initialValue: ItemSituacaoOption.situacaoOptions
                                  .where(
                                    (element) => element.cod == item.status,
                                  )
                                  .firstOrNull,
                              sourceList: ItemSituacaoOption.situacaoOptions,
                              onChanged: (value) => item.status = value.cod,
                              placeholder: 'Situação',
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
                                checked: item.repositorio,
                                onClick: (value) => item.repositorio = value,
                                text: 'Função de armazenar outros Itens',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 16.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: item.implantavel,
                                onClick: (value) => item.implantavel = value,
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
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtConjuntoAtual,
                          ),
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
                                  child: PlutoGridWidget<ItemConsignadoModel>(
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
                          item = ItemModel.empty();
                          if (widget.frmType != ItemPageFrmtype.Consigned) {
                            readonlyIdEtiquetaMethod?.call(false);
                          }
                          setFields();
                          setSelectedItemDescritorMethod?.call(null);
                          setSelectedProprietarioMethod?.call(null);
                          setDateCadastro?.call(DateTime.now());
                          setDateDescarte?.call(null);
                          setDateRmsValidade?.call(null);
                          setDateAquisicao?.call(null);
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
    if (item.codDescritor == null) {
      item.descritor = null;
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

  Future salvar() async {
    if (widget.frmType == ItemPageFrmtype.Consigned) {
      await submitMethod.call();
    }
    if (item.codDescritor == null) {
      ToastUtils.showCustomToastWarning(context, 'Selecione um descritor');
      return;
    }
    if (item.codProprietario == null) {
      ToastUtils.showCustomToastWarning(context, 'Selecione um proprietário');
      return;
    }
    if (item.status == null) {
      ToastUtils.showCustomToastWarning(context, 'Selecione a situação');
      return;
    }
    if (!txtDescricao.valid ||
        !txtIdEtiqueta.valid ||
        !txtFabricante.valid ||
        !txtFornecedor.valid ||
        !txtRegistroAnvisa.valid ||
        !txtRefFornecedor.valid ||
        !txtRestricao.valid) {
      return;
    }
    cubit.save(item);
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
      await ErrorUtils.showErrorDialog(context, [
        'Houve um erro ao realizar a impressão de consignado, entre em contato com o T.I.',
      ]);
    }
  }
}
