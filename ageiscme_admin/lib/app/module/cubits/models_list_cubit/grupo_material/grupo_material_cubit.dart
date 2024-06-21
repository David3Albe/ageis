import 'package:ageiscme_data/services/grupo_material/grupo_material_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class GrupoMaterialCubit extends Cubit<GrupoMaterialState> {
  GrupoMaterialCubit() : super(GrupoMaterialState(grupoMateriais: []));

  void loadAll() async {
    emit(
      GrupoMaterialState(
        grupoMateriais: state.grupoMateriais,
        loading: true,
      ),
    );
    emit(
      GrupoMaterialState(
        grupoMateriais: await GrupoMaterialService().GetAll(),
      ),
    );
  }

  void clear() => emit(GrupoMaterialState(grupoMateriais: []));
}

class GrupoMaterialState {
  List<GrupoMaterialModel> grupoMateriais;
  bool loading;
  GrupoMaterialState({required this.grupoMateriais, this.loading = false});
}
