import 'package:ageiscme_data/services/gestao_contrato/gestao_contrato_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class GestaoContratoPageFrmCubit extends Cubit<GestaoContratoPageFrmState> {
  final GestaoContratoService service;
  final GestaoContratoModel gestaoContratoModel;
  GestaoContratoPageFrmCubit({
    required this.service,
    required this.gestaoContratoModel,
  }) : super(
          GestaoContratoPageFrmState(gestaoContrato: gestaoContratoModel),
        );

  void save(GestaoContratoModel gestaoContrato) async {
    try {
      (String message, GestaoContratoModel gestaoContrato)? result =
          await service.save(gestaoContrato);
      if (result == null) return;

      emit(
        GestaoContratoPageFrmState(
          message: result.$1,
          saved: true,
          gestaoContrato: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        GestaoContratoPageFrmState(
          error: ex.toString(),
          gestaoContrato: gestaoContrato,
        ),
      );
    }
  }

  void clear() {
    emit(GestaoContratoPageFrmState(gestaoContrato: GestaoContratoModel.empty()));
  }
}

class GestaoContratoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final GestaoContratoModel gestaoContrato;

  GestaoContratoPageFrmState({
    required this.gestaoContrato,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
