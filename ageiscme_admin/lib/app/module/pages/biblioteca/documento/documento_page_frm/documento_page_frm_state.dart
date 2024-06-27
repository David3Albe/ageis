import 'package:ageiscme_data/services/documento/documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DocumentoPageFrmCubit extends Cubit<DocumentoPageFrmState> {
  final DocumentoService service;
  final DocumentoModel documentoModel;
  DocumentoPageFrmCubit({
    required this.service,
    required this.documentoModel,
  }) : super(DocumentoPageFrmState(documento: documentoModel));

  void save(
    DocumentoModel documento,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, DocumentoModel documento)? result =
          await service.save(documento);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        DocumentoPageFrmState(
          message: result.$1,
          saved: true,
          documento: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DocumentoPageFrmState(
          error: ex.toString(),
          documento: documento,
        ),
      );
    }
  }

  void clear() {
    emit(DocumentoPageFrmState(documento: DocumentoModel.empty()));
  }
}

class DocumentoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final DocumentoModel documento;

  DocumentoPageFrmState({
    required this.documento,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
