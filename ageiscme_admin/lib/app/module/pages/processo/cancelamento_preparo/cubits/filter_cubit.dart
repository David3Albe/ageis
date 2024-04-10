import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/filter_state.dart';
import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
      : super(
          FilterState(),
        );

  void setItem(ItemModel? item) {
    emit(
      FilterState(
        item: item,
        codItem: item?.cod,
        codKit: state.codKit,
        kit: state.kit,
      ),
    );
  }

  void setKit(KitDropDownSearchResponseDTO? kit) {
    emit(
      FilterState(
        item: state.item,
        codItem: state.codItem,
        codKit: kit?.cod,
        kit: kit,
      ),
    );
  }
}
