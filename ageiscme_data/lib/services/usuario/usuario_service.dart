import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/usuario/restrito/usuario_restrito_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/models/usuario/usuario_model.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/restrito/usuario_restrito_response_dto.dart';

class UsuarioService {
  static const _baseRoute = '/usuario/';

  final CustomDio _client = CustomDio();

  UsuarioService();

  Future<List<UsuarioModel>> GetAll() async =>
      (await _client.getList(_baseRoute))
          .map((e) => UsuarioModel.fromJson(e))
          .toList();

  Future<List<UsuarioModel>> Filter(UsuarioFilter filter) async =>
      (await _client.postList(_baseRoute + 'filter', filter))
          .map((e) => UsuarioModel.fromJson(e))
          .toList();

  Future<UsuarioModel?> FilterOne(
    UsuarioFilter filter,
  ) async =>
      await _client.postFilter(
        _baseRoute + 'filter-one',
        filter,
        (dynamic json) => UsuarioModel.fromJson(json),
      );

  Future<(String message, UsuarioModel usuario)?> save(
    UsuarioModel obj,
  ) async {
    return await _client.post(
      _baseRoute,
      obj,
      (dynamic json) => UsuarioModel.fromJson(json),
    );
  }

  Future<(String message, UsuarioModel usuario)?> delete(
    UsuarioModel obj,
  ) async {
    return await _client.delete(
      _baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => UsuarioModel.fromJson(json),
    );
  }

  Future<(String, List<UsuarioDropDownSearchResponseDTO>)?> getDropDownSearch(
    UsuarioDropDownSearchDTO dto,
  ) async =>
      await _client.post(
        _baseRoute + 'drop-down-search',
        dto,
        (dynamic json) => (json as List<dynamic>)
            .map((e) => UsuarioDropDownSearchResponseDTO.fromJson(e))
            .toList(),
      );

  Future<(String, UsuarioRestritoResponseDTO)?> possuiPerfilRestrito({
    required UsuarioRestritoDTO dto,
  }) async {
    return await _client.post(
      _baseRoute + 'restrito',
      dto,
      (dynamic json) => UsuarioRestritoResponseDTO.fromJson(json),
    );
  }

  Future<bool> UsuarioAtualPossuiPerfilRestrito() async {
    (String, UsuarioRestritoResponseDTO)? result =
        await possuiPerfilRestrito(dto: UsuarioRestritoDTO());
    return result?.$2.restrito == true;
  }
}
