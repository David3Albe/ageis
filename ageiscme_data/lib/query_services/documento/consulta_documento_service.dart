import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/documento/consulta_documento_filter.dart';
import 'package:ageiscme_models/query_models/documento/consulta_documento_model.dart';

class ConsultaDocumentoService {
  final CustomDio _client = CustomDio();

  ConsultaDocumentoService();

  Future<(String message, List<ConsultaDocumentoModel> items)?> filter(
    ConsultaDocumentoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-documento',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaDocumentoModel.fromJson(e))
          .toList(),
    );
  }
}
