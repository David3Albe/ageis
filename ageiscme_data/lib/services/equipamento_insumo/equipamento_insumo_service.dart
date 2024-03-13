import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_delete/equipamento_insumo_delete_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_save/equipamento_insumo_save_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_delete_response/equipamento_insumo_delete_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_save_response/equipamento_insumo_save_response_dto.dart';

class EquipamentoInsumoService {
  final CustomDio _client = CustomDio();

  EquipamentoInsumoService();

  Future<EquipamentoInsumoResponseDTO?> Filter(
    EquipamentoInsumoDTO filter,
  ) async =>
      await _client.postFilter(
        '/equipamento-insumo/filter',
        filter,
        (e) => EquipamentoInsumoResponseDTO.fromJson(e),
      );

  Future<(String, EquipamentoInsumoDeleteResponseDTO)?> Delete(
    EquipamentoInsumoDeleteDTO filter,
  ) async =>
      await _client.delete(
        '/equipamento-insumo',
        filter,
        (e) => EquipamentoInsumoDeleteResponseDTO.fromJson(e),
      );

  Future<
      (
        String message,
        EquipamentoInsumoSaveResponseDTO? equipamentoInsumoSaveResponseDto
      )?> save(
    EquipamentoInsumoSaveDTO obj,
  ) async {
    return await _client.post(
      '/equipamento-insumo',
      obj,
      (dynamic json) => EquipamentoInsumoSaveResponseDTO.fromJson(json),
    );
  }
}
