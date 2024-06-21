import 'package:ageiscme_data/services/embalagem/embalagem_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EmbalagemCubit extends Cubit<EmbalagemState> {
  EmbalagemCubit() : super(EmbalagemState(embalagens: []));

  void loadAll() async {
    emit(EmbalagemState(embalagens: state.embalagens,loading: true));
    emit(EmbalagemState(embalagens: await EmbalagemService().GetAll()));
  }

  void clear() => emit(EmbalagemState(embalagens: []));
}

class EmbalagemState {
  List<EmbalagemModel> embalagens;
  bool loading;
  EmbalagemState({required this.embalagens, this.loading = false});
}
