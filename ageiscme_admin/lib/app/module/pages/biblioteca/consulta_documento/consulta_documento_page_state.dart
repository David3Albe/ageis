import 'package:ageiscme_data/query_services/documento/consulta_documento_service.dart';
import 'package:ageiscme_models/query_filters/documento/consulta_documento_filter.dart';
import 'package:ageiscme_models/query_models/documento/consulta_documento_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaDocumentoPageCubit extends Cubit<ConsultaDocumentoPageState> {
  final ConsultaDocumentoService service;
  ConsultaDocumentoPageCubit({required this.service})
      : super(
          ConsultaDocumentoPageState(
            documentos: [],
            loading: false,
          ),
        );

  void loadDocumento(ConsultaDocumentoFilter filter) async {
    emit(
      ConsultaDocumentoPageState(
        loading: true,
        documentos: [],
      ),
    );
    try {
      (String, List<ConsultaDocumentoModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaDocumentoModel> documentos = itens.$2;
      emit(
        ConsultaDocumentoPageState(
          loading: false,
          documentos: documentos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaDocumentoPageState(
          loading: false,
          documentos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaDocumentoPageState {
  final bool loading;
  final List<ConsultaDocumentoModel> documentos;
  final String error;
  final String message;

  ConsultaDocumentoPageState({
    required this.loading,
    required this.documentos,
    this.error = '',
    this.message = '',
  });
}
