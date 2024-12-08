import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/packagings_print/packaging_print/packagings_packaging_print_dto.dart';
import 'package:ageiscme_impressoes/dto/packagings_print/packagings_print_dto.dart';
import 'package:ageiscme_impressoes/prints/packagings_printer/packagings_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class EmbalagemPageFrmImpressaoController {
  EmbalagemPageFrmImpressaoController();

  List<PackagingsPackagingPrintDTO> printPackagings = [];
  void Function()? refreshMethod;

  void setPackagings(List<EmbalagemModel> packagings) {
    printPackagings = packagings
        .map(
          (local) => PackagingsPackagingPrintDTO(
            name: local.nome ?? '',
            tagId: local.cod ?? 0,
            selected: false,
          ),
        )
        .toList();
    printPackagings.sort((a, b) => a.name.compareTo(b.name));
  }

  void refreshSelecteds(bool selecteds) {
    printPackagings.forEach((element) {
      element.selected = selecteds;
    });
    if (refreshMethod != null) refreshMethod!();
  }

  void print(BuildContext context) async {
    List<PackagingsPackagingPrintDTO> printPackagingsSelected =
        printPackagings.where((package) => package.selected == true).toList();

    LoadingController loading = LoadingController(context: context);

    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();

    PackagingsPrintDTO print = PackagingsPrintDTO(
      companyCod: auth?.instituicao?.cod ?? 0,
      companyName: auth?.instituicao?.nome ?? '',
      packagings: printPackagingsSelected,
    );

    await PackagingsController(context: context, packagingsPrint: print)
        .print();
    loading.close(context, true);
    Navigator.of(context).pop();
  }
}
