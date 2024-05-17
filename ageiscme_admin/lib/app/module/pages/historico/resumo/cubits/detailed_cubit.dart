import 'package:ageiscme_admin/app/module/pages/historico/resumo/states/detailed_state.dart';
import 'package:ageiscme_models/response_dto/historico/search/item/historico_search_item_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DetailedCubit extends Cubit<DetailedState> {
  DetailedCubit() : super(DetailedState(item: null));

  Future detail(HistoricoSearchItemResponseDTO? item) async {
    emit(DetailedState(item: item));
  }

  void clear() {
    emit(DetailedState(item: null));
  }
}
