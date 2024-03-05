import 'package:ageiscme_data/services/tipo_documento/tipo_documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TipoDocumentoCubit extends Cubit<List<TipoDocumentoModel>> {
  TipoDocumentoCubit() : super([]);

  void loadAll() async {
    emit(await TipoDocumentoService().GetAll());
  }

  void clear() => emit([]);
}
