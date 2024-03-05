import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/models/kit/kit_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitCubit extends Cubit<List<KitModel>> {
  KitCubit() : super([]);

  void loadAll() async {
    emit(await KitService().GetAll());
  }

  void clear() => emit([]);
}
