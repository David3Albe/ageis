import 'package:ageiscme_data/services/processo_motivo/processo_motivo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class  ProcessoMotivoCubit extends Cubit<ProcessoMotivoState> {
  ProcessoMotivoCubit() : super(ProcessoMotivoState(motivos: []));

  void loadAll() async {
    emit(ProcessoMotivoState(loading: true, motivos: []));
    List<ProcessoMotivoModel> motivos = await ProcessoMotivoService().GetAll();
    emit(ProcessoMotivoState(motivos: motivos));
  }

  void clear() => emit(ProcessoMotivoState(motivos: []));
}

class ProcessoMotivoState {
  bool loading;
  List<ProcessoMotivoModel> motivos;
  ProcessoMotivoState({
    required this.motivos,
    this.loading = false,
  });
}
