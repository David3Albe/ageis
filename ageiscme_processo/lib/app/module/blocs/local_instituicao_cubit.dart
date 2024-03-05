import 'package:ageiscme_data/services/local_instituicao/local_instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LocalInstituicaoCubit extends Cubit<LocalInstituicaoState> {
  LocalInstituicaoCubit() : super(LocalInstituicaoState(locais: []));

  void loadAll() async {
    emit(LocalInstituicaoState(locais: [], loading: true));
    List<LocalInstituicaoModel> locais =
        await LocalInstituicaoService().GetAll();
    emit(
      LocalInstituicaoState(locais: locais),
    );
  }

  void clear() => emit(LocalInstituicaoState(locais: []));
}

class LocalInstituicaoState {
  bool loading;
  List<LocalInstituicaoModel> locais;

  LocalInstituicaoState({
    required this.locais,
    this.loading = false,
  });
}
