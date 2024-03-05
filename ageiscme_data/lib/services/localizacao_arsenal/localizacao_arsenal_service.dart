import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class LocalizacaoArsenalService {
  final CustomDio _client = CustomDio();

  LocalizacaoArsenalService();

  Future<List<LocalizacaoArsenalModel>> GetAll() async =>
      (await _client.getList('/localizacao-arsenal'))
          .map((e) => LocalizacaoArsenalModel.fromJson(e))
          .toList();

  Future<(String message, LocalizacaoArsenalModel localizacaoArsenal)?> save(
    LocalizacaoArsenalModel obj,
  ) async {
    return await _client.post(
      '/localizacao-arsenal',
      obj,
      (dynamic json) => LocalizacaoArsenalModel.fromJson(json),
    );
  }

  Future<(String message, LocalizacaoArsenalModel localizacaoArsenal)?> delete(
    LocalizacaoArsenalModel obj,
  ) async {
    return await _client.delete(
      '/localizacao-arsenal/${obj.cod}',
      obj,
      (dynamic json) => LocalizacaoArsenalModel.fromJson(json),
    );
  }
}
