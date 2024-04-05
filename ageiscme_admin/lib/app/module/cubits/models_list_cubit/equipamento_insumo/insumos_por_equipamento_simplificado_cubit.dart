import 'package:ageiscme_data/services/equipamento_insumo/equipamento_insumo_service.dart';
import 'package:ageiscme_models/dto/insumos_por_equipamento_simplificado/insumos_por_equipamento_simplificado_dto.dart';
import 'package:ageiscme_models/response_dto/insumos_por_equipamento_simplificado/insumos_por_equipamento_simplificado_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumosPorEquipamentoSimplificadoCubit
    extends Cubit<InsumosPorEquipamentoSimplificadoState> {
  InsumosPorEquipamentoSimplificadoCubit()
      : super(InsumosPorEquipamentoSimplificadoState(obj: null));

  void load({
    required InsumosPorEquipamentoSimplificadoDTO filter,
  }) async {
    emit(InsumosPorEquipamentoSimplificadoState(obj: null, loading: true));
    (
      String,
      InsumosPorEquipamentoSimplificadoResponseDTO?
    )? equipamentoInsumoResponse = await EquipamentoInsumoService()
        .getInsumosPorEquipamentoSimplificado(filter);
    emit(
      InsumosPorEquipamentoSimplificadoState(
        obj: equipamentoInsumoResponse?.$2,
      ),
    );
  }

  void setEquipamento({int? codEquipamento}) => emit(
        InsumosPorEquipamentoSimplificadoState(
          obj: state.obj,
          codEquipamento: codEquipamento,
        ),
      );
}

class InsumosPorEquipamentoSimplificadoState {
  InsumosPorEquipamentoSimplificadoResponseDTO? obj;
  int? codEquipamento;
  bool loading;
  InsumosPorEquipamentoSimplificadoState({
    this.obj,
    this.loading = false,
    this.codEquipamento,
  });
}
