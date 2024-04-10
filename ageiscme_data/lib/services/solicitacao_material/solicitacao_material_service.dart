import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/solicitacao_material/add/solicitacao_material_add_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/authorize/solicitacao_material_authorize_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/find_one/solicitacao_material_find_one_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/receive/solicitacao_material_receive_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/search/solicitacao_material_search_dto.dart';
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/authorize/solicitacao_material_authorize_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/find_one/solicitacao_material_find_one_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/receive/solicitacao_material_receive_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/search/solicitacao_material_search_response_dto.dart';

class SolicitacaoMaterialService {
  final CustomDio _client = CustomDio();

  SolicitacaoMaterialService();

  Future<(String, SolicitacaoMaterialFindOneResponseDTO)?> findOne(
    SolicitacaoMaterialFindOneDTO obj,
  ) async =>
      await _client.post(
        '/solicitacao-material/find-one',
        obj,
        (dynamic json) => SolicitacaoMaterialFindOneResponseDTO.fromJson(json),
      );

  Future<List<SolicitacaoMaterialModel>> GetAll() async =>
      (await _client.getList('/solicitacao-material'))
          .map((e) => SolicitacaoMaterialModel.fromJson(e))
          .toList();

  Future<(String message, SolicitacaoMaterialModel solicitacaoMaterial)?> add(
    SolicitacaoMaterialAddDTO obj,
  ) async {
    return await _client.post(
      '/solicitacao-material',
      obj,
      (dynamic json) => SolicitacaoMaterialModel.fromJson(json),
    );
  }

  Future<(String message, SolicitacaoMaterialSearchResponseDTO response)?>
      search(
    SolicitacaoMaterialSearchDTO obj,
  ) async {
    return await _client.post(
      '/solicitacao-material/search',
      obj,
      (dynamic json) => SolicitacaoMaterialSearchResponseDTO.fromJson(json),
    );
  }

  Future<(String message, SolicitacaoMaterialAuthorizeResponseDTO response)?>
      authorize(
    SolicitacaoMaterialAuthorizeDTO obj,
  ) async {
    return await _client.post(
      '/solicitacao-material/authorize',
      obj,
      (dynamic json) => SolicitacaoMaterialAuthorizeResponseDTO.fromJson(json),
    );
  }

  Future<(String message, SolicitacaoMaterialReceiveResponseDTO response)?>
      receive(
    SolicitacaoMaterialReceiveDTO obj,
  ) async {
    return await _client.post(
      '/solicitacao-material/receive',
      obj,
      (dynamic json) => SolicitacaoMaterialReceiveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, SolicitacaoMaterialModel solicitacaoMaterial)?>
      delete(
    SolicitacaoMaterialModel obj,
  ) async {
    return await _client.delete(
      '/solicitacao-material/${obj.cod}',
      obj,
      (dynamic json) => SolicitacaoMaterialModel.fromJson(json),
    );
  }
}
