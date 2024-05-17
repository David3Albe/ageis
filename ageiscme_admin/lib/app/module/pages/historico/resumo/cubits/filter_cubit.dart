import 'package:ageiscme_admin/app/module/pages/historico/resumo/states/filter_state.dart';
import 'package:ageiscme_models/dto/historico/search/historico_search_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit({
    required int pk,
    required String termo,
  }) : super(
          FilterState(
            dto: HistoricoSearchDTO(
              numeroRegistros: 500,
              pk: pk,
              termo: termo,
            ),
          ),
        );
}
