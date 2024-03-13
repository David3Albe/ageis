import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento_insumo/equipamento_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_insumos/equipamento_insumo_page_frm/equipamento_insumo_page_frm.dart';
import 'package:ageiscme_data/services/equipamento_insumo/equipamento_insumo_service.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_delete/equipamento_insumo_delete_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_save/equipamento_insumo_save_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/insumo/insumo_filter.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_consumo_response/equipamento_insumo_consumo_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_delete_response/equipamento_insumo_delete_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_response_dto.dart';
import 'package:compartilhados/alert_dialog/form_alert_dialog_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:flutter/material.dart';

class EquipamentoInsumoPageController {
  EquipamentoInsumoResponseDTO? dto;
  late final EquipamentoInsumoCubit cubit;
  late final EquipamentoCubit equipamentoCubit;
  late final InsumoCubit insumoCubit;

  EquipamentoInsumoPageController() {
    insumoCubit = InsumoCubit();
    insumoCubit.loadFilter(
      InsumoFilter(
        ordenarPorNomeAsc: true,
      ),
    );
    equipamentoCubit = EquipamentoCubit();
    equipamentoCubit.loadFilter(
      EquipamentoFilter(
        ordenarPorNomeCrescente: true,
      ),
    );
    cubit = EquipamentoInsumoCubit();
    loadData();
  }

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Equipamento',
      field: 'codEquipamento',
      valueConverter: (value) {
        return dto!.equipamentos
            .where((element) => element.cod == value)
            .firstOrNull
            ?.nome;
      },
    ),
    CustomDataColumn(
      text: 'Insumo',
      field: 'codInsumo',
      valueConverter: (value) {
        return dto!.insumos
            .where((element) => element.cod == value)
            .firstOrNull
            ?.nome;
      },
    ),
    CustomDataColumn(text: 'Consumo por Processo', field: 'consumoPorProcesso'),
  ];

  void refresh() {
    cubit.refresh();
  }

  void loadData() {
    cubit.loadFilter(filter: EquipamentoInsumoDTO());
  }

  Future _openForm(BuildContext context, EquipamentoInsumoSaveDTO? dto) async {
    Size size = MediaQuery.of(context).size;
    bool? value = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FormAlertDialogWidget(
          title: Row(
            children: [
              const Expanded(
                child: TitleWidget(
                  text: 'Cadastro de Insumos do Equipamento',
                ),
              ),
              const Spacer(),
              CloseButtonWidget(
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          content: Container(
            width: size.width * 0.8,
            height: size.height * 0.7,
            constraints: const BoxConstraints(
              minWidth: 700,
              minHeight: 700,
              maxHeight: 900,
              maxWidth: 900,
            ),
            child: EquipamentoInsumoPageFrm(
              dto: dto,
            ),
          ),
        );
      },
    );
    if (value == true) loadData();
  }

  Future adicionar(
    BuildContext context,
    int? codEquipamento,
    int? codInsumo,
  ) async {
    await _openForm(
      context,
      EquipamentoInsumoSaveDTO(
        cod: 0,
        codEquipamento: codEquipamento,
        codInsumo: codInsumo,
      ),
    );
  }

  Future editar(
    BuildContext context,
    EquipamentoInsumoConsumoResponseDTO consumo,
  ) async {
    await _openForm(
      context,
      EquipamentoInsumoSaveDTO(
        cod: consumo.cod,
        codEquipamento: consumo.codEquipamento,
        codInsumo: consumo.codInsumo,
        consumoPorProcesso: consumo.consumoPorProcesso,
        tstamp: consumo.tstamp,
      ),
    );
  }

  Future remover(
    BuildContext context,
    EquipamentoInsumoConsumoResponseDTO consumo,
  ) async {
    String equipamento =
        'Equipamento: ${dto?.equipamentos.where((element) => element.cod == consumo.codEquipamento).firstOrNull?.nome}';
    String insumo =
        'Insumo: ${dto?.insumos.where((element) => element.cod == consumo.codInsumo).firstOrNull?.nome}';
    String consumoPorProcesso =
        'Consumo Por Processo: ${consumo.consumoPorProcesso}';
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Vinculação do equipamento ao insumo?\n\n$equipamento\n$insumo\n$consumoPorProcesso',
    );
    if (!confirmacao) return;
    LoadingController loading = LoadingController(context: context);
    (String, EquipamentoInsumoDeleteResponseDTO)? result =
        await EquipamentoInsumoService()
            .Delete(EquipamentoInsumoDeleteDTO(cod: consumo.cod));
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    loading.close(context, true);
    cubit.state.obj?.consumos
        .removeWhere((element) => element.cod == consumo.cod);
    cubit.refresh();
  }
}
