import 'package:ageiscme_data/services/equipamento_manutencao/equipamento_manutencao_service.dart';
import 'package:ageiscme_models/filters/equipamento_manutencao/equipamento_manutencao_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EquipamentoManutencaoPageCubit
    extends Cubit<EquipamentoManutencaoPageState> {
  final EquipamentoManutencaoService service;
  EquipamentoManutencaoPageCubit({required this.service})
      : super(
          EquipamentoManutencaoPageState(
            equipamentosManutencoes: [],
            loading: false,
          ),
        );

  void loadEquipamentoManutencao() async {
    emit(
      EquipamentoManutencaoPageState(
        loading: true,
        equipamentosManutencoes: [],
      ),
    );
    try {
      List<EquipamentoManutencaoModel> equipamentosManutencoes =
          await service.GetAll();
      emit(
        EquipamentoManutencaoPageState(
          loading: false,
          equipamentosManutencoes: equipamentosManutencoes,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EquipamentoManutencaoPageState(
          loading: false,
          equipamentosManutencoes: [],
          error: ex.toString(),
        ),
      );
    }
  }

  Future getScreenData(EquipamentoManutencaoFilter filter) async {
    emit(
      EquipamentoManutencaoPageState(
        loading: true,
        equipamentosManutencoes: [],
      ),
    );
    try {
      List<EquipamentoManutencaoModel> equipamentosManutencoes =
          await service.GetScreenData(filter);
      emit(
        EquipamentoManutencaoPageState(
          loading: false,
          equipamentosManutencoes: equipamentosManutencoes,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EquipamentoManutencaoPageState(
          loading: false,
          equipamentosManutencoes: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(EquipamentoManutencaoModel equipamentoManutencao) async {
    try {
      (String, EquipamentoManutencaoModel)? result =
          await service.delete(equipamentoManutencao);
      if (result == null) return;
      emit(
        EquipamentoManutencaoPageState(
          loading: false,
          equipamentosManutencoes: state.equipamentosManutencoes,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EquipamentoManutencaoPageState(
          loading: false,
          equipamentosManutencoes: state.equipamentosManutencoes,
          error: ex.toString(),
        ),
      );
    }
  }
}

class EquipamentoManutencaoPageState {
  final bool loading;
  final bool deleted;
  final List<EquipamentoManutencaoModel> equipamentosManutencoes;
  final String error;
  final String message;

  EquipamentoManutencaoPageState({
    required this.loading,
    required this.equipamentosManutencoes,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
