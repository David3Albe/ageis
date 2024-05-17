import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/states/filter_state.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/search/item_inserir_rapido_search_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit({
    required ItemInserirRapidoSearchDTO dto,
  }) : super(FilterState(dto: dto));
}
