import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/processo_leitura/processo_leitura_filter.dart';

class ProcessoLeituraService {
  final CustomDio _client = CustomDio();

  ProcessoLeituraService();

  Future<int> countFilter(
    ProcessoLeituraFilter filter,
  ) async {
    return await _client.countFilter('/processo-leitura/filter-count', filter);
  }
}
