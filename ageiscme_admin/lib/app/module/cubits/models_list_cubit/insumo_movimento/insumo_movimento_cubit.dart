import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoMovimentoCubit extends Cubit<InsumoMovimentoState> {
  InsumoMovimentoCubit() : super(InsumoMovimentoState(objs: []));

  void loadAll() async {
    emit(InsumoMovimentoState(objs: [], loading: true));
    List<InsumoMovimentoModel> insumosMovimentos =
        await InsumoMovimentoService().GetAll();
    emit(InsumoMovimentoState(objs: insumosMovimentos));
  }

  void clear() => emit(InsumoMovimentoState(objs: []));
}

class InsumoMovimentoState {
  List<InsumoMovimentoModel> objs;
  bool loading;
  InsumoMovimentoState({required this.objs, this.loading = false});
}
