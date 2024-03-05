import 'package:ageiscme_data/services/insumo/insumo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoPageFrmCubit extends Cubit<InsumoPageFrmState> {
  final InsumoService service;
  final InsumoModel insumoModel;
  InsumoPageFrmCubit({
    required this.service,
    required this.insumoModel,
  }) : super(
          InsumoPageFrmState(insumo: insumoModel),
        );

  void save(InsumoModel insumo) async {
    try {
      (String message, InsumoModel insumo)? result = await service.save(insumo);
      if (result == null) return;
      emit(
        InsumoPageFrmState(
          message: result.$1,
          saved: true,
          insumo: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoPageFrmState(
          error: ex.toString(),
          insumo: insumo,
        ),
      );
    }
  }

  void clear() {
    emit(InsumoPageFrmState(insumo: InsumoModel.empty()));
  }
}

class InsumoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final InsumoModel insumo;

  InsumoPageFrmState({
    required this.insumo,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
