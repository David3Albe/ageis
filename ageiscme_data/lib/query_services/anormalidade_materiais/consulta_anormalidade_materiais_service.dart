import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/anormalidade_materiais/consulta_anormalidade_materiais_filter.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';

class ConsultaAnormalidadeMateriaisService {
  final CustomDio _client = CustomDio();

  ConsultaAnormalidadeMateriaisService();

  Future<(String message, PlutoGridInfiniteScrollModel response)?>
      filter(
    ConsultaAnormalidadeMateriaisFilter obj,
  ) async {
    return await _client.post(
      '/consulta-anormalidade-materiais',
      obj,
      (dynamic json) => PlutoGridInfiniteScrollModel.fromJson(json),
    );
  }
}
