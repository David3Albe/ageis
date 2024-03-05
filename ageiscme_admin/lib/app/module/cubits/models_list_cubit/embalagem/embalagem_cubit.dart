import 'package:ageiscme_data/services/embalagem/embalagem_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EmbalagemCubit extends Cubit<List<EmbalagemModel>> {
  EmbalagemCubit() : super([]);

  void loadAll() async {
    emit(await EmbalagemService().GetAll());
  }

  void clear() => emit([]);
}
