import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/kit/remover_item_kit/remover_item_kit_dto.dart';
import 'package:ageiscme_models/response_dto/kit/remover_item_kit_response/remover_item_kit_response_dto.dart';

class RemoverItemKitService {
  final CustomDio _client = CustomDio();

  RemoverItemKitService();

  Future<(String message, RemoverItemKitResponseDTO remocao)?> removerItemKit(
    RemoverItemKitDTO obj,
  ) async {
    return await _client.post(
      '/remover-item-kit',
      obj,
      (dynamic json) => RemoverItemKitResponseDTO.fromJson(json),
    );
  }
}
