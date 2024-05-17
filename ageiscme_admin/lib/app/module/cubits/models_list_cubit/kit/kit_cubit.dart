import 'package:ageiscme_models/models/kit/kit_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitCubit extends Cubit<List<KitModel>> {
  KitCubit() : super([]);
  void clear() => emit([]);
}
