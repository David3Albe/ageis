import 'package:ageiscme_data/services/acao_ocorrencia/acao_ocorrencia_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AcaoOcorrenciaPageCubit extends Cubit<AcaoOcorrenciaPageState> {
  final AcaoOcorrenciaService service;
  AcaoOcorrenciaPageCubit({required this.service})
      : super(
          AcaoOcorrenciaPageState(
            acoesOcorrencia: [],
            loading: false,
          ),
        );

  void loadAcaoOcorrencia() async {
    emit(AcaoOcorrenciaPageState(loading: true, acoesOcorrencia: []));
    try {
      List<AcaoOcorrenciaModel> acoesOcorrencia = await service.GetAll();
      emit(
        AcaoOcorrenciaPageState(
          loading: false,
          acoesOcorrencia: acoesOcorrencia,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AcaoOcorrenciaPageState(
          loading: false,
          acoesOcorrencia: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(AcaoOcorrenciaModel acaoOcorrencia) async {
    try {
      (String, AcaoOcorrenciaModel)? result =
          await service.delete(acaoOcorrencia);
      if (result == null) return;

      emit(
        AcaoOcorrenciaPageState(
          loading: false,
          acoesOcorrencia: state.acoesOcorrencia,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AcaoOcorrenciaPageState(
          loading: false,
          acoesOcorrencia: state.acoesOcorrencia,
          error: ex.toString(),
        ),
      );
    }
  }
}

class AcaoOcorrenciaPageState {
  final bool loading;
  final bool deleted;
  final List<AcaoOcorrenciaModel> acoesOcorrencia;
  final String error;
  final String message;

  AcaoOcorrenciaPageState({
    required this.loading,
    required this.acoesOcorrencia,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
