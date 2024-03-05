import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class FornecedorService {
  final CustomDio _client = CustomDio();

  FornecedorService();

  Future<List<FornecedorModel>> GetAll() async =>
      (await _client.getList('/fornecedor'))
          .map((e) => FornecedorModel.fromJson(e))
          .toList();

  Future<(String message, FornecedorModel fornecedor)?> save(
    FornecedorModel obj,
  ) async {
    return await _client.post(
      '/fornecedor',
      obj,
      (dynamic json) => FornecedorModel.fromJson(json),
    );
  }

  Future<(String message, FornecedorModel fornecedor)?> delete(
    FornecedorModel obj,
  ) async {
    return await _client.delete(
      '/fornecedor/${obj.cod}',
      obj,
      (dynamic json) => FornecedorModel.fromJson(json),
    );
  }
}
