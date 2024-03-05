import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/motivo_remover_repor_item/consulta_remover_repor_item_filter.dart';
import 'package:ageiscme_models/query_models/motivo_remover_repor_item/consulta_remover_repor_item_model.dart';

class ConsultaRemoverReporItemService {
  final CustomDio _client = CustomDio();

  ConsultaRemoverReporItemService();

  Future<(String message, List<ConsultaRemoverReporItemModel> items)?> filter(
    ConsultaRemoverReporItemFilter obj,
  ) async {
    return await _client.post(
      '/consulta-remover-repor-item',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaRemoverReporItemModel.fromJson(e))
          .toList(),
    );
  }
}
