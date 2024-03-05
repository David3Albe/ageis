import 'package:ageiscme_data/services/centro_custo/centro_custo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class CentroCustoPageFrmCubit extends Cubit<CentroCustoPageFrmState> {
  final CentroCustoService service;
  final CentroCustoModel centroCustoModel;
  CentroCustoPageFrmCubit({
    required this.service,
    required this.centroCustoModel,
  }) : super(
          CentroCustoPageFrmState(centroCusto: centroCustoModel),
        );

  void save(CentroCustoModel centroCusto) async {
    try {
      (String message, CentroCustoModel centroCusto)? result =
          await service.save(centroCusto);
      if (result == null) return;

      emit(
        CentroCustoPageFrmState(
          message: result.$1,
          saved: true,
          centroCusto: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        CentroCustoPageFrmState(
          error: ex.toString(),
          centroCusto: centroCusto,
        ),
      );
    }
  }

  void clear() {
    emit(CentroCustoPageFrmState(centroCusto: CentroCustoModel.empty()));
  }
}

class CentroCustoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final CentroCustoModel centroCusto;

  CentroCustoPageFrmState({
    required this.centroCusto,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
