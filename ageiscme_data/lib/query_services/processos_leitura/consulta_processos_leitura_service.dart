import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';

class ConsultaProcessosLeituraService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraService();

  Future<(String message, PlutoGridInfiniteScrollModel response)?>
      filter(
    ConsultaProcessosLeituraFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura',
      obj,
      (dynamic json) => PlutoGridInfiniteScrollModel.fromJson(json),
    );
  }
}
