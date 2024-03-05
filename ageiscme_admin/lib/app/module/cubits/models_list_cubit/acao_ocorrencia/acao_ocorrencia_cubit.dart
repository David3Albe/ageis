import 'package:ageiscme_data/services/acao_ocorrencia/acao_ocorrencia_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class AcaoOcorrenciaCubit extends Cubit<List<AcaoOcorrenciaModel>> {
  AcaoOcorrenciaCubit() : super([]);

  void loadAll() async {
    emit(await AcaoOcorrenciaService().GetAll());
  }

  void clear() => emit([]);
}
