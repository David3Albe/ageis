import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/search_state.dart';
import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_models/dto/solicitacao_material/search/solicitacao_material_search_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/search/solicitacao_material_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future search(SolicitacaoMaterialSearchDTO dto) async {
    emit(SearchState(loading: true));
    SolicitacaoMaterialService service = SolicitacaoMaterialService();
    (String, SolicitacaoMaterialSearchResponseDTO)? response =
        await service.search(dto);
    if (response == null) return;
    emit(SearchState(loading: false, response: response.$2));
  }
}
