import 'package:ageiscme_data/services/kit_cor/kit_cor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitCorPageFrmCubit extends Cubit<KitCorPageFrmState> {
  final KitCorService service;
  final KitCorModel kitCorModel;
  KitCorPageFrmCubit({
    required this.service,
    required this.kitCorModel,
  }) : super(
          KitCorPageFrmState(kitCor: kitCorModel),
        );

  void save(
    KitCorModel kitCor,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, KitCorModel kitCor)? result = await service.save(kitCor);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        KitCorPageFrmState(
          message: result.$1,
          saved: true,
          kitCor: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitCorPageFrmState(
          error: ex.toString(),
          kitCor: kitCor,
        ),
      );
    }
  }

  void clear() {
    emit(KitCorPageFrmState(kitCor: KitCorModel.empty()));
  }
}

class KitCorPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final KitCorModel kitCor;

  KitCorPageFrmState({
    required this.kitCor,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
