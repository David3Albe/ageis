import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/imagem/imagem_filter.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';

class ImagemService {
  final CustomDio _client = CustomDio();

  ImagemService();

  Future<List<ImagemModel>> GetAll() async => (await _client.getList('/imagem'))
      .map((e) => ImagemModel.fromJson(e))
      .toList();

  Future<ImagemModel?> FilterOne(
    ImagemFilter filter,
  ) async =>
      await _client.postFilter(
        '/imagem/filter-one',
        filter,
        (dynamic json) => ImagemModel.fromJson(json),
      );

  Future<List<ImagemModel>?> Filter(
    ImagemFilter obj,
  ) async {
    return await _client.postFilter<List<ImagemModel>>(
      '/imagem/filter',
      obj,
      (dynamic json) =>
          (json as List<dynamic>).map((e) => ImagemModel.fromJson(e)).toList(),
    );
  }

  Future<(String message, ImagemModel imagem)?> save(
    ImagemModel obj,
  ) async {
    return await _client.post(
      '/imagem',
      obj,
      (dynamic json) => ImagemModel.fromJson(json),
    );
  }

  Future<(String message, ImagemModel imagem)?> delete(
    ImagemModel obj,
  ) async {
    return await _client.delete(
      '/imagem/${obj.cod}',
      obj,
      (dynamic json) => ImagemModel.fromJson(json),
    );
  }
}
