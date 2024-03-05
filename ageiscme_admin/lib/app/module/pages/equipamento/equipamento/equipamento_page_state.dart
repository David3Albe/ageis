import 'package:ageiscme_data/services/equipamento/equipamento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EquipamentoPageCubit extends Cubit<EquipamentoPageState> {
  final EquipamentoService service;
  EquipamentoPageCubit({required this.service})
      : super(
          EquipamentoPageState(
            equipamentos: [],
            loading: false,
          ),
        );

  void loadEquipamento() async {
    emit(EquipamentoPageState(loading: true, equipamentos: []));
    try {
      List<EquipamentoModel> equipamentos = await service.GetAll();
      emit(EquipamentoPageState(loading: false, equipamentos: equipamentos));
    } on Exception catch (ex) {
      emit(
        EquipamentoPageState(
          loading: false,
          equipamentos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(EquipamentoModel equipamento) async {
    try {
      (String, EquipamentoModel)? result = await service.delete(equipamento);
      if (result == null) return;

      emit(
        EquipamentoPageState(
          loading: false,
          equipamentos: state.equipamentos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EquipamentoPageState(
          loading: false,
          equipamentos: state.equipamentos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class EquipamentoPageState {
  final bool loading;
  final bool deleted;
  final List<EquipamentoModel> equipamentos;
  final String error;
  final String message;

  EquipamentoPageState({
    required this.loading,
    required this.equipamentos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
