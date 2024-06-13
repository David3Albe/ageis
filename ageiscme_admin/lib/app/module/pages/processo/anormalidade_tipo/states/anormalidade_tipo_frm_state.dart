import 'package:ageiscme_models/dto/anormalidade_tipo/save/anormalidade_tipo_save_dto.dart';

class AnormalidadeTipoFrmState {
  bool loading;
  AnormalidadeTipoSaveDTO? dto;
  AnormalidadeTipoSaveDTO? dtoOriginal;

  AnormalidadeTipoFrmState({
    this.dto,
    this.dtoOriginal,
    this.loading = false,
  });
}
