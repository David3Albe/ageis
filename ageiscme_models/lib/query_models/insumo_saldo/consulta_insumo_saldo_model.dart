import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_insumo_saldo_model.g.dart';
part 'consulta_insumo_saldo_model.freezed.dart';

@unfreezed
sealed class ConsultaInsumoSaldoModel with _$ConsultaInsumoSaldoModel {
  const ConsultaInsumoSaldoModel._();

  factory ConsultaInsumoSaldoModel({
    required int? codDeposito,
    required int? codInsumo,
    required String? lote,
    required double? qtdeDisponivel,
    required String? status,
    required DateTime? dataFabricacao,
    required DateTime? dataValidade,
    required DateTime? dataValidadePosAtivacao,
    required DepositoInsumoModel? depositoInsumo,
    required InsumoModel? insumo,
  }) = _ConsultaInsumoSaldoModel;

  factory ConsultaInsumoSaldoModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaInsumoSaldoModelFromJson(json);

  static ConsultaInsumoSaldoModel copy(ConsultaInsumoSaldoModel obj) {
    return ConsultaInsumoSaldoModel.fromJson(obj.toJson());
  }
}
