import 'package:ageiscme_data/query_services/item_etiqueta/item_etiqueta_service.dart';
import 'package:ageiscme_models/query_filters/item_etiqueta/consulta_item_etiqueta_filter.dart';
import 'package:ageiscme_models/query_models/item_etiqueta/consulta_item_etiqueta_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaItemEtiquetaPageCubit
    extends Cubit<ConsultaItemEtiquetaPageState> {
  final ConsultaItemEtiquetaService service;
  ConsultaItemEtiquetaPageCubit({required this.service})
      : super(
          ConsultaItemEtiquetaPageState(
            itensEtiquetas: [],
            loading: false,
          ),
        );

  void loadItemEtiqueta(ConsultaItemEtiquetaFilter filter) async {
    emit(
      ConsultaItemEtiquetaPageState(
        loading: true,
        itensEtiquetas: [],
      ),
    );
    try {
      (String, List<ConsultaItemEtiquetaModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaItemEtiquetaModel> itensEtiquetas = itens.$2;
      emit(
        ConsultaItemEtiquetaPageState(
          loading: false,
          itensEtiquetas: itensEtiquetas,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaItemEtiquetaPageState(
          loading: false,
          itensEtiquetas: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaItemEtiquetaPageState {
  final bool loading;
  final List<ConsultaItemEtiquetaModel> itensEtiquetas;
  final String error;
  final String message;

  ConsultaItemEtiquetaPageState({
    required this.loading,
    required this.itensEtiquetas,
    this.error = '',
    this.message = '',
  });
}
