import 'package:ageiscme_data/services/fabricante/fabricante_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FabricantePageFrmCubit extends Cubit<FabricantePageFrmState> {
  final FabricanteService service;
  final FabricanteModel fabricanteModel;
  FabricantePageFrmCubit({
    required this.service,
    required this.fabricanteModel,
  }) : super(
          FabricantePageFrmState(fabricante: fabricanteModel),
        );

  void save(FabricanteModel fabricante) async {
    try {
      (String message, FabricanteModel fabricante)? result =
          await service.save(fabricante);
      if (result == null) return;
      emit(
        FabricantePageFrmState(
          message: result.$1,
          saved: true,
          fabricante: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        FabricantePageFrmState(
          error: ex.toString(),
          fabricante: fabricante,
        ),
      );
    }
  }

  void clear() {
    emit(FabricantePageFrmState(fabricante: FabricanteModel.empty()));
  }
}

class FabricantePageFrmState {
  final String error;
  final bool saved;
  final String message;
  final FabricanteModel fabricante;

  FabricantePageFrmState({
    required this.fabricante,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
