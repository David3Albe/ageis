import 'package:ageiscme_data/services/equipamento_manutencao/equipamento_manutencao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EquipamentoManutencaoCubit
    extends Cubit<List<EquipamentoManutencaoModel>> {
  EquipamentoManutencaoCubit() : super([]);

  void loadAll() async {
    emit(await EquipamentoManutencaoService().GetAll());
  }

  void clear() => emit([]);
}
