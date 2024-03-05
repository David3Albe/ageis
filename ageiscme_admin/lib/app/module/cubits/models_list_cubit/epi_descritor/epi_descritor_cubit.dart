import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EpiDescritorCubit extends Cubit<List<EpiDescritorModel>> {
  EpiDescritorCubit() : super([]);

  void loadAll() async {
    emit(await EpiDescritorService().GetAll());
  }

  void clear() => emit([]);
}
