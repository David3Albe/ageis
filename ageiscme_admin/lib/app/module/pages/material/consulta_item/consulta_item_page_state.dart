import 'package:ageiscme_data/query_services/item/consulta_item_service.dart';
import 'package:ageiscme_models/query_filters/item/consulta_item_filter.dart';
import 'package:ageiscme_models/query_models/item/consulta_item_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaItemPageCubit extends Cubit<ConsultaItemPageState> {
  final ConsultaItemService service;
  ConsultaItemPageCubit({required this.service})
      : super(
          ConsultaItemPageState(
            itens: [],
            loading: false,
          ),
        );

  void loadItem(ConsultaItemFilter filter) async {
    emit(
      ConsultaItemPageState(
        loading: true,
        itens: [],
      ),
    );
    try {
      (String, List<ConsultaItemModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaItemModel> item = itens.$2;
      emit(
        ConsultaItemPageState(
          loading: false,
          itens: item,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaItemPageState(
          loading: false,
          itens: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaItemPageState {
  final bool loading;
  final List<ConsultaItemModel> itens;
  final String error;
  final String message;

  ConsultaItemPageState({
    required this.loading,
    required this.itens,
    this.error = '',
    this.message = '',
  });
}
