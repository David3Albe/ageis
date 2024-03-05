import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class TreinamentoRegistroService {
  final CustomDio _client = CustomDio();

  TreinamentoRegistroService();

  Future<List<TreinamentoRegistroModel>> GetAll() async =>
      (await _client.getList('/treinamento-registro'))
          .map((e) => TreinamentoRegistroModel.fromJson(e))
          .toList();

  Future<TreinamentoRegistroModel?> FilterOne(
    TreinamentoRegistroFilter filter,
  ) async =>
      await _client.postFilter(
        '/treinamento-registro/filter-one',
        filter,
        (dynamic json) => TreinamentoRegistroModel.fromJson(json),
      );

  Future<(String message, TreinamentoRegistroModel treinamentoRegistro)?> save(
    TreinamentoRegistroModel obj,
  ) async {
    return await _client.post(
      '/treinamento-registro',
      obj,
      (dynamic json) => TreinamentoRegistroModel.fromJson(json),
    );
  }

  Future<(String message, TreinamentoRegistroModel treinamentoRegistro)?>
      delete(
    TreinamentoRegistroModel obj,
  ) async {
    return await _client.delete(
      '/treinamento-registro/${obj.cod}',
      obj,
      (dynamic json) => TreinamentoRegistroModel.fromJson(json),
    );
  }
}
