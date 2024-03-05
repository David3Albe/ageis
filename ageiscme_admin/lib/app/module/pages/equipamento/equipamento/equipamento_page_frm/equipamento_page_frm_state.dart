import 'package:ageiscme_data/services/equipamento/equipamento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EquipamentoPageFrmCubit extends Cubit<EquipamentoPageFrmState> {
  final EquipamentoService service;
  final EquipamentoModel equipamentoModel;
  EquipamentoPageFrmCubit({
    required this.service,
    required this.equipamentoModel,
  }) : super(
          EquipamentoPageFrmState(equipamento: equipamentoModel),
        );

  void save(EquipamentoModel equipamento) async {
    try {
      (String message, EquipamentoModel equipamento)? result =
          await service.save(equipamento);
      if (result == null) return;
      emit(
        EquipamentoPageFrmState(
          message: result.$1,
          saved: true,
          equipamento: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EquipamentoPageFrmState(
          error: ex.toString(),
          equipamento: equipamento,
        ),
      );
    }
  }

  void clear() {
    emit(EquipamentoPageFrmState(equipamento: EquipamentoModel.empty()));
  }
}

class EquipamentoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final EquipamentoModel equipamento;

  EquipamentoPageFrmState({
    required this.equipamento,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
