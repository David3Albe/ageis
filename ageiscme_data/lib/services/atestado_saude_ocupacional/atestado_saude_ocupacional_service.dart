import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/atestado_saude_ocupacional/atestado_saude_ocupacional_filter.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';

class AtestadoSaudeOcupacionalService {
  final CustomDio _client = CustomDio();

  AtestadoSaudeOcupacionalService();

  Future<List<AtestadoSaudeOcupacionalModel>> GetAll() async =>
      (await _client.getList('/atestado-saude-ocupacional'))
          .map((e) => AtestadoSaudeOcupacionalModel.fromJson(e))
          .toList();

  Future<AtestadoSaudeOcupacionalModel?> FilterOne(
    AtestadoSaudeOcupacionalFilter filter,
  ) async =>
      await _client.postFilter(
        '/atestado-saude-ocupacional/filter-one',
        filter,
        (dynamic json) => AtestadoSaudeOcupacionalModel.fromJson(json),
      ); 

  Future<
      (
        String message,
        AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional
      )?> save(
    AtestadoSaudeOcupacionalModel obj,
  ) async {
    return await _client.post(
      '/atestado-saude-ocupacional',
      obj,
      (dynamic json) => AtestadoSaudeOcupacionalModel.fromJson(json),
    );
  }

  Future<
      (
        String message,
        AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional
      )?> delete(
    AtestadoSaudeOcupacionalModel obj,
  ) async {
    return await _client.delete(
      '/atestado-saude-ocupacional/${obj.cod}',
      obj,
      (dynamic json) => AtestadoSaudeOcupacionalModel.fromJson(json),
    );
  }
}
