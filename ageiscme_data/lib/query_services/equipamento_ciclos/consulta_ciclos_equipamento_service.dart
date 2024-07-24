import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/equipamento_ciclo/consulta_equipamento_ciclo_filter.dart';
import 'package:ageiscme_models/query_models/equipamento_ciclos/consulta_ciclos_equipamento_dto.dart';

class ConsultaCiclosEquipamentoService {
  final CustomDio _client = CustomDio();

  ConsultaCiclosEquipamentoService();

  Future<(String message, List<ConsultaCiclosEquipamentoDTO> items)?> filter(
    ConsultaEquipamentoCicloFilter obj,
  ) async {
    return await _client.post(
      '/consulta-ciclos-equipamento',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaCiclosEquipamentoDTO.fromJson(e))
          .toList(),
    );
  }
}
