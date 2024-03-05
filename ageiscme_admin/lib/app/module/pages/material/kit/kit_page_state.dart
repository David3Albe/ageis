import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitPageCubit extends Cubit<KitPageState> {
  final KitService service;
  KitPageCubit({required this.service})
      : super(
          KitPageState(
            kits: [],
            loading: false,
          ),
        );

  void loadKit() async {
    emit(KitPageState(loading: true, kits: []));
    try {
      List<KitModel> kits = await service.GetAll();
      emit(KitPageState(loading: false, kits: kits));
    } on Exception catch (ex) {
      emit(
        KitPageState(
          loading: false,
          kits: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(KitModel kit) async {
    try {
      (String, KitModel?)? result = await service.delete(kit);
      if (result == null) return;
      emit(
        KitPageState(
          loading: false,
          kits: state.kits,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitPageState(
          loading: false,
          kits: state.kits,
          error: ex.toString(),
        ),
      );
    }
  }
}

class KitPageState {
  final bool loading;
  final bool deleted;
  final List<KitModel> kits;
  final String error;
  final String message;

  KitPageState({
    required this.loading,
    required this.kits,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
