import 'package:ageiscme_data/services/equipamento_manutencao/equipamento_manutencao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EquipamentoManutencaoPageFrmCubit
    extends Cubit<EquipamentoManutencaoPageFrmState> {
  final EquipamentoManutencaoService service;
  final EquipamentoManutencaoModel equipamentoManutencaoModel;
  EquipamentoManutencaoPageFrmCubit({
    required this.service,
    required this.equipamentoManutencaoModel,
  }) : super(
          EquipamentoManutencaoPageFrmState(
            equipamentoManutencao: equipamentoManutencaoModel,
          ),
        );

  void save(EquipamentoManutencaoModel equipamentoManutencao) async {
    try {
      (
        String message,
        EquipamentoManutencaoModel equipamentoManutencao
      )? result = await service.save(equipamentoManutencao);
      if (result == null) return;

      emit(
        EquipamentoManutencaoPageFrmState(
          message: result.$1,
          saved: true,
          equipamentoManutencao: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EquipamentoManutencaoPageFrmState(
          error: ex.toString(),
          equipamentoManutencao: equipamentoManutencao,
        ),
      );
    }
  }

  void clear() {
    emit(
      EquipamentoManutencaoPageFrmState(
        equipamentoManutencao: EquipamentoManutencaoModel.empty(),
      ),
    );
  }
}

class EquipamentoManutencaoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final EquipamentoManutencaoModel equipamentoManutencao;

  EquipamentoManutencaoPageFrmState({
    required this.equipamentoManutencao,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
