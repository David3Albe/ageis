import 'package:ageiscme_data/services/centro_custo/centro_custo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class CentroCustoCubit extends Cubit<List<CentroCustoModel>> {
  CentroCustoCubit() : super([]);

  void loadAll() async {
    emit(await CentroCustoService().GetAll());
  }

  void clear() => emit([]);
}
