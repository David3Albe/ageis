import 'package:ageiscme_data/query_services/item_inventario/consulta_item_inventario_service.dart';
import 'package:ageiscme_models/query_filters/item_inventario/consulta_item_inventario_filter.dart';
import 'package:ageiscme_models/query_models/item_inventario/consulta_item_inventario_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaItemInventarioPageCubit
    extends Cubit<ConsultaItemInventarioPageState> {
  final ConsultaItemInventarioService service;
  ConsultaItemInventarioPageCubit({required this.service})
      : super(
          ConsultaItemInventarioPageState(
            itens: [],
            loading: false,
          ),
        );

  void loadItemInventario(ConsultaItemInventarioFilter filter) async {
    emit(
      ConsultaItemInventarioPageState(
        loading: true,
        itens: [],
      ),
    );
    try {
      (String, List<ConsultaItemInventarioModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaItemInventarioModel> itensInventarios = itens.$2;
      emit(
        ConsultaItemInventarioPageState(
          loading: false,
          itens: itensInventarios,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaItemInventarioPageState(
          loading: false,
          itens: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaItemInventarioPageState {
  final bool loading;
  final List<ConsultaItemInventarioModel> itens;
  final String error;
  final String message;

  ConsultaItemInventarioPageState({
    required this.loading,
    required this.itens,
    this.error = '',
    this.message = '',
  });
}
