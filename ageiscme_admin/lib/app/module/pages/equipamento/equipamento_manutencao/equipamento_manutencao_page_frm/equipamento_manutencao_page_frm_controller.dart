import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_company/equipment_maintenance_company_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_employeer/equipment_maintenance_employeer_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_equipment/equipment_maintenance_equipment_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_print_dto.dart';
import 'package:ageiscme_impressoes/prints/equipment_maintenance_printer/equipment_maintenance_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class EquipamentoManutencaoPageFrmController {
  Future printTag(
    BuildContext context,
    EquipamentoManutencaoModel equipamentoManutencao,
  ) async {
    String? error;
    if (equipamentoManutencao.cod == null || equipamentoManutencao.cod == 0) {
      error =
          'É necessário ter a manutenção cadastrada para permitir a impressão da etiqueta';
    } else if (equipamentoManutencao.servicoTipo?.nome == null) {
      error =
          'É necessário definir o tipo de serviço para impressão da etiqueta';
    } else if (equipamentoManutencao.equipamento == null) {
      error = 'É necessário definir o equipamento para impressão da etiqueta';
    }
    if (error != null) {
      ToastUtils.showCustomToastWarning(context, error);
      return;
    }

    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();

    EquipmentMaintenancePrintDTO dto = EquipmentMaintenancePrintDTO(
      cod: equipamentoManutencao.cod!,
      company: EquipmentMaintenanceCompanyPrintDTO(
        cod: auth?.instituicao?.cod ?? 0,
        name: auth?.instituicao?.nome ?? '',
      ),
      employeer: EquipmentMaintenanceEmployeerPrintDTO(
        name: auth?.usuario?.nome ?? '',
        doc: auth?.usuario?.docClasse ?? '',
      ),
      impressionTime: DateTime.now(),
      serviceName: equipamentoManutencao.servicoTipo?.nome ?? '',
      equipment: EquipmentMaintenanceEquipmentPrintDTO(
        cod: equipamentoManutencao.codEquipamento!,
        name: equipamentoManutencao.equipamento?.nome ?? '',
      ),
    );

    LoadingController loading = LoadingController(context: context);
    await EquipmentMaintenanceController(
      context: context,
      equipmentMaintenance: dto,
    ).print();
    loading.closeDefault();
  }
}
