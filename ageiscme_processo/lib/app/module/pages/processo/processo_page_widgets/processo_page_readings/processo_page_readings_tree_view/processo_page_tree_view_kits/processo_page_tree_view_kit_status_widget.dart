import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/enums/item_processo_status.dart';
import 'package:ageiscme_processo/app/module/enums/kit_processo_status.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_kits/processo_page_tree_view_kit_status_item_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoPageTreeViewKitStatusWidget extends StatelessWidget {
  const ProcessoPageTreeViewKitStatusWidget({
    required this.itens,
    required this.status,
    required this.expandido,
    required this.kit,
    required this.processoLeitura,
  });
  final List<ItemProcessoModel> itens;
  final ProcessoLeituraMontagemModel processoLeitura;
  final KitProcessoModel kit;
  final int status;
  final bool expandido;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    (double, double?) escalaHeight = context.select(
      (ProcessoLeituraCubit cubit) => (
        cubit.state.processo.getEscala(),
        cubit.state.processo.getLineHeightPadraoBig()
      ),
    );
    double fontSize = getFontSize(size);
    fontSize = fontSize * escalaHeight.$1;
    double scale = size.width / 1920;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => toogleStatus(context, kit, status),
          child: Row(
            children: [
              expandido
                  ? Icon(
                      Symbols.stat_minus_1,
                      size: fontSize,
                    )
                  : Icon(
                      Symbols.chevron_right,
                      size: fontSize,
                    ),
              Text(
                '${KitProcessoStatus.getDescription(status)} (${itens.length})',
                style: TextStyle(
                  color: KitProcessoStatus.getCorFromStatus(status),
                  fontSize: 14 * scale * escalaHeight.$1,
                  height: escalaHeight.$2,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: expandido,
          child: Padding(
            padding: EdgeInsets.only(left: 32.0 * scale / escalaHeight.$1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: getItens(context, escalaHeight.$1),
            ),
          ),
        ),
      ],
    );
  }

  void toogleStatus(BuildContext context, KitProcessoModel kit, int status) {
    final ProcessoLeituraCubit cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    cubit.toogleStatusKit(kit, status);
  }

  double getFontSize(Size size) {
    double height = size.height;
    if (height > 900) {
      return 20;
    } else if (height > 800) {
      return 18;
    } else if (height > 700) {
      return 17;
    } else if (height > 600) {
      return 16;
    }
    return 14;
  }

  List<Widget> getItens(BuildContext context, double escala) {
    List<Widget> widgets = [];
    for (ItemProcessoModel item in itens) {
      widgets.add(
        Wrap(
          children: [
            ContextMenuRegion(
              contextMenu: GenericContextMenu(
                buttonStyle: ContextMenuButtonStyle(
                  textStyle: TextStyle(
                    fontSize: 14 * escala,
                  ),
                ),
                buttonConfigs: [
                  ContextMenuButtonConfig(
                    'Informar ${item.idEtiqueta} - ${item.descricao} como Data Matrix danificado ',
                    onPressed: () => setarItemDataMatrixDanificado(
                      context,
                      item,
                    ),
                  ),
                ],
              ),
              child: ProcessoPageTreeViewKitStatusItemWidget(
                item,
                color: getCorTextItemFromStatus(
                  cod: status,
                  item: item,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return widgets;
  }

  void setarItemDataMatrixDanificado(
    BuildContext context,
    ItemProcessoModel item,
  ) {
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    processoCubit.state.processo.leituraAtual.decisao =
        DecisaoEnum.DefinirItemDataMatrixDanificado;
    processoCubit.readCode(item.idEtiqueta);
  }

  Color getCorTextItemFromStatus({
    required ItemProcessoModel item,
    required int cod,
  }) {
    ProcessoEtapaModel? etapa = item.getKit(processoLeitura)?.getEtapa(processoLeitura);
    if (item.pendenteRecepcao == 1 &&
        processoLeitura.leituraAtual.codUsuarioQuebraFluxo == null &&
        item.status != ItemProcessoStatus.Pendente &&
        kit.preparado == false &&
        etapa?.preparo != true) {
      return const Color.fromARGB(255, 8, 216, 15);
    }

    switch (cod) {
      case KitProcessoStatus.lidos:
        return const Color.fromARGB(255, 0, 0, 0);
      case KitProcessoStatus.dataMatrixDanificado:
        return const Color.fromARGB(255, 139, 0, 0);
      case KitProcessoStatus.naoLidos:
        return const Color.fromARGB(255, 255, 0, 0);
      case KitProcessoStatus.faltantes:
        return const Color.fromARGB(255, 0, 0, 255);
      case KitProcessoStatus.preparado:
        return const Color.fromARGB(255, 78, 78, 78);
      case KitProcessoStatus.modoConsulta:
        return const Color.fromARGB(255, 37, 37, 37);
    }
    throw Exception('Kit Processo Status Tipo Não Definido');
  }
}
