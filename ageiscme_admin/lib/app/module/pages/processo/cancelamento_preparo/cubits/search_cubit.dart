import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/search_state.dart';
import 'package:ageiscme_data/services/processo_leitura_cancelamento_preparo/processo_leitura_cancelamento_preparo_service.dart';
import 'package:ageiscme_models/dto/processo_leitura_cancelamento_preparo/search/processo_leitura_cancelamento_preparo_search_dto.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/processo_leitura_cancelamento_preparo_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future search(ProcessoLeituraCancelamentoPreparoSearchDTO dto) async {
    emit(SearchState(loading: true));
    ProcessoLeituraCancelamentoPreparoService service =
        Modular.get<ProcessoLeituraCancelamentoPreparoService>();
    (String, ProcessoLeituraCancelamentoPreparoSearchResponseDTO)? response =
        await service.search(dto);
    if (response == null) {
      emit(SearchState());
      return;
    }
    emit(SearchState(response: response.$2));
  }

  void clear() {
    emit(SearchState());
  }
}
