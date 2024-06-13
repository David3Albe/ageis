import 'package:ageiscme_models/dto/anormalidade/save/anormalidade_save_dto.dart';

class AnormalidadeFrmState {
  bool loading;
  AnormalidadeSaveDTO? dto;
  AnormalidadeSaveDTO? dtoOriginal;

  AnormalidadeFrmState({
    this.dto,
    this.dtoOriginal,
    this.loading = false,
  });
}
