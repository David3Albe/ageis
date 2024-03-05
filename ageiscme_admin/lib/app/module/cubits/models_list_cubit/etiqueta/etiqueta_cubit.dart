import 'package:ageiscme_data/services/etiqueta/etiqueta_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EtiquetaCubit extends Cubit<List<EtiquetaModel>> {
  EtiquetaCubit() : super([]);

  void loadAll() async {
    emit(await EtiquetaService().GetAll());
  }

  void clear() => emit([]);
}
