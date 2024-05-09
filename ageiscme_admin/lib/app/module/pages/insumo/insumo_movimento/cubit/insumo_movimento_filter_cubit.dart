import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/filter/insumo_movimento_state.dart';
import 'package:ageiscme_models/response_dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoMovimentoFilterCubit extends Cubit<InsumoMovimentoFilterState> {
  InsumoMovimentoFilterCubit()
      : super(
          InsumoMovimentoFilterState(),
        );

  void setInsumoMovimento(
    InsumoMovimentoDropDownSearchResponseDTO? insumoMovimento,
  ) {
    emit(
      InsumoMovimentoFilterState(
        codInsumoMovimento: insumoMovimento?.cod,
        insumoMovimento: insumoMovimento,
      ),
    );
  }
}
