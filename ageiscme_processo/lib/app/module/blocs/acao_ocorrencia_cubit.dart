import 'package:ageiscme_data/services/acao_ocorrencia/acao_ocorrencia_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AcaoOcorrenciaCubit extends Cubit<AcaoOcorrenciaState> {
  AcaoOcorrenciaCubit() : super(AcaoOcorrenciaState(motivos: []));

  void loadAll() async {
    emit(AcaoOcorrenciaState(loading: true, motivos: []));
    List<AcaoOcorrenciaModel> motivos = await AcaoOcorrenciaService().GetAll();
    emit(AcaoOcorrenciaState(motivos: motivos));
  }

  void clear() => emit(AcaoOcorrenciaState(motivos: []));
}

class AcaoOcorrenciaState {
  bool loading;
  List<AcaoOcorrenciaModel> motivos;
  AcaoOcorrenciaState({
    required this.motivos,
    this.loading = false,
  });
}
