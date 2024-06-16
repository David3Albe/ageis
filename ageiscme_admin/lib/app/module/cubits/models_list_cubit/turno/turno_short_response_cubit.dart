import 'package:ageiscme_data/services/turno/turno_service.dart';
import 'package:ageiscme_models/dto/turno/short/turno_short_dto.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';

class TurnoShortResponseCubit extends Cubit<TurnoShortResponseState> {
  TurnoShortResponseCubit() : super(TurnoShortResponseState(turnos: []));

  Future load(TurnoShortDTO filter) async {
    emit(
      TurnoShortResponseState(
        turnos: [],
        loading: true,
      ),
    );
    (String, List<TurnoShortResponseDTO>)? result =
        await Modular.get<TurnoService>().short(filter);
    if (result == null) return;
    List<TurnoShortResponseDTO> turnos = result.$2;
    emit(
      TurnoShortResponseState(
        turnos: turnos,
        loaded: true,
      ),
    );
  }
}

class TurnoShortResponseState {
  List<TurnoShortResponseDTO> turnos;
  bool loading;
  bool loaded;

  TurnoShortResponseState({
    required this.turnos,
    this.loading = false,
    this.loaded = false,
  });
}
