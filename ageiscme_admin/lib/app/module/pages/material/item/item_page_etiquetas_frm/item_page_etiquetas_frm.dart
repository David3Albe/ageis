import 'package:ageiscme_admin/app/module/pages/material/item/item_page_etiquetas_frm/item_etiquetas_page_state.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/item/item_etiqueta/item_etiqueta_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_response/item_etiqueta_usuario_response/item_etiqueta_usuario_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemPageEtiquetasFrm extends StatefulWidget {
  const ItemPageEtiquetasFrm({
    Key? key,
    this.item,
  }) : super(key: key);

  final ItemModel? item;

  @override
  State<ItemPageEtiquetasFrm> createState() => _ItemPageEtiquetasFrmState();
}

class _ItemPageEtiquetasFrmState extends State<ItemPageEtiquetasFrm> {
  _ItemPageEtiquetasFrmState();

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Etiqueta',
      field: 'idEtiqueta',
      width: 105,
    ),
    CustomDataColumn(
      text: 'Qtde. Processos',
      field: 'qtdeProcessos',
      width: 130,
    ),
    CustomDataColumn(
      text: 'Data Descarte',
      field: 'dataDescarte',
      type: CustomDataColumnType.DateTime,
      width: 125,
    ),
    CustomDataColumn(
      text: 'Cód. Item',
      field: 'codItem',
      width: 95,
    ),
    CustomDataColumn(
      text: 'Descrição',
      field: 'nome',
    ),
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      width: 90,
    ),
    CustomDataColumn(
      text: 'Usuário Alteração',
      field: 'codUsuarioAlteracao',
      valueConverter: (value) => usuarios[value]?.nome ?? '',
    ),
  ];

  late final ItemEtiquetasPageCubit _cubit;
  Map<int, ItemEtiquetaUsuarioResponseDTO> usuarios = {};

  @override
  void initState() {
    _cubit = ItemEtiquetasPageCubit(service: ItemService());
    if (widget.item != null) {
      _cubit.loadEtiquetasFilter(ItemEtiquetaDTO(codItem: widget.item!.cod!));
    }
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: const EdgeInsets.all(8.0),
      titlePadding: const EdgeInsets.all(8.0),
      actionsPadding: const EdgeInsets.all(8.0),
      title: Row(
        children: [
          const Expanded(
            child: TitleWidget(
              text: 'Etiquetas do Item',
            ),
          ),
          const Spacer(),
          CloseButtonWidget(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: Container(
        constraints: BoxConstraints(
          minWidth: size.width * .6,
          maxWidth: size.width * .6,
          minHeight: size.height * .5,
          maxHeight: size.height * .8,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(right: 14),
          child: Column(
            children: [
              DropDownSearchApiWidget<ItemModel>(
                textFunction: (item) => item.EtiquetaDescricaoText(),
                initialValue: widget.item,
                search: (str) => ItemService().Filter(
                  ItemFilter(numeroRegistros: 30, termoPesquisa: str),
                ),
                onChanged: (value) {
                  _cubit.loadEtiquetasFilter(
                    ItemEtiquetaDTO(
                      codItem: value?.cod,
                    ),
                  );
                },
                placeholder: 'Item',
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              Container(
                constraints: BoxConstraints(
                  minHeight: size.height * .3,
                  maxHeight: size.height * .5,
                ),
                child:
                    BlocBuilder<ItemEtiquetasPageCubit, ItemEtiquetasPageState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    usuarios = state.item?.usuarios ?? {};
                    if (state.loading) {
                      return const Center(child: LoadingWidget());
                    }
                    return PlutoGridWidget(
                      columns: colunas,
                      items: state.item?.itens ?? [],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            CancelButtonUnfilledWidget(onPressed: Navigator.of(context).pop),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
