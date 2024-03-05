import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class ItemConsignadoProcessadoService {
  final CustomDio _client = CustomDio();

  ItemConsignadoProcessadoService();

  Future<List<ItemConsignadoProcessadoModel>> GetAll() async =>
      (await _client.getList('/item-consignado-processado'))
          .map((e) => ItemConsignadoProcessadoModel.fromJson(e))
          .toList();

  Future<
      (
        String message,
        ItemConsignadoProcessadoModel itemConsignadoProcessado
      )?> save(
    ItemConsignadoProcessadoModel obj,
  ) async {
    return await _client.post(
      '/item-consignado-processado',
      obj,
      (dynamic json) => ItemConsignadoProcessadoModel.fromJson(json),
    );
  }

  Future<
      (
        String message,
        ItemConsignadoProcessadoModel itemConsignadoProcessado
      )?> delete(
    ItemConsignadoProcessadoModel obj,
  ) async {
    return await _client.delete(
      '/item-consignado-processado/${obj.codRegistro}',
      obj,
      (dynamic json) => ItemConsignadoProcessadoModel.fromJson(json),
    );
  }
}
