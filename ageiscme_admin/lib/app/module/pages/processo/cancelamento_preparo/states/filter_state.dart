import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';

class FilterState {
  ItemModel? item;
  int? codItem;
  KitDropDownSearchResponseDTO? kit;
  int? codKit;

  FilterState({
    this.item,
    this.codItem,
    this.codKit,
    this.kit,
  });
}
