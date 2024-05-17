import 'package:ageiscme_data/services/documento/documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DocumentoPageCubit extends Cubit<DocumentoPageState> {
  final DocumentoService service;
  DocumentoPageCubit({required this.service})
      : super(
          DocumentoPageState(
            documentos: [],
            loading: false,
          ),
        );

  Future loadDocumento() async {
    emit(DocumentoPageState(loading: true, documentos: []));
    try {
      List<DocumentoModel> documentos = await service.GetAll();
      emit(DocumentoPageState(loading: false, documentos: documentos));
    } on Exception catch (ex) {
      emit(
        DocumentoPageState(
          loading: false,
          documentos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(DocumentoModel documento) async {
    try {
      (String, DocumentoModel)? result = await service.delete(documento);
      if (result == null) return;

      emit(
        DocumentoPageState(
          loading: false,
          documentos: state.documentos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DocumentoPageState(
          loading: false,
          documentos: state.documentos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class DocumentoPageState {
  final bool loading;
  final bool deleted;
  final List<DocumentoModel> documentos;
  final String error;
  final String message;

  DocumentoPageState({
    required this.loading,
    required this.documentos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
