import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/anormalidade/consulta_anormalidade_filter.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';

class ConsultaAnormalidadeService {
  final CustomDio _client = CustomDio();

  ConsultaAnormalidadeService();

  Future<(String message, PlutoGridInfiniteScrollModel response)?>
      filter(
    ConsultaAnormalidadeFilter obj,
  ) async {
    return await _client.post(
      '/consulta-anormalidade',
      obj,
      (dynamic json) => PlutoGridInfiniteScrollModel.fromJson(json),
    );
  }
}
