import 'package:ageiscme_models/dto/turno/save/turno_save_dto.dart';

class TurnoFrmState {
  bool loading;
  TurnoSaveDTO? dto;
  TurnoSaveDTO? dtoOriginal;

  TurnoFrmState({
    this.dto,
    this.dtoOriginal,
    this.loading = false,
  });
}
