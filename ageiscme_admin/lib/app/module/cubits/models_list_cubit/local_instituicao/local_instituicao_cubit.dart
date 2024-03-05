import 'package:ageiscme_data/services/local_instituicao/local_instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LocalInstituicaoCubit extends Cubit<LocalInstituicaoState> {
  LocalInstituicaoCubit()
      : super(LocalInstituicaoState(locaisInstituicoes: []));

  void loadAll() async {
    emit(LocalInstituicaoState(locaisInstituicoes: [], loading: true));
    List<LocalInstituicaoModel> locaisInstituicoes =
        await LocalInstituicaoService().GetAll();
    emit(
      LocalInstituicaoState(
        locaisInstituicoes: locaisInstituicoes,
        loaded: true,
      ),
    );
  }

  void loadFilter(LocalInstituicaoFilter filter) async {
    emit(
      LocalInstituicaoState(
        locaisInstituicoes: [],
        loading: true,
      ),
    );
    List<LocalInstituicaoModel> locaisInstituicoes =
        await LocalInstituicaoService().Filter(filter);
    emit(
      LocalInstituicaoState(
        locaisInstituicoes: locaisInstituicoes,
        loaded: true,
      ),
    );
  }

  void clear() => emit(LocalInstituicaoState(locaisInstituicoes: []));
}

class LocalInstituicaoState {
  List<LocalInstituicaoModel> locaisInstituicoes;
  bool loading;
  bool loaded;

  LocalInstituicaoState({
    required this.locaisInstituicoes,
    this.loaded = false,
    this.loading = false,
  });
}
