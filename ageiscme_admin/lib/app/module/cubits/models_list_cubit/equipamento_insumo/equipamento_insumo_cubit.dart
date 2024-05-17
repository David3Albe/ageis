import 'package:ageiscme_data/services/equipamento_insumo/equipamento_insumo_service.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EquipamentoInsumoCubit extends Cubit<EquipamentoInsumoState> {
  EquipamentoInsumoCubit() : super(EquipamentoInsumoState(obj: null));

  void loadFilter({
    required EquipamentoInsumoDTO filter,
  }) async {
    emit(EquipamentoInsumoState(obj: null, loading: true));
    EquipamentoInsumoResponseDTO? equipamentoInsumoResponse =
        await EquipamentoInsumoService().Filter(filter);
    emit(EquipamentoInsumoState(obj: equipamentoInsumoResponse));
  }

  void refresh() => emit(EquipamentoInsumoState(obj: state.obj));

  void reload() {
    emit(EquipamentoInsumoState(obj: state.obj, loading: true));
    emit(EquipamentoInsumoState(obj: state.obj));
  }
}

class EquipamentoInsumoState {
  EquipamentoInsumoResponseDTO? obj;
  bool loading;
  EquipamentoInsumoState({
    this.obj,
    this.loading = false,
  });
}
