import 'package:ageiscme_data/services/motivo_quebra_fluxo/motivo_quebra_fluxo_service.dart';
import 'package:ageiscme_models/models/motivo_quebra_fluxo/motivo_quebra_fluxo_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class MotivoQuebraFluxoPageFrmCubit
    extends Cubit<MotivoQuebraFluxoPageFrmState> {
  final MotivoQuebraFluxoService service;
  final MotivoQuebraFluxoModel motivoQuebraFluxoModel;
  MotivoQuebraFluxoPageFrmCubit({
    required this.service,
    required this.motivoQuebraFluxoModel,
  }) : super(
          MotivoQuebraFluxoPageFrmState(
            motivoQuebraFluxo: motivoQuebraFluxoModel,
          ),
        );

  void save(MotivoQuebraFluxoModel motivoQuebraFluxo) async {
    try {
      (String message, MotivoQuebraFluxoModel motivoQuebraFluxo)? result =
          await service.save(motivoQuebraFluxo);
      if (result == null) return;

      emit(
        MotivoQuebraFluxoPageFrmState(
          message: result.$1,
          saved: true,
          motivoQuebraFluxo: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        MotivoQuebraFluxoPageFrmState(
          error: ex.toString(),
          motivoQuebraFluxo: motivoQuebraFluxo,
        ),
      );
    }
  }

  void clear() {
    emit(MotivoQuebraFluxoPageFrmState(motivoQuebraFluxo: MotivoQuebraFluxoModel.empty()));
  }
}

class MotivoQuebraFluxoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final MotivoQuebraFluxoModel motivoQuebraFluxo;

  MotivoQuebraFluxoPageFrmState({
    required this.motivoQuebraFluxo,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
