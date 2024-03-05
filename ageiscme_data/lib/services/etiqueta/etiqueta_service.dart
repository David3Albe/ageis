import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/models/etiqueta/etiqueta_model.dart';

class EtiquetaService {
  final CustomDio _client = CustomDio();

  EtiquetaService();

  Future<List<EtiquetaModel>> GetAll() async =>
      (await _client.getList('/etiqueta'))
          .map((e) => EtiquetaModel.fromJson(e))
          .toList();

  Future<(String message, EtiquetaModel etiqueta)?> save(
    EtiquetaModel obj,
  ) async {
    return await _client.post(
      '/etiqueta',
      obj,
      (dynamic json) => EtiquetaModel.fromJson(json),
    );
  }

  Future<(String message, EtiquetaModel etiqueta)?> delete(
    EtiquetaModel obj,
  ) async {
    return await _client.delete(
      '/etiqueta/${obj.cod}',
      obj,
      (dynamic json) => EtiquetaModel.fromJson(json),
    );
  }
}
