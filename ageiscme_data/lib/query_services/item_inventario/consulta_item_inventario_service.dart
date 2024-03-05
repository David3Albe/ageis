import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/item_inventario/consulta_item_inventario_filter.dart';
import 'package:ageiscme_models/query_models/item_inventario/consulta_item_inventario_model.dart';

class ConsultaItemInventarioService {
  final CustomDio _client = CustomDio();

  ConsultaItemInventarioService();

  Future<(String message, List<ConsultaItemInventarioModel> items)?> filter(
    ConsultaItemInventarioFilter obj,
  ) async {
    return await _client.post(
      '/consulta-item-inventario',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaItemInventarioModel.fromJson(e))
          .toList(),
    );
  }
}
