import 'package:ageiscme_data/services/sigla/sigla_service.dart';
import 'package:ageiscme_models/dto/sigla/short/sigla_short_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/short/sigla_short_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';

class SiglaShortResponseCubit extends Cubit<SiglaShortResponseState> {
  SiglaShortResponseCubit() : super(SiglaShortResponseState(siglas: []));

  Future load(SiglaShortDTO filter) async {
    emit(
      SiglaShortResponseState(
        siglas: [],
        loading: true,
      ),
    );
    (String, List<SiglaShortResponseDTO>)? result =
        await Modular.get<SiglaService>().short(filter);
    if (result == null) return;
    List<SiglaShortResponseDTO> turnos = result.$2;
    emit(
      SiglaShortResponseState(
        siglas: turnos,
        loaded: true,
      ),
    );
  }
}

class SiglaShortResponseState {
  List<SiglaShortResponseDTO> siglas;
  bool loading;
  bool loaded;

  SiglaShortResponseState({
    required this.siglas,
    this.loading = false,
    this.loaded = false,
  });
}
