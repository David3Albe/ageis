import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class TipoDocumentoService {
  final CustomDio _client = CustomDio();

  TipoDocumentoService();

  Future<List<TipoDocumentoModel>> GetAll() async =>
      (await _client.getList('/tipo-documento'))
          .map((e) => TipoDocumentoModel.fromJson(e))
          .toList();

  Future<(String message, TipoDocumentoModel tipoDocumento)?> save(
    TipoDocumentoModel obj,
  ) async {
    return await _client.post(
      '/tipo-documento',
      obj,
      (dynamic json) => TipoDocumentoModel.fromJson(json),
    );
  }

  Future<(String message, TipoDocumentoModel tipoDocumento)?> delete(
    TipoDocumentoModel obj,
  ) async {
    return await _client.delete(
      '/tipo-documento/${obj.cod}',
      obj,
      (dynamic json) => TipoDocumentoModel.fromJson(json),
    );
  }
}
