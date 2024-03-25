import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_impressao_rotulados/item_page_frm_impressao_rotulados_controller.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/print_button_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:flutter/material.dart';

class ItemPageFrmImpressaoRotulados extends StatefulWidget {
  const ItemPageFrmImpressaoRotulados({
    Key? key,
    required this.rotulado,
  }) : super(key: key);

  final ItemRotuladoResponseDTO rotulado;

  @override
  State<ItemPageFrmImpressaoRotulados> createState() =>
      _ItemPageFrmImpressaoRotuladosState(
        rotulado: rotulado,
      );
}

class _ItemPageFrmImpressaoRotuladosState
    extends State<ItemPageFrmImpressaoRotulados> {
  _ItemPageFrmImpressaoRotuladosState({
    required this.rotulado,
  });
  final ItemRotuladoResponseDTO rotulado;
  late final ItemPageFrmImpressaoRotuladosController _controller;

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Sel.',
      readonly: false,
      onClick: (value, checked) => value.selecionado = checked,
      onHeaderCheck: _controller.refreshSelecteds,
      field: 'selecionado',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Etiqueta',
      field: 'idEtiqueta',
    ),
    CustomDataColumn(
      text: 'Item',
      field: 'nomeItem',
    ),
    CustomDataColumn(
      text: 'Proprietário',
      field: 'nomeProprietario',
    ),
    CustomDataColumn(
      text: 'Tipo Processo Normal',
      field: 'nomeTipoProcessoNormal',
    ),
  ];

  @override
  void initState() {
    _controller = ItemPageFrmImpressaoRotuladosController();
    _controller.setarItens(rotulado);
    super.initState();
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
              text: 'Seleção para impressão',
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
          minWidth: size.width * .5,
          maxWidth: size.width * .5,
          minHeight: size.height * .5,
          maxHeight: size.height * .8,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(right: 14),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    CustomCheckboxWidget(
                      checked: _controller.agruparPorProprietario,
                      setValue: (context, setValueWidget) =>
                          _controller.setProprietario = setValueWidget,
                      onClick: (value) {
                        _controller.agruparPorProprietario = value;
                        _controller.agruparPorTipoProcesso = false;
                        _controller.setTipoProcesso!(false);
                      },
                      text: 'Proprietário',
                    ),
                    CustomCheckboxWidget(
                      checked: _controller.agruparPorTipoProcesso,
                      setValue: (context, setValueWidget) =>
                          _controller.setTipoProcesso = setValueWidget,
                      onClick: (value) {
                        _controller.agruparPorTipoProcesso = value;
                        _controller.agruparPorProprietario = false;
                        _controller.setProprietario!(false);
                      },
                      text: 'Tipo de Processo',
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: size.height * .3,
                  maxHeight: size.height * .5,
                ),
                child: PlutoGridWidget(
                  refreshWidgetBuilder: (context, refreshWidget) =>
                      _controller.refreshMethod = refreshWidget,
                  columns: colunas,
                  items: _controller.printItens,
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
            PrintButtonWidget(onPressed: () => _controller.print(context)),
          ],
        ),
      ],
    );
  }
}
