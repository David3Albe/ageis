import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/arsenais_print/arsenais_print_dto.dart';
import 'package:ageiscme_impressoes/dto/arsenais_print/arsenal_print/arsenal_print_dto.dart';
import 'package:ageiscme_impressoes/prints/arsenais_printer/arsenais_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ArsenalEstoquePageFrmImpressaoController {
  ArsenalEstoquePageFrmImpressaoController();

  List<ArsenalPrintDTO> arsenaisPrint = [];
  void Function()? refreshMethod;

  void setArsenais(List<ArsenalEstoqueModel> arsenais) {
    arsenaisPrint = arsenais
        .map(
          (arsenal) => ArsenalPrintDTO(
            name: arsenal.nome ?? '',
            codBarra: arsenal.codBarra!,
            selected: false,
          ),
        )
        .toList();
    arsenaisPrint.sort((a, b) => a.name.compareTo(b.name));
  }

  void refreshSelecteds(bool selecteds) {
    arsenaisPrint.forEach((element) {
      element.selected = selecteds;
    });
    if (refreshMethod != null) refreshMethod!();
  }

  void print(BuildContext context) async {
    List<ArsenalPrintDTO> printArsenaisSelected =
        arsenaisPrint.where((package) => package.selected == true).toList();

    LoadingController loading = LoadingController(context: context);

    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();

    ArsenaisPrintDTO print = ArsenaisPrintDTO(
      companyCod: auth?.instituicao?.cod ?? 0,
      companyName: auth?.instituicao?.nome ?? '',
      arsenais: printArsenaisSelected,
    );

    await ArsenaisPrintController(context: context, dto: print)
        .print();
    loading.close(context, true);
    Navigator.of(context).pop();
  }
}
