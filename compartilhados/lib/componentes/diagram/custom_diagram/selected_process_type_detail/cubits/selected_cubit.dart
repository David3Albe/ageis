import 'package:compartilhados/componentes/diagram/custom_diagram/selected_process_type_detail/states/selected_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SelectedCubit extends Cubit<SelectedState> {
  final Future<List<String>> Function({required int id})? onDetailSearchItems;
  SelectedCubit({required this.onDetailSearchItems}) : super(SelectedState());

  void clear() {
    emit(SelectedState(id: null, materials: []));
  }

  Future select(int? id) async {
    if (onDetailSearchItems == null) return;
    if (id == null) {
      clear();
      return;
    }

    List<String> materials = await onDetailSearchItems!(id: id);
    emit(SelectedState(id: id, materials: materials));
  }
}
