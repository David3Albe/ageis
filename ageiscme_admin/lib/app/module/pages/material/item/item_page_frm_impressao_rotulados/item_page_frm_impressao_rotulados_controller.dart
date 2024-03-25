import 'package:ageiscme_impressoes/dto/folha_rotulado_print/folha_rotulado_item_print/folha_rotulado_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/folha_rotulado_print/folha_rotulado_print_dto.dart';
import 'package:ageiscme_impressoes/prints/folha_rotulado_printer/folha_rotulado_controller.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_item_response/item_rotulado_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:flutter/material.dart';

class ItemPageFrmImpressaoRotuladosController {
  ItemPageFrmImpressaoRotuladosController();

  List<FolhaRotuladoItemPrintDTO> printItens = [];
  ItemRotuladoItemResponseDTO? dto;
  void Function()? refreshMethod;
  bool? agruparPorProprietario = true;
  bool? agruparPorTipoProcesso = false;

  Function(bool)? setProprietario;
  Function(bool)? setTipoProcesso;

  void setarItens(
    ItemRotuladoResponseDTO dto,
  ) {
    dto = dto;
    printItens = dto.itens
        .map(
          (item) => FolhaRotuladoItemPrintDTO(
            nomeItem: item.nome,
            idEtiqueta: item.idEtiqueta,
            selecionado: false,
            nomeProprietario:
                dto.proprietarios[item.codProprietario]?.nome ?? '',
            nomeTipoProcessoNormal:
                dto.tiposProcessoNormal[item.codTipoProcessoNormal]?.nome ?? '',
          ),
        )
        .toList();
  }

  void refreshSelecteds(bool selecteds) {
    printItens.forEach((element) {
      element.selecionado = selecteds;
    });
    if (refreshMethod != null) refreshMethod!();
  }

  void print(BuildContext context) async {
    List<FolhaRotuladoItemPrintDTO> printItensSelected =
        printItens.where((package) => package.selecionado == true).toList();

    LoadingController loading = LoadingController(context: context);

    List<String> tipos = [];
    bool Function(String, FolhaRotuladoItemPrintDTO) validacao;
    if (agruparPorProprietario == true) {
      tipos =
          printItensSelected.map((e) => e.nomeProprietario).toSet().toList();
      validacao = (tipo, element) => element.nomeProprietario == tipo;
    } else if (agruparPorTipoProcesso == true) {
      tipos = printItensSelected
          .map((e) => e.nomeTipoProcessoNormal)
          .toSet()
          .toList();
      validacao = (tipo, element) => element.nomeTipoProcessoNormal == tipo;
    } else {
      ToastUtils.showCustomToastWarning(
        context,
        'Selecione o agrupamento, proprietário ou tipo de processo',
      );
      return;
    }

    Map<String, List<FolhaRotuladoItemPrintDTO>> printItensAgrouped = {};
    tipos.sort();
    for (String tipo in tipos) {
      printItensAgrouped.addEntries(
        [
          MapEntry(
            tipo,
            printItensSelected
                .where((element) => validacao(tipo, element))
                .toList(),
          ),
        ],
      );
    }

    FolhaRotuladoPrintDTO print = FolhaRotuladoPrintDTO(
      itensPorTipo: printItensAgrouped,
    );

    await FolhaRotuladoPrintController(context: context, dto: print).print();
    loading.close(context, true);
    Navigator.of(context).pop();
  }
}
