import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/models/tipo_afastamento/tipo_afastamento_model.dart';

class TipoAfastamentoService {
  final CustomDio _client = CustomDio();

  TipoAfastamentoService();

  Future<List<TipoAfastamentoModel>> GetAll() async =>
      (await _client.getList('/tipo-afastamento'))
          .map((e) => TipoAfastamentoModel.fromJson(e))
          .toList();

  Future<(String message, TipoAfastamentoModel tipoAfastamento)?> save(
    TipoAfastamentoModel obj,
  ) async {
    return await _client.post(
      '/tipo-afastamento',
      obj,
      (dynamic json) => TipoAfastamentoModel.fromJson(json),
    );
  }

  Future<(String message, TipoAfastamentoModel tipoAfastamento)?> delete(
    TipoAfastamentoModel obj,
  ) async {
    return await _client.delete(
      '/tipo-afastamento/${obj.cod}',
      obj,
      (dynamic json) => TipoAfastamentoModel.fromJson(json),
    );
  }
}
