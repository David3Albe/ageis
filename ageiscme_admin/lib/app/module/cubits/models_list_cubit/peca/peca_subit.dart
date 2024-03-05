import 'package:ageiscme_data/services/peca/peca_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class PecaCubit extends Cubit<List<PecaModel>> {
  PecaCubit() : super([]);

  void loadAll() async {
    emit(await PecaService().GetAll());
  }

  void clear() => emit([]);
}
