import 'package:ageiscme_impressoes/dto/company_locals_print/company_locals_print_dto.dart';
import 'package:ageiscme_impressoes/dto/company_locals_print/company_locals_print_local_dto.dart/company_locals_print_local_dto.dart';
import 'package:ageiscme_impressoes/prints/company_locals_printer/company_locals_printer_controller.dart';
import 'package:ageiscme_models/models/instituicao/instituicao_model.dart';
import 'package:ageiscme_models/models/local_instituicao/local_instituicao_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:flutter/material.dart';

class InstituicaoPageFrmImpressaoController {
  final InstituicaoModel instituicao;
  InstituicaoPageFrmImpressaoController({
    required this.instituicao,
  });

  List<CompanyLocalsPrintLocalDTO> printLocals = [];
  void Function()? refreshMethod;

  void setLocals(List<LocalInstituicaoModel> locais) {
    printLocals = locais
        .map(
          (local) => CompanyLocalsPrintLocalDTO(
            name: local.nome ?? '',
            tagId: local.codBarra!,
            selected: false,
          ),
        )
        .toList();
  }

  void atualizarSelecionados(bool selecionado) {
    printLocals.forEach((element) {
      element.selected = selecionado;
    });
    if (refreshMethod != null) refreshMethod!();
  }

  void print(
    BuildContext context,
    void Function() onPrinted,
  ) async {
    List<CompanyLocalsPrintLocalDTO> printLocalsSelected =
        printLocals.where((local) => local.selected == true).toList();

    if (instituicao.nome == null) {
      ToastUtils.showCustomToastError(context, 'A instituição está sem nome.');
      return;
    }

    LoadingController loading = LoadingController(context: context);

    CompanyLocalsPrintDTO print = CompanyLocalsPrintDTO(
      companyName: instituicao.nome!,
      locals: printLocalsSelected,
    );
    CompanyLocalsPrinterController controller = CompanyLocalsPrinterController(
      companyLocalsPrint: print,
      context: context,
    );
    await controller.print();
    loading.close(context, true);
    onPrinted();
  }
}
