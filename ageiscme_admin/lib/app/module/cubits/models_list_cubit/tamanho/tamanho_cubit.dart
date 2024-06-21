import 'package:ageiscme_data/services/tamanho/tamanho_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TamanhoCubit extends Cubit<TamanhoState> {
  TamanhoCubit() : super(TamanhoState(tamanhos: []));

  void loadAll() async {
    emit(TamanhoState(tamanhos: state.tamanhos, loading: true));
    emit(TamanhoState(tamanhos: await TamanhoService().GetAll()));
  }

  void clear() => emit(TamanhoState(tamanhos: []));
}

class TamanhoState {
  bool loading;
  List<TamanhoModel> tamanhos;

  TamanhoState({required this.tamanhos, this.loading = false});
}
