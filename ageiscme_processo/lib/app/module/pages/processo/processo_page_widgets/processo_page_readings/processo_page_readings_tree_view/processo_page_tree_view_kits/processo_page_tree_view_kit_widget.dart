import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/enums/kit_processo_status.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_kits/processo_page_tree_view_kit_status_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoPageTreeViewKitWidget extends StatelessWidget {
  const ProcessoPageTreeViewKitWidget({
    required this.kit,
    required this.processoLeitura,
  });
  final KitProcessoModel kit;
  final ProcessoLeituraMontagemModel processoLeitura;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scale = size.width / 1920;
    double fontSize = getFontSize(size);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: [
            kit.selecionado == true
                ? InkWell(
                    onTap: () => toogleSelected(context, kit),
                    child: Icon(
                      Symbols.stat_minus_1,
                      size: fontSize,
                    ),
                  )
                : InkWell(
                    onTap: () => toogleSelected(context, kit),
                    child: Icon(
                      Symbols.chevron_right,
                      size: fontSize,
                    ),
                  ),
            SelectableText(
              onTap: () => showKit(context, kit),
              '${kit.codBarra} ${kit.descritor == null ? '' : kit.descritor!.nome} ${getItensKitLidos()}',
              style: TextStyle(
                fontSize: 16 * scale,
                color: getAllItensKitLidos()
                    ? null
                    : KitProcessoStatus.getCorTextItemFromStatus(
                        KitProcessoStatus.naoLidos,
                      ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: kit.selecionado == true,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0 * scale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: getStatus(kit),
            ),
          ),
        ),
      ],
    );
  }

  void showKit(BuildContext context, KitProcessoModel kit) {
    final ProcessoLeituraCubit cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    cubit.showKit(kit);
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

  String getItensKitLidos() {
    if (kit.preparado) {
      return '(${kit.itens == null ? 0 : kit.itens!.length}/${kit.itens!.where((element) => element.status != '3').length})';
    }
    return '(${kit.itens == null ? 0 : kit.itens!.length}/${kit.itensLidos == null ? 0 : kit.itensLidos!.length})';
  }

  bool getAllItensKitLidos() {
    if (kit.itens == null ||
        kit.itensLidos == null ||
        processoLeitura.leituraAtual.modoConsulta == true ||
        kit.preparado == true) return true;
    int itensParaLer = kit.itens!
        .where(
          (element) =>
              element.status != '3' &&
              element.status != '4' &&
              element.dataMatrixDanificado?.identificadoEmLeituraAtual !=
                  true &&
              element.lido != true,
        )
        .length;
    return itensParaLer == 0;
  }

  void toogleSelected(BuildContext context, KitProcessoModel kit) {
    final ProcessoLeituraCubit cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    cubit.toogleSelectedKit(kit);
  }

  List<Widget> getStatus(KitProcessoModel kit) {
    List<Widget> widgets = [];
    bool modoConsulta = processoLeitura.leituraAtual.modoConsulta == true;
    if (modoConsulta) {
      loadStatusModoConsulta(kit, widgets);
    }
    if (kit.preparado && !modoConsulta) loadStatusKitPreparado(kit, widgets);
    if (!kit.preparado && !modoConsulta) loadStatusLidos(kit, widgets);
    loadStatusDataMatrixDanificado(kit, widgets, modoConsulta);
    loadStatusFaltantes(kit, widgets, modoConsulta);
    if (!kit.preparado && !modoConsulta) loadStatusNaoLidos(kit, widgets);
    return widgets;
  }

  void loadStatusModoConsulta(KitProcessoModel kit, List<Widget> widgets) {
    List<ItemProcessoModel> itensSemPendenteOuDataMatrix = kit.itens!
        .where((element) => element.status != '3' && element.status != '4')
        .toList();

    widgets.add(
      ProcessoPageTreeViewKitStatusWidget(
        kit: kit,
        itens: itensSemPendenteOuDataMatrix,
        status: KitProcessoStatus.modoConsulta,
        expandido: true,
      ),
    );
  }

  void loadStatusKitPreparado(KitProcessoModel kit, List<Widget> widgets) {
    widgets.add(
      ProcessoPageTreeViewKitStatusWidget(
        kit: kit,
        itens: kit.itens!
            .where((element) => element.status != '3' && element.status != '4')
            .toList(),
        status: KitProcessoStatus.preparado,
        expandido: kit.statusExpandidos != null &&
            kit.statusExpandidos!.contains(KitProcessoStatus.preparado),
      ),
    );
  }

  void loadStatusLidos(KitProcessoModel kit, List<Widget> widgets) {
    if (kit.itensLidos == null) return;
    widgets.add(
      ProcessoPageTreeViewKitStatusWidget(
        kit: kit,
        itens: kit.itensLidos!
            .where(
              (element) =>
                  element.dataMatrixDanificado?.identificadoEmLeituraAtual !=
                  true,
            )
            .toList(),
        status: KitProcessoStatus.lidos,
        expandido: kit.statusExpandidos != null &&
            kit.statusExpandidos!.contains(KitProcessoStatus.lidos),
      ),
    );
  }

  void loadStatusDataMatrixDanificado(
    KitProcessoModel kit,
    List<Widget> widgets,
    bool modoConsulta,
  ) {
    if (kit.itens == null) return;
    List<ItemProcessoModel> itensDataMatrixDanificado = kit.itens!
        .where(
          (element) =>
              element.status == '4' &&
              (element.lido != true ||
                  element.dataMatrixDanificado?.identificadoEmLeituraAtual ==
                      true ||
                  modoConsulta),
        )
        .toList();
    if (itensDataMatrixDanificado.firstOrNull == null) return;
    widgets.add(
      ProcessoPageTreeViewKitStatusWidget(
        kit: kit,
        itens: itensDataMatrixDanificado,
        status: KitProcessoStatus.dataMatrixDanificado,
        expandido: kit.statusExpandidos != null &&
            kit.statusExpandidos!
                .contains(KitProcessoStatus.dataMatrixDanificado),
      ),
    );
  }

  void loadStatusFaltantes(
    KitProcessoModel kit,
    List<Widget> widgets,
    bool modoConsulta,
  ) {
    if (kit.itens == null) return;
    List<ItemProcessoModel> itensFaltantes = kit.itens!
        .where(
          (element) =>
              element.status == '3' &&
              (!kit.itensLidos!.map((e) => e.cod).contains(element.cod) ||
                  modoConsulta),
        )
        .toList();
    if (itensFaltantes.firstOrNull == null) return;
    widgets.add(
      ProcessoPageTreeViewKitStatusWidget(
        itens: itensFaltantes,
        kit: kit,
        status: KitProcessoStatus.faltantes,
        expandido: kit.statusExpandidos != null &&
            kit.statusExpandidos!.contains(KitProcessoStatus.faltantes),
      ),
    );
  }

  void loadStatusNaoLidos(KitProcessoModel kit, List<Widget> widgets) {
    if (kit.itens == null) return;
    List<ItemProcessoModel> itensNaoLidos = kit.itens!
        .where(
          (element) =>
              element.status != '3' &&
              element.status != '4' &&
              (kit.itensLidos == null ||
                  !kit.itensLidos!.map((e) => e.cod).contains(element.cod)),
        )
        .toList();

    if (itensNaoLidos.firstOrNull == null) {
      return;
    }
    widgets.add(
      ProcessoPageTreeViewKitStatusWidget(
        itens: itensNaoLidos,
        kit: kit,
        status: KitProcessoStatus.naoLidos,
        expandido: kit.statusExpandidos != null &&
            kit.statusExpandidos!.contains(KitProcessoStatus.naoLidos),
      ),
    );
  }
}
