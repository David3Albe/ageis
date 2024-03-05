import 'package:ageiscme_data/services/deposito_insumo/deposito_insumo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DepositoInsumoPageCubit extends Cubit<DepositoInsumoPageState> {
  final DepositoInsumoService service;
  DepositoInsumoPageCubit({required this.service})
      : super(
          DepositoInsumoPageState(
            depositosInsumo: [],
            loading: false,
          ),
        );

  void loadDepositoInsumo() async {
    emit(DepositoInsumoPageState(loading: true, depositosInsumo: []));
    try {
      List<DepositoInsumoModel> depositosInsumo = await service.GetAll();
      emit(
        DepositoInsumoPageState(
          loading: false,
          depositosInsumo: depositosInsumo,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DepositoInsumoPageState(
          loading: false,
          depositosInsumo: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(DepositoInsumoModel depositoInsumo) async {
    try {
      (String, DepositoInsumoModel)? result =
          await service.delete(depositoInsumo);
      if (result == null) return;
      emit(
        DepositoInsumoPageState(
          loading: false,
          depositosInsumo: state.depositosInsumo,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DepositoInsumoPageState(
          loading: false,
          depositosInsumo: state.depositosInsumo,
          error: ex.toString(),
        ),
      );
    }
  }
}

class DepositoInsumoPageState {
  final bool loading;
  final bool deleted;
  final List<DepositoInsumoModel> depositosInsumo;
  final String error;
  final String message;

  DepositoInsumoPageState({
    required this.loading,
    required this.depositosInsumo,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
