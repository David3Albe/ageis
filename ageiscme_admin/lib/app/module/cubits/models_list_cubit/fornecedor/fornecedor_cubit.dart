import 'package:ageiscme_data/services/fornecedor/fornecedor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FornecedorCubit extends Cubit<List<FornecedorModel>> {
  FornecedorCubit() : super([]);

  void loadAll() async {
    emit(await FornecedorService().GetAll());
  }

  void clear() => emit([]);
}
