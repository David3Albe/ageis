import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/insumo/expirar/insumo_expirar_search_dto.dart';
import 'package:ageiscme_models/filters/insumo_saldo/insumo_saldo_filter.dart';
import 'package:ageiscme_models/models/insumo_saldo/insumo_saldo_model.dart';
import 'package:ageiscme_models/response_dto/insumo/expirar/insumo_expirar_search_response_dto.dart';

class InsumoSaldoService {
  final CustomDio _client = CustomDio();

  static const String baseRoute = '/insumo-saldo/';

  InsumoSaldoService();

  Future<InsumoSaldoModel?> filterOne(
    InsumoSaldoFilter obj,
  ) async {
    return await _client.postFilter(
      baseRoute+ 'filter-one',
      obj,
      (dynamic json) => InsumoSaldoModel.fromJson(json),
    );
  }

    Future<List<InsumoExpirarSearchResponseDTO>> searchExpirar(
    InsumoExpirarSearchDTO filter,
  ) async =>
      (await _client.postList(
        baseRoute + 'search-expirar',
        filter,
      ))
          .map((e) => InsumoExpirarSearchResponseDTO.fromJson(e))
          .toList();
}
