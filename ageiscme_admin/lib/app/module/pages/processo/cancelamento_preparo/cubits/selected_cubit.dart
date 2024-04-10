import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/selected_state.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/leitura/processo_leitura_cancelamento_preparo_search_leitura_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SelectedCubit extends Cubit<SelectedState> {
  SelectedCubit() : super(SelectedState());

  void select(ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO obj) {
    if (state.leitura == obj) return;
    emit(SelectedState(leitura: obj));
  }

  void clear() {
    emit(SelectedState());
  }
}
