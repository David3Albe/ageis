import 'package:ageiscme_data/services/acao_ocorrencia/acao_ocorrencia_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AcaoOcorrenciaPageFrmCubit extends Cubit<AcaoOcorrenciaPageFrmState> {
  final AcaoOcorrenciaService service;
  final AcaoOcorrenciaModel acaoOcorrenciaModel;
  AcaoOcorrenciaPageFrmCubit({
    required this.service,
    required this.acaoOcorrenciaModel,
  }) : super(
          AcaoOcorrenciaPageFrmState(acaoOcorrencia: acaoOcorrenciaModel),
        );

  void save(
    AcaoOcorrenciaModel acaoOcorrencia,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, AcaoOcorrenciaModel acaoOcorrencia)? result =
          await service.save(acaoOcorrencia);
      if (result == null) return;
      onSaved(result.$1);

      emit(
        AcaoOcorrenciaPageFrmState(
          message: result.$1,
          saved: true,
          acaoOcorrencia: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AcaoOcorrenciaPageFrmState(
          error: ex.toString(),
          acaoOcorrencia: acaoOcorrencia,
        ),
      );
    }
  }

  void clear() {
    emit(
      AcaoOcorrenciaPageFrmState(acaoOcorrencia: AcaoOcorrenciaModel.empty()),
    );
  }
}

class AcaoOcorrenciaPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final AcaoOcorrenciaModel acaoOcorrencia;

  AcaoOcorrenciaPageFrmState({
    required this.acaoOcorrencia,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
