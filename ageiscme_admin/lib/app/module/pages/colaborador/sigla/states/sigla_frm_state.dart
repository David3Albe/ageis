import 'package:ageiscme_models/dto/sigla/save/sigla_save_dto.dart';

class SiglaFrmState {
  bool loading;
  SiglaSaveDTO? dto;
  SiglaSaveDTO? dtoOriginal;

  SiglaFrmState({
    this.dto,
    this.dtoOriginal,
    this.loading = false,
  });
}
