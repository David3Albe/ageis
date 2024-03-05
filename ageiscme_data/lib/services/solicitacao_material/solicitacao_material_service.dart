import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';

class SolicitacaoMaterialService {
  final CustomDio _client = CustomDio();

  SolicitacaoMaterialService();

  Future<List<SolicitacaoMaterialModel>> GetAll() async =>
      (await _client.getList('/solicitacao-material'))
          .map((e) => SolicitacaoMaterialModel.fromJson(e))
          .toList();

  Future<(String message, SolicitacaoMaterialModel solicitacaoMaterial)?> save(
    SolicitacaoMaterialModel obj,
  ) async {
    return await _client.post(
      '/solicitacao-material',
      obj,
      (dynamic json) => SolicitacaoMaterialModel.fromJson(json),
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
