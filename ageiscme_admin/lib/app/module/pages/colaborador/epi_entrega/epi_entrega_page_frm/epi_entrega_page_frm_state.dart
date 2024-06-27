import 'package:ageiscme_data/services/epi_entrega/epi_entrega_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EpiEntregaPageFrmCubit extends Cubit<EpiEntregaPageFrmState> {
  final EpiEntregaService service;
  final EpiEntregaModel epiEntregaModel;
  EpiEntregaPageFrmCubit({
    required this.service,
    required this.epiEntregaModel,
  }) : super(
          EpiEntregaPageFrmState(epiEntrega: epiEntregaModel),
        );

  void save(
    EpiEntregaModel epiEntrega,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, EpiEntregaModel epiEntrega)? result =
          await service.save(epiEntrega);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        EpiEntregaPageFrmState(
          message: result.$1,
          saved: true,
          epiEntrega: result.$2,
        ),
      );
    } on Exception catch (_) {}
  }

  void clear() {
    emit(EpiEntregaPageFrmState(epiEntrega: EpiEntregaModel.empty()));
  }
}

class EpiEntregaPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final EpiEntregaModel epiEntrega;

  EpiEntregaPageFrmState({
    required this.epiEntrega,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
