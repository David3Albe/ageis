import 'package:ageiscme_data/shared/app_config.dart';
import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_mixins/mixins/image/image_service_mixin.dart';
import 'package:ageiscme_models/filters/imagem/imagem_filter.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';

class ImagemService with ImageServiceMixin {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/imagem/';

  ImagemService();

  Future<String> getUrlImage({required String identificador}) async {
    String urlBase = (await AppConfig.forEnvironment(false)).apiUrl;
    urlBase += BASE_URL;
    urlBase += 'get-one-by-identificador/$identificador/image';
    return urlBase;
  }

  Future<List<ImagemModel>> GetAll() async => (await _client.getList(BASE_URL))
      .map((e) => ImagemModel.fromJson(e))
      .toList();

  Future<ImagemModel?> FilterOne(
    ImagemFilter filter,
  ) async =>
      await _client.postFilter(
        BASE_URL + 'filter-one',
        filter,
        (dynamic json) => ImagemModel.fromJson(json),
      );

  Future<List<ImagemModel>?> Filter(
    ImagemFilter obj,
  ) async {
    return await _client.postFilter<List<ImagemModel>>(
      BASE_URL + 'filter',
      obj,
      (dynamic json) =>
          (json as List<dynamic>).map((e) => ImagemModel.fromJson(e)).toList(),
    );
  }

  Future<ImagemModel?> getLogoIdentificador({
    required String identificador,
  }) async {
    return ImagemModel.fromJson(
      await _client.getOne(
        BASE_URL + 'get-one-by-identificador/$identificador',
      ),
    );
  }

  Future<ImagemModel?> getLogoAgeis() async {
    return ImagemModel.fromJson(
      await _client.getOne(
        BASE_URL + 'get-one-by-identificador/logo_ageis',
      ),
    );
  }

  Future<(String message, ImagemModel imagem)?> save(
    ImagemModel obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => ImagemModel.fromJson(json),
    );
  }

  Future<(String message, ImagemModel imagem)?> delete(
    ImagemModel obj,
  ) async {
    return await _client.delete(
      BASE_URL + '${obj.cod}',
      obj,
      (dynamic json) => ImagemModel.fromJson(json),
    );
  }
}
