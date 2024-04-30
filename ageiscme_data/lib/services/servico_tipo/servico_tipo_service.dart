import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/servico_tipo/drop_down_search/servico_tipo_drop_down_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/servico_tipo/drop_down_search/servico_tipo_drop_down_search_response_dto.dart';

class ServicoTipoService {
  final CustomDio _client = CustomDio();
  static const String _baseRoute = '/servico-tipo/';

  ServicoTipoService();

  Future<List<ServicoTipoModel>> GetAll() async =>
      (await _client.getList(_baseRoute))
          .map((e) => ServicoTipoModel.fromJson(e))
          .toList();

  Future<(String message, ServicoTipoModel servicoTipo)?> save(
    ServicoTipoModel obj,
  ) async {
    return await _client.post(
      _baseRoute,
      obj,
      (dynamic json) => ServicoTipoModel.fromJson(json),
    );
  }

  Future<(String, List<ServicoTipoDropDownSearchResponseDTO>)?>
      getDropDownSearch(
    ServicoTipoDropDownSearchDTO dto,
  ) async =>
          await _client.post(
            _baseRoute + 'drop-down-search',
            dto,
            (dynamic json) => (json as List<dynamic>)
                .map((e) => ServicoTipoDropDownSearchResponseDTO.fromJson(e))
                .toList(),
          );

  Future<(String message, ServicoTipoModel servicoTipo)?> delete(
    ServicoTipoModel obj,
  ) async {
    return await _client.delete(
      _baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => ServicoTipoModel.fromJson(json),
    );
  }
}
