import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/epi_descritor/epi_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';

class EpiDescritorService {
  final CustomDio _client = CustomDio();

  EpiDescritorService();

  Future<List<EpiDescritorModel>> GetAll() async =>
      (await _client.getList('/epi-descritor'))
          .map((e) => EpiDescritorModel.fromJson(e))
          .toList();

  Future<EpiDescritorModel?> FilterOne(
    EpiDescritorFilter filter,
  ) async =>
      await _client.postFilter(
        '/epi-descritor/filter-one',
        filter,
        (dynamic json) => EpiDescritorModel.fromJson(json),
      );

  Future<(String message, EpiDescritorModel epiDescritor)?> save(
    EpiDescritorModel obj,
  ) async {
    return await _client.post(
      '/epi-descritor',
      obj,
      (dynamic json) => EpiDescritorModel.fromJson(json),
    );
  }

  Future<(String message, EpiDescritorModel epiDescritor)?> delete(
    EpiDescritorModel obj,
  ) async {
    return await _client.delete(
      '/epi-descritor/${obj.cod}',
      obj,
      (dynamic json) => EpiDescritorModel.fromJson(json),
    );
  }
}
