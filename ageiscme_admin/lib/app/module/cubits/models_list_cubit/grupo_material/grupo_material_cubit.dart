import 'package:ageiscme_data/services/grupo_material/grupo_material_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class GrupoMaterialCubit extends Cubit<List<GrupoMaterialModel>> {
  GrupoMaterialCubit() : super([]);

  void loadAll() async {
    emit(await GrupoMaterialService().GetAll());
  }

  void clear() => emit([]);
}
