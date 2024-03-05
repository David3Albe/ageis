import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/direito/direito_filter.dart';
import 'package:ageiscme_models/models/direito/direito_model.dart';

class DireitoService {
  final CustomDio _client = CustomDio();

  DireitoService();

  Future<List<DireitoModel>> GetAll() async =>
      (await _client.getList('/direito'))
          .map((e) => DireitoModel.fromJson(e))
          .toList();

  Future<List<DireitoModel>> Filter(DireitoFilter filter) async =>
      (await _client.postList('/direito/filter', filter))
          .map((e) => DireitoModel.fromJson(e))
          .toList();

  Future<(String message, DireitoModel direito)?> save(
    DireitoModel obj,
  ) async {
    return await _client.post(
      '/direito',
      obj,
      (dynamic json) => DireitoModel.fromJson(json),
    );
  }

  Future<(String message, DireitoModel direito)?> delete(
    DireitoModel obj,
  ) async {
    return await _client.delete(
      '/direito/${obj.cod}',
      obj,
      (dynamic json) => DireitoModel.fromJson(json),
    );
  }
}
