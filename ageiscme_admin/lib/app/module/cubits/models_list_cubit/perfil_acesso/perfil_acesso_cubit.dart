import 'package:ageiscme_data/services/perfil_acesso/perfil_acesso_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class PerfilAcessoCubit extends Cubit<List<PerfilAcessoModel>> {
  PerfilAcessoCubit() : super([]);

  void loadAll() async {
    emit(await PerfilAcessoService().GetAll());
  }

  void clear() => emit([]);
}
