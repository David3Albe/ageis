import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/kit/repor_item_kit/repor_item_kit_dto.dart';
import 'package:ageiscme_models/response_dto/kit/repor_item_kit_response/repor_item_kit_response_dto.dart';

class ReporItemKitService {
  final CustomDio _client = CustomDio();

  ReporItemKitService();

  Future<(String message, ReporItemKitResponseDTO reposicao)?> reporItemKit(
    ReporItemKitDTO obj,
  ) async {
    return await _client.post(
      '/repor-item-kit',
      obj,
      (dynamic json) => ReporItemKitResponseDTO.fromJson(json),
    );
  }
}
