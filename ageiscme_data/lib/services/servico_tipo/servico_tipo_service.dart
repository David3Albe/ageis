import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class ServicoTipoService {
  final CustomDio _client = CustomDio();

  ServicoTipoService();

  Future<List<ServicoTipoModel>> GetAll() async =>
      (await _client.getList('/servico-tipo'))
          .map((e) => ServicoTipoModel.fromJson(e))
          .toList();

  Future<(String message, ServicoTipoModel servicoTipo)?> save(
    ServicoTipoModel obj,
  ) async {
    return await _client.post(
      '/servico-tipo',
      obj,
      (dynamic json) => ServicoTipoModel.fromJson(json),
    );
  }

  Future<(String message, ServicoTipoModel servicoTipo)?> delete(
    ServicoTipoModel obj,
  ) async {
    return await _client.delete(
      '/servico-tipo/${obj.cod}',
      obj,
      (dynamic json) => ServicoTipoModel.fromJson(json),
    );
  }
}
