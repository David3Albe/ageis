import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_fluxo/controller/processo_tipo_fluxo_page_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/custom_default_button_widget.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/custom_diagram_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoTipoFluxoPagePresenter extends StatefulWidget {
  final ProcessoTipoModel processoTipo;
  final bool canEdit;
  final int? initialClickOn;
  final Future<List<String>> Function({required int id})? onDetailSearchItems;
  final void Function() onCancel;

  const ProcessoTipoFluxoPagePresenter({
    required this.processoTipo,
    required this.canEdit,
    required this.onCancel,
    this.initialClickOn,
    this.onDetailSearchItems,
  });

  @override
  State<ProcessoTipoFluxoPagePresenter> createState() =>
      _ProcessoTipoFluxoPagePresenterState();
}

class _ProcessoTipoFluxoPagePresenterState
    extends State<ProcessoTipoFluxoPagePresenter> {
  late final ProcessoTipoFluxoPageController controller;

  @override
  void initState() {
    controller =
        ProcessoTipoFluxoPageController(processoTipo: widget.processoTipo);
    controller.inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TitleWidget(
                text: 'Tipo Fluxo ' + widget.processoTipo.nome,
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: CustomDiagramWidget(
                  onDetailSearchItems: widget.onDetailSearchItems,
                  canEdit: widget.canEdit,
                  objects: controller.getRects,
                  defaultHeight: 40,
                  defaultWidth: 70,
                  initialClickOn: widget.initialClickOn,
                  itemsAddable: controller.getItemAddable,
                  clearWidgetBuilder: (context, clearMethod) =>
                      controller.clearMethod = clearMethod,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Spacer(),
            if (widget.canEdit)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomDefaultButtonWidget(
                  icon: Icons.save,
                  text: 'Confirmar Edição',
                  onPressed: () {
                    controller.save();
                    widget.onCancel();
                  },
                  cor: Colors.green.shade400,
                  corHovered: Colors.green.shade500,
                ),
              ),
            if (widget.canEdit)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CleanButtonWidget(onPressed: controller.clear),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CustomDefaultButtonWidget(
                icon: Symbols.cancel,
                text: widget.canEdit ? 'Cancelar' : 'Fechar',
                onPressed: widget.onCancel,
                cor: Colors.red.shade400,
                corHovered: Colors.red.shade500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
