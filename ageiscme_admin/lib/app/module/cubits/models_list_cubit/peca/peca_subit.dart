import 'package:ageiscme_data/services/peca/peca_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class PecaCubit extends Cubit<PecaState> {
  PecaCubit() : super(PecaState(pecas: []));

  void loadAll() async {
    emit(PecaState(pecas: state.pecas, loading: true));
    emit(PecaState(pecas: await PecaService().GetAll()));
  }

  void clear() => emit(PecaState(pecas: []));
}

class PecaState {
  bool loading;
  List<PecaModel> pecas;

  PecaState({required this.pecas, this.loading = false});
}
