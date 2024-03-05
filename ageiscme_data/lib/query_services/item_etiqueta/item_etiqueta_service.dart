import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/item_etiqueta/consulta_item_etiqueta_filter.dart';
import 'package:ageiscme_models/query_models/item_etiqueta/consulta_item_etiqueta_model.dart';

class ConsultaItemEtiquetaService {
  final CustomDio _client = CustomDio();

  ConsultaItemEtiquetaService();

  Future<(String message, List<ConsultaItemEtiquetaModel> items)?> filter(
    ConsultaItemEtiquetaFilter obj,
  ) async {
    return await _client.post(
      '/consulta-item-etiqueta',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaItemEtiquetaModel.fromJson(e))
          .toList(),
    );
  }
}
