import 'package:ageiscme_data/services/tipo_documento/tipo_documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TipoDocumentoCubit extends Cubit<TipoDocumentoState> {
  TipoDocumentoCubit() : super(TipoDocumentoState(tipoDocumentos: []));

  void loadAll() async {
    emit(
      TipoDocumentoState(tipoDocumentos: state.tipoDocumentos, loading: true),
    );
    emit(
      TipoDocumentoState(
        tipoDocumentos: await TipoDocumentoService().GetAll(),
      ),
    );
  }

  void clear() => emit(TipoDocumentoState(tipoDocumentos: []));
}

class TipoDocumentoState {
  bool loading;
  List<TipoDocumentoModel> tipoDocumentos;

  TipoDocumentoState({required this.tipoDocumentos, this.loading = false});
}
