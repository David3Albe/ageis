import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/stage_functions_controller.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesController {
  late final StageFunctionsPrintDTO dto;
  late final ProcessoEtapaCubit etapaCubit;
  late final EquipamentoCubit equipamentoCubit;
  late final ArsenalEstoqueCubit estoqueCubit;

  ProcessoEtapaPageFrmImprimirFuncoesController({required int stageCod}) {
    dto = StageFunctionsPrintDTO(
      stageCod: stageCod,
      printTagLocal: true,
      finish: true,
    );
    etapaCubit = ProcessoEtapaCubit();
    etapaCubit.loadFilter(
      ProcessoEtapaFilter(
        codigo: dto.stageCod,
        carregarTiposProcesso: true,
        carregarTiposProcessoEtapaInicial: true,
      ),
    );
    equipamentoCubit = EquipamentoCubit();
    estoqueCubit = ArsenalEstoqueCubit();
  }

  void etapaCubitListener(
    BuildContext context,
    ProcessoEtapaState state,
  ) {
    if (state.processosEtapas.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Etapa não pode ser identificada, tente novamente ou entre em contato com o suporte',
      );
      Navigator.of(context).pop();
      return;
    } else if (state.processosEtapas.length > 1) {
      ToastUtils.showCustomToastWarning(
        context,
        'Mais de uma etapa foram identificadas, tente novamente ou entre em contato com o suporte',
      );
      Navigator.of(context).pop();
      return;
    }

    ProcessoEtapaModel etapa = state.processosEtapas.first;
    dto.entry = etapa.exigeLeituraEntrada;
    dto.exit = etapa.exigeLeituraSaida;
    int? codEquipamento = etapa.codEquipamento;
    int? codEstoque = etapa.codEstoque;
    if (codEquipamento == null && codEstoque == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário definir o Equipamento ou Estoque da Etapa',
      );
      Navigator.of(context).pop();
      return;
    } else if (codEquipamento != null && codEstoque != null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário definir apenas um Equipamento ou um Estoque da Etapa, não pode ter ambos',
      );
      Navigator.of(context).pop();
      return;
    }

    if (codEquipamento != null) {
      equipamentoCubit.loadFilter(EquipamentoFilter(cod: codEquipamento));
    } else if (codEstoque != null) {
      estoqueCubit.loadFilter(ArsenalEstoqueFilter(cod: codEstoque));
    }
  }

  void equipamentoCubitListener(
    BuildContext context,
    EquipamentoState state,
  ) {
    if (state.objs.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Equipamento não pode ser identificada, tente novamente ou entre em contato com o suporte',
      );
      Navigator.of(context).pop();
      return;
    } else if (state.objs.length > 1) {
      ToastUtils.showCustomToastWarning(
        context,
        'Mais de um Equipamento foram identificadas, tente novamente ou entre em contato com o suporte',
      );
      Navigator.of(context).pop();
      return;
    }
    EquipamentoModel equipamento = state.objs.first;
    dto.localName = equipamento.nome;
    dto.localTag = equipamento.codBarra;
  }

  void estoqueCubitListener(
    BuildContext context,
    ArsenalEstoqueState state,
  ) {
    if (state.arsenaisEstoques.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Estoque não pode ser identificada, tente novamente ou entre em contato com o suporte',
      );
      Navigator.of(context).pop();
      return;
    } else if (state.arsenaisEstoques.length > 1) {
      ToastUtils.showCustomToastWarning(
        context,
        'Mais de um Estoque foram identificadas, tente novamente ou entre em contato com o suporte',
      );
      Navigator.of(context).pop();
      return;
    }
    ArsenalEstoqueModel estoque = state.arsenaisEstoques.first;
    dto.localName = estoque.nome;
    dto.localTag = estoque.codBarra;
  }

  void cancelarImpressao(BuildContext context) {
    Navigator.of(context).pop();
  }

  void imprimir(BuildContext context) async {
    LoadingController loading = LoadingController(context: context);
    InstituicaoModel? instituicao = await InstituicaoService().findFirst();
    if (instituicao?.nome == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Instituição não informada, tente novamente ou entre em contato com o suporte',
      );
      return;
    }
    dto.instituitionName = instituicao!.nome;
    dto.instituitionCod = instituicao.cod;
    await StageFunctionsPrinterController(
      context: context,
      stageFunctionsPrint: dto,
    ).print();
    loading.close(context, true);
    Navigator.of(context).pop();
  }
}
