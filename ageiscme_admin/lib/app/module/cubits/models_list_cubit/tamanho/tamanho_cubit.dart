import 'package:ageiscme_data/services/tamanho/tamanho_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TamanhoCubit extends Cubit<List<TamanhoModel>> {
  TamanhoCubit() : super([]);

  void loadAll() async {
    emit(await TamanhoService().GetAll());
  }

  void clear() => emit([]);
}
