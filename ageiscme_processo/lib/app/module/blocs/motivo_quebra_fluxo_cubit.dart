import 'package:ageiscme_data/services/motivo_quebra_fluxo/motivo_quebra_fluxo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class MotivoQuebraFluxoCubit extends Cubit<MotivoQuebraFluxoState> {
  MotivoQuebraFluxoCubit() : super(MotivoQuebraFluxoState(motivos: []));

  void loadAll() async {
    emit(MotivoQuebraFluxoState(loading: true, motivos: []));
    List<MotivoQuebraFluxoModel> motivos = await MotivoQuebraFluxoService().GetAll();
    emit(MotivoQuebraFluxoState(motivos: motivos));
  }

  void clear() => emit(MotivoQuebraFluxoState(motivos: []));
}

class MotivoQuebraFluxoState {
  bool loading;
  List<MotivoQuebraFluxoModel> motivos;
  MotivoQuebraFluxoState({
    required this.motivos,
    this.loading = false,
  });
}
