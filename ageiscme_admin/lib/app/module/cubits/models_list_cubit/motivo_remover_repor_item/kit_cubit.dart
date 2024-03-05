import 'package:ageiscme_data/services/motivo_remover_repor_item/motivo_remover_repor_item_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class MotivoRemoverReporItemCubit extends Cubit<List<MotivoRemoverReporItemModel>> {
  MotivoRemoverReporItemCubit() : super([]);

  void loadAll() async {
    emit(await MotivoRemoverReporItemService().GetAll());
  }

  void clear() => emit([]);
}
