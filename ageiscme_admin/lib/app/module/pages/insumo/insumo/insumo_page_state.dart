import 'package:ageiscme_data/services/insumo/insumo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoPageCubit extends Cubit<InsumoPageState> {
  final InsumoService service;
  InsumoPageCubit({required this.service})
      : super(
          InsumoPageState(
            insumos: [],
            loading: false,
          ),
        );

  void loadInsumo() async {
    emit(InsumoPageState(loading: true, insumos: []));
    try {
      List<InsumoModel> insumos = await service.GetAll();
      emit(InsumoPageState(loading: false, insumos: insumos));
    } on Exception catch (ex) {
      emit(
        InsumoPageState(
          loading: false,
          insumos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(InsumoModel insumo) async {
    try {
      (String, InsumoModel)? result = await service.delete(insumo);
      if (result == null) return;
      emit(
        InsumoPageState(
          loading: false,
          insumos: state.insumos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoPageState(
          loading: false,
          insumos: state.insumos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class InsumoPageState {
  final bool loading;
  final bool deleted;
  final List<InsumoModel> insumos;
  final String error;
  final String message;

  InsumoPageState({
    required this.loading,
    required this.insumos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
