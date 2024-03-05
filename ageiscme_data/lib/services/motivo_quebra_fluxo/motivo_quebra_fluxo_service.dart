import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class MotivoQuebraFluxoService {
  final CustomDio _client = CustomDio();

  MotivoQuebraFluxoService();

  Future<List<MotivoQuebraFluxoModel>> GetAll() async =>
      (await _client.getList('/motivo-quebra-fluxo'))
          .map((e) => MotivoQuebraFluxoModel.fromJson(e))
          .toList();
          
  Future<(String message, MotivoQuebraFluxoModel motivoQuebraFluxo)?> save(
    MotivoQuebraFluxoModel obj,
  ) async {
    return await _client.post(
      '/motivo-quebra-fluxo',
      obj,
      (dynamic json) => MotivoQuebraFluxoModel.fromJson(json),
    );
  }

  Future<(String message, MotivoQuebraFluxoModel motivoQuebraFluxo)?> delete(
    MotivoQuebraFluxoModel obj,
  ) async {
    return await _client.delete(
      '/motivo-quebra-fluxo/${obj.cod}',
      obj,
      (dynamic json) => MotivoQuebraFluxoModel.fromJson(json),
    );
  }
}
