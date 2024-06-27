import 'package:ageiscme_data/services/deposito_insumo/deposito_insumo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DepositoInsumoPageFrmCubit extends Cubit<DepositoInsumoPageFrmState> {
  final DepositoInsumoService service;
  final DepositoInsumoModel depositoInsumoModel;
  DepositoInsumoPageFrmCubit({
    required this.service,
    required this.depositoInsumoModel,
  }) : super(
          DepositoInsumoPageFrmState(depositoInsumo: depositoInsumoModel),
        );

  void save(
    DepositoInsumoModel depositoInsumo,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, DepositoInsumoModel depositoInsumo)? result =
          await service.save(depositoInsumo);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        DepositoInsumoPageFrmState(
          message: result.$1,
          saved: true,
          depositoInsumo: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DepositoInsumoPageFrmState(
          error: ex.toString(),
          depositoInsumo: depositoInsumo,
        ),
      );
    }
  }

  void clear() {
    emit(
      DepositoInsumoPageFrmState(
        depositoInsumo: DepositoInsumoModel.empty(),
      ),
    );
  }
}

class DepositoInsumoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final DepositoInsumoModel depositoInsumo;

  DepositoInsumoPageFrmState({
    required this.depositoInsumo,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
