import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EpiDescritorPageFrmCubit extends Cubit<EpiDescritorPageFrmState> {
  final EpiDescritorService service;
  final EpiDescritorModel epiDescritorModel;
  EpiDescritorPageFrmCubit({
    required this.service,
    required this.epiDescritorModel,
  }) : super(
          EpiDescritorPageFrmState(epiDescritor: epiDescritorModel),
        );

  void save(EpiDescritorModel epiDescritor) async {
    try {
      (String message, EpiDescritorModel epiDescritor)? result =
          await service.save(epiDescritor);
      if (result == null) return;
      emit(
        EpiDescritorPageFrmState(
          message: result.$1,
          saved: true,
          epiDescritor: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EpiDescritorPageFrmState(
          error: ex.toString(),
          epiDescritor: epiDescritor,
        ),
      );
    }
  }

  void clear() {
    emit(EpiDescritorPageFrmState(epiDescritor: EpiDescritorModel.empty()));
  }
}

class EpiDescritorPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final EpiDescritorModel epiDescritor;

  EpiDescritorPageFrmState({
    required this.epiDescritor,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
