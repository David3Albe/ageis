import 'package:ageiscme_data/services/etiqueta/etiqueta_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EtiquetaPageCubit extends Cubit<EtiquetaPageState> {
  final EtiquetaService service;
  EtiquetaPageCubit({required this.service})
      : super(
          EtiquetaPageState(
            etiquetas: [],
            loading: false,
          ),
        );

  void loadEtiqueta() async {
    emit(EtiquetaPageState(loading: true, etiquetas: []));
    try {
      List<EtiquetaModel> etiquetas = await service.GetAll();
      emit(EtiquetaPageState(loading: false, etiquetas: etiquetas));
    } on Exception catch (ex) {
      emit(
        EtiquetaPageState(
          loading: false,
          etiquetas: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(EtiquetaModel etiqueta) async {
    try {
      (String, EtiquetaModel)? result = await service.delete(etiqueta);
      if (result == null) return;

      emit(
        EtiquetaPageState(
          loading: false,
          etiquetas: state.etiquetas,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EtiquetaPageState(
          loading: false,
          etiquetas: state.etiquetas,
          error: ex.toString(),
        ),
      );
    }
  }
}

class EtiquetaPageState {
  final bool loading;
  final bool deleted;
  final List<EtiquetaModel> etiquetas;
  final String error;
  final String message;

  EtiquetaPageState({
    required this.loading,
    required this.etiquetas,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
