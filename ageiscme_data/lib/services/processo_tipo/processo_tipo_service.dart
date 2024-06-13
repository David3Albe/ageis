import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/processo_tipo/ultima_leitura/processo_tipo_ultima_leitura_item_kit_dto.dart';
import 'package:ageiscme_models/filters/processo_tipo/processo_tipo_filter.dart';
import 'package:ageiscme_models/models/processo_tipo/processo_tipo_model.dart';
import 'package:ageiscme_models/response_dto/processo_tipo/ultima_leitura/processo_tipo_ultima_leitura_item_kit_response_dto.dart';

class ProcessoTipoService {
  final CustomDio _client = CustomDio();

  ProcessoTipoService();

  Future<List<ProcessoTipoModel>> GetAll() async =>
      (await _client.getList('/processo-tipo'))
          .map((e) => ProcessoTipoModel.fromJson(e))
          .toList();

  Future<List<ProcessoTipoModel>> Filter(ProcessoTipoFilter filter) async =>
      (await _client.postList('/processo-tipo/filter', filter))
          .map((e) => ProcessoTipoModel.fromJson(e))
          .toList();

  Future<ProcessoTipoModel?> FilterOne(
    ProcessoTipoFilter filter,
  ) async =>
      await _client.postFilter(
        '/processo-tipo/filter-one',
        filter,
        (dynamic json) => ProcessoTipoModel.fromJson(json),
      );

  Future<ProcessoTipoModel?> FilterOneV2(
    ProcessoTipoFilter filter,
  ) async =>
      await _client.postFilter(
        '/processo-tipo/filter-one-v2',
        filter,
        (dynamic json) => ProcessoTipoModel.fromJson(json),
      );

  Future<(String message, ProcessoTipoModel processoTipo)?> save(
    ProcessoTipoModel obj,
  ) async {
    return await _client.post(
      '/processo-tipo',
      obj,
      (dynamic json) => ProcessoTipoModel.fromJson(json),
    );
  }

  Future<(String message, ProcessoTipoModel processoTipo)?> delete(
    ProcessoTipoModel obj,
  ) async {
    return await _client.delete(
      '/processo-tipo/${obj.cod}',
      obj,
      (dynamic json) => ProcessoTipoModel.fromJson(json),
    );
  }

  Future<(String message, ProcessoTipoUltimaLeituraItemKitResponseDTO dto)?> ultimoLocal(
    ProcessoTipoUltimaLeituraItemKitDTO obj,
  ) async {
    return await _client.post(
      '/processo-tipo/ultimo-local',
      obj,
      (dynamic json) => ProcessoTipoUltimaLeituraItemKitResponseDTO.fromJson(json),
    );
  }
}
