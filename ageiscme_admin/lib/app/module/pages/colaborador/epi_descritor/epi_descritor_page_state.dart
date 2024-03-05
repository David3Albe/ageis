import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EpiDescritorPageCubit extends Cubit<EpiDescritorPageState> {
  final EpiDescritorService service;
  EpiDescritorPageCubit({required this.service})
      : super(
          EpiDescritorPageState(
            episDescritor: [],
            loading: false,
          ),
        );

  void loadEpiDescritor() async {
    emit(EpiDescritorPageState(loading: true, episDescritor: []));
    try {
      List<EpiDescritorModel> episDescritor = await service.GetAll();
      emit(EpiDescritorPageState(loading: false, episDescritor: episDescritor));
    } on Exception catch (ex) {
      emit(
        EpiDescritorPageState(
          loading: false,
          episDescritor: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(EpiDescritorModel epiDescritor) async {
    try {
      (String, EpiDescritorModel)? result = await service.delete(epiDescritor);
      if (result == null) return;
      emit(
        EpiDescritorPageState(
          loading: false,
          episDescritor: state.episDescritor,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EpiDescritorPageState(
          loading: false,
          episDescritor: state.episDescritor,
          error: ex.toString(),
        ),
      );
    }
  }
}

class EpiDescritorPageState {
  final bool loading;
  final bool deleted;
  final List<EpiDescritorModel> episDescritor;
  final String error;
  final String message;

  EpiDescritorPageState({
    required this.loading,
    required this.episDescritor,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
