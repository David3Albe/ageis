import 'package:ageiscme_models/response_dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_response_dto.dart';

class InsumoMovimentoFilterState {
  InsumoMovimentoDropDownSearchResponseDTO? insumoMovimento;
  int? codInsumoMovimento;

  InsumoMovimentoFilterState({
    this.insumoMovimento,
    this.codInsumoMovimento,
  });
}
