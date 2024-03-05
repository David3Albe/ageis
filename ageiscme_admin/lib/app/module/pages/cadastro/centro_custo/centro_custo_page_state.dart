import 'package:ageiscme_data/services/centro_custo/centro_custo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class CentroCustoPageCubit extends Cubit<CentroCustoPageState> {
  final CentroCustoService service;
  CentroCustoPageCubit({required this.service})
      : super(
          CentroCustoPageState(
            centrosCusto: [],
            loading: false,
          ),
        );

  void loadCentroCusto() async {
    emit(CentroCustoPageState(loading: true, centrosCusto: []));
    try {
      List<CentroCustoModel> centrosCusto = await service.GetAll();
      emit(CentroCustoPageState(loading: false, centrosCusto: centrosCusto));
    } on Exception catch (ex) {
      emit(
        CentroCustoPageState(
          loading: false,
          centrosCusto: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(CentroCustoModel centroCusto) async {
    try {
      (String, CentroCustoModel)? result = await service.delete(centroCusto);
      if (result == null) return;

      emit(
        CentroCustoPageState(
          loading: false,
          centrosCusto: state.centrosCusto,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        CentroCustoPageState(
          loading: false,
          centrosCusto: state.centrosCusto,
          error: ex.toString(),
        ),
      );
    }
  }
}

class CentroCustoPageState {
  final bool loading;
  final bool deleted;
  final List<CentroCustoModel> centrosCusto;
  final String error;
  final String message;

  CentroCustoPageState({
    required this.loading,
    required this.centrosCusto,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
