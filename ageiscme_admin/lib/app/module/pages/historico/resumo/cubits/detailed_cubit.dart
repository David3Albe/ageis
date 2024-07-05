import 'package:ageiscme_admin/app/module/pages/historico/resumo/states/detailed_state.dart';
import 'package:ageiscme_models/response_dto/historico/search/item/historico_search_item_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DetailedCubit extends Cubit<DetailedState> {
  DetailedCubit()
      : super(
          DetailedState(
            item: null,
            itemSuperior: null,
          ),
        );

  Future detail(
    HistoricoSearchItemResponseDTO? item,
    List<HistoricoSearchItemResponseDTO>? itens,
  ) async {
    HistoricoSearchItemResponseDTO? itemSuperior =
        _getItemSuperior(item, itens);
    emit(DetailedState(item: item, itemSuperior: itemSuperior));
  }

  HistoricoSearchItemResponseDTO? _getItemSuperior(
    HistoricoSearchItemResponseDTO? item,
    List<HistoricoSearchItemResponseDTO>? itens,
  ) {
    if (item == null || itens == null) return null;
    List<HistoricoSearchItemResponseDTO> itensDepoisDoItem =
        itens.where((element) => element.data.isAfter(item.data)).toList();
    itensDepoisDoItem.sort(
      (a, b) => a.data.compareTo(b.data),
    );
    return itensDepoisDoItem.firstOrNull;
  }

  void clear() {
    emit(
      DetailedState(
        item: null,
        itemSuperior: null,
      ),
    );
  }
}
