import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page_frm/instituicao_page_frm_impressao/instituicao_page_frm_impressao_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/print_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:flutter/material.dart';

class InstituicaoPageFrmImpressao extends StatefulWidget {
  const InstituicaoPageFrmImpressao({
    Key? key,
    required this.instituicao,
    required this.locais,
  }) : super(key: key);

  final InstituicaoModel instituicao;
  final List<LocalInstituicaoModel> locais;

  @override
  State<InstituicaoPageFrmImpressao> createState() =>
      _InstituicaoPageFrmImpressaoState(
        instituicao: instituicao,
        locais: locais,
      );
}

class _InstituicaoPageFrmImpressaoState
    extends State<InstituicaoPageFrmImpressao> {
  _InstituicaoPageFrmImpressaoState({
    required this.instituicao,
    required this.locais,
  });
  final InstituicaoModel instituicao;
  final List<LocalInstituicaoModel> locais;
  late final InstituicaoPageFrmImpressaoController _controller;

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Sel.',
      readonly: false,
      onClick: (value, checked) => value.selected = checked,
      onHeaderCheck: _controller.atualizarSelecionados,
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
        InstituicaoPageFrmImpressaoController(instituicao: instituicao);
    _controller.setLocals(locais);
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
                  items: _controller.printLocals,
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
