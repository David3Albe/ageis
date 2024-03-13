import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_data/services/equipamento_insumo/equipamento_insumo_service.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_save/equipamento_insumo_save_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/insumo/insumo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_save_response/equipamento_insumo_save_response_dto.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:flutter/material.dart';

class EquipamentoInsumoPageFrmController {
  late final EquipamentoInsumoSaveDTO dto;
  List<EquipamentoModel> equipamentos = [];
  List<InsumoModel> insumos = [];
  late final EquipamentoCubit equipamentoCubit;
  late final InsumoCubit insumoCubit;
  EquipamentoModel? equipamento;
  InsumoModel? insumo;

  late final TextFieldNumberFloatWidget txtConsumoProcesso;

  EquipamentoInsumoPageFrmController({EquipamentoInsumoSaveDTO? baseDto}) {
    dto = baseDto ?? EquipamentoInsumoSaveDTO(cod: 0);
    equipamentoCubit = EquipamentoCubit();
    equipamentoCubit
        .loadFilter(EquipamentoFilter(ordenarPorNomeCrescente: true));
    insumoCubit = InsumoCubit();
    insumoCubit.loadFilter(InsumoFilter(ordenarPorNomeAsc: true));

    txtConsumoProcesso = TextFieldNumberFloatWidget(
      placeholder: 'Consumo por processo',
      onChanged: (String? str) {
        dto.consumoPorProcesso = str == null ? null : double.parse(str);
      },
    );

    txtConsumoProcesso.text = dto.consumoPorProcesso?.toString() ?? '';
    txtConsumoProcesso.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 10) {
        return 'Pode ter no máximo 10 caracteres';
      } else if (double.parse(str) <= 0) {
        return 'Deve ser maior que 0';
      }
      return '';
    });
  }

  void loadEquipamentos(EquipamentoState state) {
    equipamento = state.objs
        .where((element) => element.cod == dto.codEquipamento)
        .firstOrNull;
    equipamentos = state.objs.where((equip) => equip.ativo == true).toList();
  }

  void setEquipamento(EquipamentoModel? equipamento) {
    this.equipamento = equipamento;
    dto.codEquipamento = equipamento?.cod;
  }

  void loadInsumos(InsumoState state) {
    insumo =
        state.objs.where((element) => element.cod == dto.codInsumo).firstOrNull;
    insumos = state.objs.where((equip) => equip.ativo == true).toList();
  }

  void setInsumo(InsumoModel? insumo) {
    this.insumo = insumo;
    dto.codInsumo = insumo?.cod;
  }

  Future salvar(BuildContext context) async {
    if (!txtConsumoProcesso.valid) return;
    LoadingController loading = LoadingController(context: context);
    (String, EquipamentoInsumoSaveResponseDTO?)? result =
        await EquipamentoInsumoService().save(dto);
    if (result == null) {
      loading.closeDefault();
      return;
    }
    loading.closeDefault();
    ToastUtils.showCustomToastSucess(context, result.$1);
    Navigator.of(context).pop(true);
  }

  void cancelar(BuildContext context) {
    Navigator.of(context).pop(false);
  }
}
