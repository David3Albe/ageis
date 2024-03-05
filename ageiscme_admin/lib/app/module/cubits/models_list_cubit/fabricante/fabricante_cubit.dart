import 'package:ageiscme_data/services/fabricante/fabricante_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FabricanteCubit extends Cubit<List<FabricanteModel>> {
  FabricanteCubit() : super([]);

  void loadAll() async {
    emit(await FabricanteService().GetAll());
  }

  void clear() => emit([]);
}
