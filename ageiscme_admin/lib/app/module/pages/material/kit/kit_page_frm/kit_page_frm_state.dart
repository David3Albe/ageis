import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitPageFrmCubit extends Cubit<KitPageFrmState> {
  final KitService service;
  final KitModel kitModel;
  KitPageFrmCubit({
    required this.service,
    required this.kitModel,
  }) : super(
          KitPageFrmState(kit: kitModel),
        );

  Future save(KitModel kit, Function(KitModel)? afterSave) async {
    try {
      (String message, KitModel kit)? result = await service.save(kit);
      if (result == null) return null;
      if (afterSave != null) afterSave(result.$2);

      emit(
        KitPageFrmState(
          message: result.$1,
          saved: true,
          kit: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitPageFrmState(
          error: ex.toString(),
          kit: kit,
        ),
      );
    }
  }

  void clear() {
    emit(KitPageFrmState(kit: KitModel.empty()));
  }
}

class KitPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final KitModel kit;

  KitPageFrmState({
    required this.kit,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
