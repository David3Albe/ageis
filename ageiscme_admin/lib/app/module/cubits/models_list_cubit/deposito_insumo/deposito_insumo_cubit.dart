import 'package:ageiscme_data/services/deposito_insumo/deposito_insumo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DepositoInsumoCubit extends Cubit<DepositoInsumoState> {
  DepositoInsumoCubit() : super(DepositoInsumoState(objs: []));

  void loadAll() async {
    emit(DepositoInsumoState(objs: [], loading: true));
    List<DepositoInsumoModel> depositosInsumos =
        await DepositoInsumoService().GetAll();
    emit(DepositoInsumoState(objs: depositosInsumos));
  }

  void clear() => emit(DepositoInsumoState(objs: []));
}

class DepositoInsumoState {
  List<DepositoInsumoModel> objs;
  bool loading;
  DepositoInsumoState({required this.objs, this.loading = false});
}
