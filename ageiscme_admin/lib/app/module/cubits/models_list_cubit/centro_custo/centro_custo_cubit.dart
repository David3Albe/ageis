import 'package:ageiscme_data/services/centro_custo/centro_custo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class CentroCustoCubit extends Cubit<CentroCustoState> {
  CentroCustoCubit() : super(CentroCustoState(centrosCusto: []));

  void loadAll() async {
    emit(CentroCustoState(centrosCusto: state.centrosCusto, loading: true));
    emit(CentroCustoState(centrosCusto: await CentroCustoService().GetAll()));
  }

  void clear() => emit(CentroCustoState(centrosCusto: []));
}

class CentroCustoState {
  bool loading;
  List<CentroCustoModel> centrosCusto;

  CentroCustoState({required this.centrosCusto, this.loading = false});
}
