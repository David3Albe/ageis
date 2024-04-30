import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/states/search_state.dart';
import 'package:ageiscme_data/services/insumo_saldo/insumo_saldo_service.dart';
import 'package:ageiscme_models/dto/insumo/expirar/insumo_expirar_search_dto.dart';
import 'package:ageiscme_models/response_dto/insumo/expirar/insumo_expirar_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future search(InsumoExpirarSearchDTO dto) async {
    emit(SearchState(loading: true));
    InsumoSaldoService service = InsumoSaldoService();
    List<InsumoExpirarSearchResponseDTO> response =
        await service.searchExpirar(dto);
    emit(SearchState(loading: false, insumos: response));
  }

  void set(List<InsumoExpirarSearchResponseDTO> insumos){
    emit(SearchState(loading: false, insumos: insumos));
  }
}
