import 'package:ageiscme_data/services/destino_residuo/destino_residuo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DestinoResiduoCubit extends Cubit<DestinoResiduoState> {
  DestinoResiduoCubit() : super(DestinoResiduoState(objs: []));

  void loadAll() async {
    emit(DestinoResiduoState(objs: [], loading: true));
    List<DestinoResiduoModel> destinosResiduos =
        await DestinoResiduoService().GetAll();
    emit(DestinoResiduoState(objs: destinosResiduos));
  }

  void clear() => emit(DestinoResiduoState(objs: []));

  void refresh() async {
    emit(DestinoResiduoState(objs: state.objs, loading: true));
    await Future.delayed(const Duration(milliseconds: 100));
    emit(DestinoResiduoState(objs: state.objs));
  }
}

class DestinoResiduoState {
  List<DestinoResiduoModel> objs;
  bool loading;
  DestinoResiduoState({required this.objs, this.loading = false});
}
