import 'package:ageiscme_data/services/unidade_medida/unidade_medida_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UnidadeMedidaCubit extends Cubit<List<UnidadeMedidaModel>> {
  UnidadeMedidaCubit() : super([]);

  void loadAll() async {
    emit(await UnidadeMedidaService().GetAll());
  }

  void clear() => emit([]);
}
