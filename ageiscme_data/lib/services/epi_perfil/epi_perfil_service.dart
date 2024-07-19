import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/epi_perfil/find_by_epi/epi_perfil_find_by_epi_dto.dart';
import 'package:ageiscme_models/dto/epi_perfil/find_by_user/epi_perfil_find_by_user_dto.dart';
import 'package:ageiscme_models/dto/epi_perfil/insert/epi_perfil_insert_dto.dart';
import 'package:ageiscme_models/dto/epi_perfil/remove/epi_perfil_remove_dto.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/find_by_epi/epi_perfil_find_by_epi_response_dto.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/find_by_user/epi_perfil_find_by_user_response_dto.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/insert/epi_perfil_insert_response_dto.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/remove/epi_perfil_remove_response_dto.dart';

class EpiPerfilService {
  static const String BaseRoute = '/epi-perfil/';
  final CustomDio _client = CustomDio();

  EpiPerfilService();

  Future<(String, EpiPerfilFindByUserResponseDTO)?> findByUser(
    EpiPerfilFindByUserDTO dto,
  ) async =>
      await _client.post(
        BaseRoute + 'find-by-user',
        dto,
        (json) => EpiPerfilFindByUserResponseDTO.fromJson(json),
      );

  Future<(String, EpiPerfilFindByEpiResponseDTO)?> findByEpi(
    EpiPerfilFindByEpiDTO dto,
  ) async =>
      await _client.post(
        BaseRoute + 'find-by-epi',
        dto,
        (json) => EpiPerfilFindByEpiResponseDTO.fromJson(json),
      );

  Future<(String, EpiPerfilInsertResponseDTO)?> insert(
    EpiPerfilInsertDTO dto,
  ) async =>
      await _client.post(
        BaseRoute + 'insert',
        dto,
        (json) => EpiPerfilInsertResponseDTO.fromJson(json),
      );

  Future<(String, EpiPerfilRemoveResponseDTO)?> remove(
    EpiPerfilRemoveDTO dto,
  ) async =>
      await _client.post(
        BaseRoute + 'remove',
        dto,
        (json) => EpiPerfilRemoveResponseDTO.fromJson(json),
      );
}
