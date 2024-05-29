import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/filters/proprietario/proprietario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_consignado/item_consignado_model.dart';
import 'package:ageiscme_processo/app/module/blocs/item_descritor_cubit.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/blocs/proprietario_cubit.dart';
import 'package:ageiscme_processo/app/module/enums/consigned_item_page_type.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoPageConsignedItemsDialog extends StatefulWidget {
  const ProcessoPageConsignedItemsDialog({
    Key? key,
  });

  @override
  State<ProcessoPageConsignedItemsDialog> createState() =>
      _ProcessoPageConsignedItemsDialogState();
}

class _ProcessoPageConsignedItemsDialogState
    extends State<ProcessoPageConsignedItemsDialog> {
  late final ItemDescritorCubit itemDescritorCubit;
  late final ProprietarioCubit proprietarioCubit;
  late final ProcessoLeituraMontagemModel leitura;
  final List<CustomDataColumn> columns = [];
  late int? codDescritorItem;
  late int? codProprietario;
  late String? refForncedor;
  late bool? implantavel;
  late final bool readonlyRegisterFields;
  late final ItemProcessoModel? item;

  @override
  void initState() {
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    leitura = processoCubit.state.processo;
    item = leitura.leituraAtual.itemEmLeitura!;
    codDescritorItem =
        leitura.leituraAtual.itemEmLeitura?.getDescritor(leitura)?.cod;
    codProprietario = leitura.leituraAtual.itemEmLeitura?.codProprietario;
    refForncedor = leitura.leituraAtual.itemEmLeitura?.refFornecedor;
    implantavel = leitura.leituraAtual.itemEmLeitura?.implantavel;
    readonlyRegisterFields = codDescritorItem != null;
    itemDescritorCubit = ItemDescritorCubit();
    itemDescritorCubit.loadFilter(
      ItemDescritorFilter(
        apenasAtivos: true,
        apenasConsignados: true,
        cod: codDescritorItem,
        carregarImagem: false,
        carregarItensConsignados: true,
      ),
    );
    proprietarioCubit = ProprietarioCubit();
    proprietarioCubit.loadFilter(ProprietarioFilter(apenasAtivos: true));
    createColumns(processoCubit.state.processo);
    super.initState();
  }

  void createColumns(ProcessoLeituraMontagemModel processoLeitura) {
    columns.add(
      CustomDataColumn(
        text: 'Descrição',
        field: 'descricao',
      ),
    );
    switch (processoLeitura.leituraAtual.consignado!.tipoAcesso) {
      case (ConsignedItemPageTypeDart.Registration):
        columns.add(
          CustomDataColumn(
            text: 'QTDE',
            field: 'quantidade',
            type: CustomDataColumnType.Integer,
            negative: false,
          ),
        );
        columns.add(
          CustomDataColumn(
            text: 'ENTREGUE',
            readonly: false,
            field: 'conferenciaCadastro',
            type: CustomDataColumnType.Integer,
            negative: false,
            enableAutoEditing: true,
          ),
        );
        break;
      case (ConsignedItemPageTypeDart.Reception):
        columns.add(
          CustomDataColumn(
            text: 'ENTREGUE',
            field: 'conferenciaCadastro',
            type: CustomDataColumnType.Integer,
            negative: false,
          ),
        );
        columns.add(
          CustomDataColumn(
            text: 'RECEBIDA',
            readonly: false,
            field: 'conferenciaRecepcao',
            type: CustomDataColumnType.Integer,
            negative: false,
            enableAutoEditing: true,
          ),
        );
        break;
      case (ConsignedItemPageTypeDart.Preparation):
        columns.add(
          CustomDataColumn(
            text: 'RECEBIDA',
            field: 'conferenciaRecepcao',
            type: CustomDataColumnType.Integer,
            negative: false,
          ),
        );
        columns.add(
          CustomDataColumn(
            text: 'PREPARADA',
            readonly: false,
            field: 'conferenciaPreparo',
            type: CustomDataColumnType.Integer,
            negative: false,
            enableAutoEditing: true,
          ),
        );
        break;
      case (ConsignedItemPageTypeDart.Purge):
        columns.add(
          CustomDataColumn(
            text: 'PREPARADA',
            field: 'conferenciaPreparo',
            type: CustomDataColumnType.Integer,
            negative: false,
          ),
        );
        columns.add(
          CustomDataColumn(
            text: 'EXPURGO',
            readonly: false,
            field: 'conferenciaExpurgo',
            type: CustomDataColumnType.Integer,
            negative: false,
            enableAutoEditing: true,
          ),
        );
        break;
    }
  }

  @override
  void dispose() {
    itemDescritorCubit.close();
    proprietarioCubit.close();
    super.dispose();
  }

  late Future Function() submitMethod;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Consignado'),
      content: Container(
        constraints: BoxConstraints(
          minHeight: size.height * 0.4,
          minWidth: size.width * .4,
          maxHeight: size.height * 0.9,
          maxWidth: size.width * .4,
        ),
        child: Column(
          children: [
            BlocBuilder<ItemDescritorCubit, ItemDescritorState>(
              bloc: itemDescritorCubit,
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: LoadingWidget());
                }
                List<ItemDescritorModel> items = state.itensDescritores;
                ItemDescritorModel? item = items
                    .where(
                      (element) => element.cod == codDescritorItem,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<ItemDescritorModel>(
                  readOnly: readonlyRegisterFields,
                  initialValue: item,
                  sourceList: items,
                  onChanged: (value) => codDescritorItem = value?.cod,
                  placeholder: 'Descritor Item',
                );
              },
            ),
            BlocBuilder<ProprietarioCubit, ProprietarioState>(
              bloc: proprietarioCubit,
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: LoadingWidget());
                }
                List<ProprietarioModel> proprietarios = state.proprietarios;
                ProprietarioModel? item = proprietarios
                    .where(
                      (element) => element.cod == codProprietario,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<ProprietarioModel>(
                  readOnly: readonlyRegisterFields,
                  initialValue: item,
                  sourceList: proprietarios,
                  onChanged: (value) => codProprietario = value?.cod,
                  placeholder: 'Proprietario',
                );
              },
            ),
            TextFieldStringWidget(
              readOnly: readonlyRegisterFields,
              placeholder: 'Ref. Fornecedor',
              initialValue: refForncedor,
              onChanged: (value) => refForncedor = value,
            ),
            CustomCheckboxWidget(
              readonly: readonlyRegisterFields,
              align: MainAxisAlignment.start,
              text: 'Implantável',
              checked: implantavel,
              onClick: (value) => implantavel = value,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
            ),
            Expanded(
              child: PlutoGridWidget(
                onChanged: onChanged,
                items: item!.itensConsignados!,
                columns: columns,
                submitBuilder: (context, method) => submitMethod = method,
              ),
            ),
          ],
        ),
      ),
      actions: [
        InsertButtonWidget(
          onPressed: SalvarItemDescritor,
        ),
        CancelButtonUnfilledWidget(
          onPressed: CancelarItemDescritor,
        ),
      ],
    );
  }

  void onChanged(
    PlutoGridOnChangedEvent event,
    Map<PlutoRow, ItemConsignadoModel> rowsObject,
  ) {
    if (event.column.field == 'conferenciaExpurgo') {
      rowsObject[event.row]!.conferenciaExpurgo = event.value;
    } else if (event.column.field == 'conferenciaRecepcao') {
      rowsObject[event.row]!.conferenciaRecepcao = event.value;
    } else if (event.column.field == 'conferenciaPreparo') {
      rowsObject[event.row]!.conferenciaPreparo = event.value;
    } else if (event.column.field == 'conferenciaCadastro') {
      rowsObject[event.row]!.conferenciaCadastro = event.value;
    }
  }

  Future? SalvarItemDescritor() async {
    LoadingController loading = LoadingController(context: context);
    await submitMethod.call();
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    ProcessoLeituraMontagemModel processoState = processoCubit.state.processo;
    if (!_validaCampos(leitura: processoState, loading: loading)) {
      loading.closeDefault();
      return;
    }

    processoState.leituraAtual.decisao =
        DecisaoEnum.ConfirmarDefinirItemConsignado;

    String lastCode = processoCubit.state.processo.filaLeituras!.removeLast();
    loading.closeDefault();
    await processoCubit.readCode(lastCode);
  }

  Future CancelarItemDescritor() async {
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    processoCubit.state.processo.leituraAtual.decisao =
        DecisaoEnum.CancelarDefinirItemConsignado;
    String lastCode = processoCubit.state.processo.filaLeituras!.removeLast();
    await processoCubit.readCode(lastCode);
  }

  bool _validaCampos({
    required ProcessoLeituraMontagemModel leitura,
    required LoadingController loading,
  }) {
    if (codDescritorItem == null) {
      loading.closeDefault();
      ToastUtils.showCustomToastWarning(
        context,
        'Selecione um Descritor de Item',
      );
      return false;
    }
    if (codProprietario == null) {
      loading.closeDefault();
      ToastUtils.showCustomToastWarning(
        context,
        'Selecione um Proprietário',
      );
      return false;
    }
    if (refForncedor == null || refForncedor!.isEmpty) {
      loading.closeDefault();
      ToastUtils.showCustomToastWarning(
        context,
        'Informe o campo Ref. Fornecedor',
      );
      return false;
    }
    for (ItemConsignadoModel item in item!.itensConsignados!) {
      if (_validaCampoConsignado(item)) {
        loading.closeDefault();
        ToastUtils.showCustomToastWarning(
          context,
          'Informe o valor conferido do consignado ${item.descricao}',
        );
        return false;
      }
      if (leitura.leituraAtual.consignado!.tipoAcesso ==
          ConsignedItemPageTypeDart.Purge) {
        if (item.conferenciaExpurgo! > item.conferenciaPreparo!) {
          loading.closeDefault();
          WarningUtils.showWarningDialog(
            context,
            'O valor de expurgo conferido não pode ser maior que o valor de preparo do consignado ${item.descricao}',
          );
          return false;
        }
      }
    }
    return true;
  }

  bool _validaCampoConsignado(ItemConsignadoModel item) {
    switch (leitura.leituraAtual.consignado!.tipoAcesso) {
      case ConsignedItemPageTypeDart.Reception:
        return _validaValorConsignado(item.conferenciaRecepcao);
      case ConsignedItemPageTypeDart.Preparation:
        return _validaValorConsignado(item.conferenciaPreparo);
      case ConsignedItemPageTypeDart.Purge:
        return _validaValorConsignado(item.conferenciaExpurgo);
      case ConsignedItemPageTypeDart.Registration:
        return _validaValorConsignado(item.conferenciaCadastro);
    }
    throw Exception('Tipo de acesso não definido');
  }

  bool _validaValorConsignado(int? value) => value == null;
}
