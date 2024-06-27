import 'package:ageiscme_data/services/grupo_material/grupo_material_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class GrupoMaterialPageFrmCubit extends Cubit<GrupoMaterialPageFrmState> {
  final GrupoMaterialService service;
  final GrupoMaterialModel grupoMaterialModel;
  GrupoMaterialPageFrmCubit({
    required this.service,
    required this.grupoMaterialModel,
  }) : super(
          GrupoMaterialPageFrmState(grupoMaterial: grupoMaterialModel),
        );

  void save(
    GrupoMaterialModel grupoMaterial,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, GrupoMaterialModel grupoMaterial)? result =
          await service.save(grupoMaterial);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        GrupoMaterialPageFrmState(
          message: result.$1,
          saved: true,
          grupoMaterial: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        GrupoMaterialPageFrmState(
          error: ex.toString(),
          grupoMaterial: grupoMaterial,
        ),
      );
    }
  }

  void clear() {
    emit(GrupoMaterialPageFrmState(grupoMaterial: GrupoMaterialModel.empty()));
  }
}

class GrupoMaterialPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final GrupoMaterialModel grupoMaterial;

  GrupoMaterialPageFrmState({
    required this.grupoMaterial,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
