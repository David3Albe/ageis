import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/registro_servico/registro_servico_filter.dart';
import 'package:ageiscme_models/main.dart';

class RegistroServicoService {
  final CustomDio _client = CustomDio();

  RegistroServicoService();

  Future<List<RegistroServicoModel>> GetAll() async =>
      (await _client.getList('/registro-servico'))
          .map((e) => RegistroServicoModel.fromJson(e))
          .toList();

  Future<List<RegistroServicoModel>> Filter(
    RegistroServicoFilter filter,
  ) async =>
      (await _client.postList('/registro-servico/filter', filter))
          .map((e) => RegistroServicoModel.fromJson(e))
          .toList();

  Future<RegistroServicoModel?> FilterOne(
    RegistroServicoFilter filter,
  ) async =>
      await _client.postFilter(
        '/registro-servico/filter-one',
        filter,
        (dynamic json) => RegistroServicoModel.fromJson(json),
      );

  Future<(String message, RegistroServicoModel registroServico)?> save(
    RegistroServicoModel obj,
  ) async {
    return await _client.post(
      '/registro-servico',
      obj,
      (dynamic json) => RegistroServicoModel.fromJson(json),
    );
  }

  Future<(String message, RegistroServicoModel registroServico)?> delete(
    RegistroServicoModel obj,
  ) async {
    return await _client.delete(
      '/registro-servico/${obj.cod}',
      obj,
      (dynamic json) => RegistroServicoModel.fromJson(json),
    );
  }
}
