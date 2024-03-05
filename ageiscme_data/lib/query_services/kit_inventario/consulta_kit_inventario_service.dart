import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/kit_inventario/consulta_kit_inventario_filter.dart';
import 'package:ageiscme_models/query_models/kit_inventario/consulta_kit_inventario_model.dart';

class ConsultaKitInventarioService {
  final CustomDio _client = CustomDio();

  ConsultaKitInventarioService();

  Future<(String message, List<ConsultaKitInventarioModel> items)?> filter(
    ConsultaKitInventarioFilter obj,
  ) async {
    return await _client.post(
      '/consulta-kit-inventario',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaKitInventarioModel.fromJson(e))
          .toList(),
    );
  }
}
