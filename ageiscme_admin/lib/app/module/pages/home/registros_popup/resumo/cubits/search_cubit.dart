import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/states/search_state.dart';
import 'package:ageiscme_data/services/registros_expirar/registros_expirar_service.dart';
import 'package:ageiscme_models/dto/registros/expirar/registros_expirar_search_dto.dart';
import 'package:ageiscme_models/response_dto/registros/expirar/registros_expirar_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future search(RegistrosExpirarSearchDTO dto) async {
    emit(SearchState(loading: true));
    RegistrosExpirarService service = RegistrosExpirarService();
    List<RegistrosExpirarSearchResponseDTO> response =
        await service.searchExpirar(dto);
    emit(SearchState(loading: false, registros: response));
  }

  void set(List<RegistrosExpirarSearchResponseDTO> registros){
    emit(SearchState(loading: false, registros: registros));
  }
}
