import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/documento/documento_filter.dart';
import 'package:ageiscme_models/main.dart';

class DocumentoService {
  final CustomDio _client = CustomDio();

  DocumentoService();

  Future<List<DocumentoModel>> GetAll() async =>
      (await _client.getList('/documento'))
          .map((e) => DocumentoModel.fromJson(e))
          .toList();

  Future<DocumentoModel?> filterOne(
    DocumentoFilter obj,
  ) async {
    return await _client.postFilter(
      '/documento/filter-one',
      obj,
      (dynamic json) => DocumentoModel.fromJson(json),
    );
  }

  Future<(String message, DocumentoModel documento)?> save(
    DocumentoModel obj,
  ) async {
    return await _client.post(
      '/documento',
      obj,
      (dynamic json) => DocumentoModel.fromJson(json),
    );
  }

  Future<(String message, DocumentoModel documento)?> delete(
    DocumentoModel obj,
  ) async {
    return await _client.delete(
      '/documento/${obj.cod}',
      obj,
      (dynamic json) => DocumentoModel.fromJson(json),
    );
  }
}
