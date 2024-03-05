import 'package:ageiscme_data/services/etiqueta/etiqueta_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EtiquetaPageFrmCubit extends Cubit<EtiquetaPageFrmState> {
  final EtiquetaService service;
  final EtiquetaModel etiquetaModel;
  EtiquetaPageFrmCubit({
    required this.service,
    required this.etiquetaModel,
  }) : super(
          EtiquetaPageFrmState(etiqueta: etiquetaModel),
        );

  void save(EtiquetaModel etiqueta) async {
    try {
      (String message, EtiquetaModel etiqueta)? result =
          await service.save(etiqueta);
      if (result == null) return;

      emit(
        EtiquetaPageFrmState(
          message: result.$1,
          saved: true,
          etiqueta: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EtiquetaPageFrmState(
          error: ex.toString(),
          etiqueta: etiqueta,
        ),
      );
    }
  }

  void clear() {
    emit(EtiquetaPageFrmState(etiqueta: EtiquetaModel.empty()));
  }
}

class EtiquetaPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final EtiquetaModel etiqueta;

  EtiquetaPageFrmState({
    required this.etiqueta,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
