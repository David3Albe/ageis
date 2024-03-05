import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitDescritorPageFrmCubit extends Cubit<KitDescritorPageFrmState> {
  final KitDescritorService service;
  final KitDescritorModel kitDescritorModel;
  KitDescritorPageFrmCubit({
    required this.service,
    required this.kitDescritorModel,
  }) : super(
          KitDescritorPageFrmState(kitDescritor: kitDescritorModel),
        );

  void save(KitDescritorModel kitDescritor) async {
    try {
      (String message, KitDescritorModel kitDescritor)? result =
          await service.save(kitDescritor);
      if (result == null) return;

      emit(
        KitDescritorPageFrmState(
          message: result.$1,
          saved: true,
          kitDescritor: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitDescritorPageFrmState(
          error: ex.toString(),
          kitDescritor: kitDescritor,
        ),
      );
    }
  }

  void clear() {
    emit(KitDescritorPageFrmState(kitDescritor: KitDescritorModel.empty()));
  }
}

class KitDescritorPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final KitDescritorModel kitDescritor;

  KitDescritorPageFrmState({
    required this.kitDescritor,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
