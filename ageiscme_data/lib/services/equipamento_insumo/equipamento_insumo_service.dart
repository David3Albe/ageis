import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_delete/equipamento_insumo_delete_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_dto.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_save/equipamento_insumo_save_dto.dart';
import 'package:ageiscme_models/dto/insumos_por_equipamento_simplificado/insumos_por_equipamento_simplificado_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_delete_response/equipamento_insumo_delete_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_save_response/equipamento_insumo_save_response_dto.dart';
import 'package:ageiscme_models/response_dto/insumos_por_equipamento_simplificado/insumos_por_equipamento_simplificado_response_dto.dart';

class EquipamentoInsumoService {
  final CustomDio _client = CustomDio();

  static const String serviceBaseRoute = '/equipamento-insumo';

  EquipamentoInsumoService();

  Future<EquipamentoInsumoResponseDTO?> Filter(
    EquipamentoInsumoDTO filter,
  ) async =>
      await _client.postFilter(
        '$serviceBaseRoute/filter',
        filter,
        (e) => EquipamentoInsumoResponseDTO.fromJson(e),
      );

  Future<(String, EquipamentoInsumoDeleteResponseDTO)?> Delete(
    EquipamentoInsumoDeleteDTO filter,
  ) async =>
      await _client.delete(
        serviceBaseRoute,
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
      serviceBaseRoute,
      obj,
      (dynamic json) => EquipamentoInsumoSaveResponseDTO.fromJson(json),
    );
  }

  Future<
      (
        String message,
        InsumosPorEquipamentoSimplificadoResponseDTO? insumosPorEquipamento
      )?> getInsumosPorEquipamentoSimplificado(
    InsumosPorEquipamentoSimplificadoDTO dto,
  ) async =>
      await _client.post(
        '$serviceBaseRoute/insumos-equipamento-simplificado',
        dto,
        (dynamic json) =>
            InsumosPorEquipamentoSimplificadoResponseDTO.fromJson(json),
      );
}
