import 'package:ageiscme_admin/app/module/pages/arsenal/arsenal_estoque/arsenal_estoque_printer/arsenal_page_frm_impressao_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/print_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:flutter/material.dart';

class ArsenalPageFrmImpressao extends StatefulWidget {
  const ArsenalPageFrmImpressao({
    Key? key,
    required this.arsenais,
  }) : super(key: key);

  final List<ArsenalEstoqueModel> arsenais;

  @override
  State<ArsenalPageFrmImpressao> createState() =>
      _ArsenalPageFrmImpressaoState(
        arsenais: arsenais,
      );
}

class _ArsenalPageFrmImpressaoState
    extends State<ArsenalPageFrmImpressao> {
  _ArsenalPageFrmImpressaoState({
    required this.arsenais,
  });
  final List<ArsenalEstoqueModel> arsenais;
  late final ArsenalEstoquePageFrmImpressaoController _controller;

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Sel.',
      readonly: false,
      onClick: (value, checked) => value.selected = checked,
      onHeaderCheck: _controller.refreshSelecteds,
      field: 'selected',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Local',
      field: 'name',
    ),
  ];

  @override
  void initState() {
    _controller =
        ArsenalEstoquePageFrmImpressaoController();
    _controller.setArsenais(arsenais);
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
              Container(
                constraints: BoxConstraints(
                  minHeight: size.height * .3,
                  maxHeight: size.height * .5,
                ),
                child: PlutoGridWidget(
                  refreshWidgetBuilder: (context, refreshWidget) =>
                      _controller.refreshMethod = refreshWidget,
                  columns: colunas,
                  items: _controller.arsenaisPrint,
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
