import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/kit/consulta_kit_filter.dart';
import 'package:ageiscme_models/query_models/kit/consulta_kit_model.dart';

class ConsultaKitService {
  final CustomDio _client = CustomDio();

  ConsultaKitService();

  Future<(String message, List<ConsultaKitModel> items)?> filter(
    ConsultaKitFilter obj,
  ) async {
    return await _client.post(
      '/consulta-kit',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaKitModel.fromJson(e))
          .toList(),
    );
  }
}
