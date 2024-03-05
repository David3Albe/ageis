import 'package:ageiscme_data/services/grupo_material/grupo_material_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class GrupoMaterialPageCubit extends Cubit<GrupoMaterialPageState> {
  final GrupoMaterialService service;
  GrupoMaterialPageCubit({required this.service})
      : super(
          GrupoMaterialPageState(
            gruposMaterial: [],
            loading: false,
          ),
        );

  void loadGrupoMaterial() async {
    emit(GrupoMaterialPageState(loading: true, gruposMaterial: []));
    try {
      List<GrupoMaterialModel> gruposMaterial = await service.GetAll();
      emit(
        GrupoMaterialPageState(
          loading: false,
          gruposMaterial: gruposMaterial,
        ),
      );
    } on Exception catch (ex) {
      emit(
        GrupoMaterialPageState(
          loading: false,
          gruposMaterial: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(GrupoMaterialModel grupoMaterial) async {
    try {
      (String, GrupoMaterialModel)? result = await service.delete(grupoMaterial);
      if (result == null) return;

      emit(
        GrupoMaterialPageState(
          loading: false,
          gruposMaterial: state.gruposMaterial,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        GrupoMaterialPageState(
          loading: false,
          gruposMaterial: state.gruposMaterial,
          error: ex.toString(),
        ),
      );
    }
  }
}

class GrupoMaterialPageState {
  final bool loading;
  final bool deleted;
  final List<GrupoMaterialModel> gruposMaterial;
  final String error;
  final String message;

  GrupoMaterialPageState({
    required this.loading,
    required this.gruposMaterial,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
