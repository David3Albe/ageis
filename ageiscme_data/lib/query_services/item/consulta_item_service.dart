import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/item/consulta_item_filter.dart';
import 'package:ageiscme_models/query_models/item/consulta_item_model.dart';

class ConsultaItemService {
  final CustomDio _client = CustomDio();

  ConsultaItemService();

  Future<(String message, List<ConsultaItemModel> items)?> filter(
    ConsultaItemFilter obj,
  ) async {
    return await _client.post(
      '/consulta-item',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaItemModel.fromJson(e))
          .toList(),
    );
  }
}
