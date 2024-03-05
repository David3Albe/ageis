import 'package:ageiscme_data/services/tipo_documento/tipo_documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TipoDocumentoPageCubit extends Cubit<TipoDocumentoPageState> {
  final TipoDocumentoService service;
  TipoDocumentoPageCubit({required this.service})
      : super(
          TipoDocumentoPageState(
            tiposDocumento: [],
            loading: false,
          ),
        );

  void loadTipoDocumento() async {
    emit(TipoDocumentoPageState(loading: true, tiposDocumento: []));
    try {
      List<TipoDocumentoModel> tiposDocumento = await service.GetAll();
      emit(
        TipoDocumentoPageState(
          loading: false,
          tiposDocumento: tiposDocumento,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TipoDocumentoPageState(
          loading: false,
          tiposDocumento: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(TipoDocumentoModel tipoDocumento) async {
    try {
      (String, TipoDocumentoModel)? result = await service.delete(tipoDocumento);
      if (result == null) return;
      emit(
        TipoDocumentoPageState(
          loading: false,
          tiposDocumento: state.tiposDocumento,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TipoDocumentoPageState(
          loading: false,
          tiposDocumento: state.tiposDocumento,
          error: ex.toString(),
        ),
      );
    }
  }
}

class TipoDocumentoPageState {
  final bool loading;
  final bool deleted;
  final List<TipoDocumentoModel> tiposDocumento;
  final String error;
  final String message;

  TipoDocumentoPageState({
    required this.loading,
    required this.tiposDocumento,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
