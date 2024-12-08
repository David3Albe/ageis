import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/registros/expirar/registros_expirar_search_dto.dart';
import 'package:ageiscme_models/dto/registros/remover/registros_expirar_remover_dto.dart';
import 'package:ageiscme_models/response_dto/registros/expirar/registros_expirar_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/registros/remover/registros_expirar_remover_response_dto.dart';

class RegistrosExpirarService {
  final CustomDio _client = CustomDio();

  static const String baseRoute = '/registros-expirar/';

  RegistrosExpirarService();

  Future<List<RegistrosExpirarSearchResponseDTO>> searchExpirar(
    RegistrosExpirarSearchDTO filter,
  ) async =>
      (await _client.postList(
        baseRoute + 'search-expirar',
        filter,
      ))
          .map((e) => RegistrosExpirarSearchResponseDTO.fromJson(e))
          .toList();

  Future<(String, RegistrosExpirarRemoverResponseDTO)?> remover(
    RegistrosExpirarRemoverDTO dto,
  ) async =>
      await _client.post(
        baseRoute + 'remover',
        dto,
        (dynamic json) => RegistrosExpirarRemoverResponseDTO.fromJson(json),
      );
}
