import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class RegistroServicoCubit extends Cubit<List<RegistroServicoModel>> {
  RegistroServicoCubit() : super([]);

  void loadAll() async {
    emit(await RegistroServicoService().GetAll());
  }

  void clear() => emit([]);
}
