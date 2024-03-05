import 'package:ageiscme_data/services/equipamento/equipamento_service.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EquipamentoCubit extends Cubit<EquipamentoState> {
  EquipamentoCubit() : super(EquipamentoState(objs: []));

  void loadAll() async {
    emit(EquipamentoState(objs: [], loading: true));
    List<EquipamentoModel> equipamentos = await EquipamentoService().GetAll();
    emit(EquipamentoState(objs: equipamentos));
  }

  void loadFilter(EquipamentoFilter filter) async {
    emit(
      EquipamentoState(
        objs: [],
        loading: true,
      ),
    );
    List<EquipamentoModel> objs = await EquipamentoService().Filter(filter);
    emit(
      EquipamentoState(
        objs: objs,
        loaded: true,
      ),
    );
  }

  void clear() => emit(EquipamentoState(objs: []));
}

class EquipamentoState {
  List<EquipamentoModel> objs;
  bool loading;
  bool loaded;
  EquipamentoState({
    required this.objs,
    this.loading = false,
    this.loaded = false,
  });
}
