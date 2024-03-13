import 'package:ageiscme_data/services/insumo/insumo_service.dart';
import 'package:ageiscme_models/filters/insumo/insumo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoCubit extends Cubit<InsumoState> {
  InsumoCubit() : super(InsumoState(objs: []));

  void loadAll() async {
    emit(InsumoState(objs: [], loading: true));
    List<InsumoModel> insumos = await InsumoService().GetAll();
    emit(InsumoState(objs: insumos));
  }

  void loadFilter(InsumoFilter filter) async {
    emit(InsumoState(objs: [], loading: true));
    List<InsumoModel> insumos = await InsumoService().filter(filter);
    emit(InsumoState(objs: insumos));
  }

  void clear() => emit(InsumoState(objs: []));
}

class InsumoState {
  List<InsumoModel> objs;
  bool loading;
  InsumoState({required this.objs, this.loading = false});
}
