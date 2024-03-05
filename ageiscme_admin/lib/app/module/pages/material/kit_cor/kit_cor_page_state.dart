import 'package:ageiscme_data/services/kit_cor/kit_cor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitCorPageCubit extends Cubit<KitCorPageState> {
  final KitCorService service;
  KitCorPageCubit({required this.service})
      : super(
          KitCorPageState(
            kitsCor: [],
            loading: false,
          ),
        );

  void loadKitCor() async {
    emit(KitCorPageState(loading: true, kitsCor: []));
    try {
      List<KitCorModel> kitsCor = await service.GetAll();
      emit(KitCorPageState(loading: false, kitsCor: kitsCor));
    } on Exception catch (ex) {
      emit(
        KitCorPageState(
          loading: false,
          kitsCor: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(KitCorModel kitCor) async {
    try {
      (String, KitCorModel)? result = await service.delete(kitCor);
      if (result == null) return;

      emit(
        KitCorPageState(
          loading: false,
          kitsCor: state.kitsCor,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitCorPageState(
          loading: false,
          kitsCor: state.kitsCor,
          error: ex.toString(),
        ),
      );
    }
  }
}

class KitCorPageState {
  final bool loading;
  final bool deleted;
  final List<KitCorModel> kitsCor;
  final String error;
  final String message;

  KitCorPageState({
    required this.loading,
    required this.kitsCor,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
