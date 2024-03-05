import 'dart:convert';
import 'dart:typed_data';

import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/globals.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_object_preview/processo_page_object_preview_colors_widget.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';
// import 'package:dependencias_comuns/image_export.dart' as imgexp;

class ProcessoPageObjectPreviewWidget extends StatelessWidget {
  final ProcessoLeituraCubit? leituraCubit;
  const ProcessoPageObjectPreviewWidget({Key? key, this.leituraCubit});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: Globals.CARD_MIN_WIDTH,
          maxWidth: Globals.BIG_CARD_MAX_WIDTH,
          minHeight: Globals.PREVIEW_ITEM_MIN_HEIGHT,
          maxHeight: Globals.PREVIEW_ITEM_MAX_HEIGHT,
        ),
        decoration: const BoxDecoration(
          color: Cores.CorCards,
        ),
        child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
          bloc: leituraCubit,
          buildWhen: (previous, current) => needBuild(previous, current),
          builder: (context, state) {
            ItemProcessoModel? item = state.processo.getItemSelecionado();
            KitProcessoModel? kit = state.processo.leituraAtual.kits
                .where((element) => element.selecionado == true)
                .firstOrNull;
            if (kit == null &&
                item == null &&
                state.processo.leituraAtual.kitEmLeitura?.selecionado == true) {
              kit = state.processo.leituraAtual.kitEmLeitura;
            }
            String? foto = getFoto(item, kit, state.processo);
            Uint8List? bytes = foto != null ? base64.decode(foto) : null;
            Image? imagem;
            imagem = bytes != null ? Image.memory(bytes) : null;

            // if (bytes != null) {
            //   final originalImage = imgexp.decodeImage(bytes);
            //   final height = originalImage?.height ?? 0;
            //   final width = originalImage?.width ?? 0;
            //   imgexp.Image? img = originalImage;
            //   if (img != null) {
            //     if (height < width) img = imgexp.copyRotate(img, angle: 90);
            //     Uint8List imgToConvert = imgexp.encodePng(img);
            //     imagem = Image.memory(imgToConvert);
            //   }
            // }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      foto == null
                          ? const SizedBox()
                          : Expanded(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  imagem ?? const SizedBox(),
                                  if (kit != null)
                                    Positioned(
                                      right: 15,
                                      top: 15,
                                      child:
                                          ProcessoPageObjectPreviewColorsWidget(
                                        kit: kit,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  bool needBuild(ProcessoLeituraState previous, ProcessoLeituraState current) {
    if (current.rebuildType != ProcessoLeituraRebuildType.All) return false;
    ItemProcessoModel? itemPrevious = previous.processo.getItemSelecionado();
    ItemProcessoModel? itemCurrent = current.processo.getItemSelecionado();
    if (itemPrevious?.cod != itemCurrent?.cod) return true;

    KitProcessoModel? kitPrevious = previous.processo.leituraAtual.kits
        .where((element) => element.selecionado == true)
        .firstOrNull;
    KitProcessoModel? kitCurrent = current.processo.leituraAtual.kits
        .where((element) => element.selecionado == true)
        .firstOrNull;
    if (kitPrevious?.imagem != kitCurrent?.imagem) return true;
    return false;
  }

  String? getFoto(
    ItemProcessoModel? item,
    KitProcessoModel? kit,
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    String? fotoItem = getFotoItem(item, processoLeitura);
    if (fotoItem != null) return fotoItem;
    return getFotoKit(kit);
  }

  String? getFotoItem(
    ItemProcessoModel? item,
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    ItemDescritorModel? descritor = item?.getDescritor(processoLeitura);
    if (item == null || descritor == null || descritor.foto == null) {
      return null;
    }
    return descritor.foto;
  }

  String? getFotoKit(KitProcessoModel? kit) {
    if (kit == null || kit.descritor == null || kit.descritor!.imagem == null) {
      return null;
    }
    return kit.descritor!.imagem;
  }
}
