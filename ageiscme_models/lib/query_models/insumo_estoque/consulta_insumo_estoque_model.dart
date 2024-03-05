import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_insumo_estoque_model.g.dart';
part 'consulta_insumo_estoque_model.freezed.dart';

@unfreezed
sealed class ConsultaInsumoEstoqueModel with _$ConsultaInsumoEstoqueModel {
  const ConsultaInsumoEstoqueModel._();

  factory ConsultaInsumoEstoqueModel({
    required double? qtdeDisponivel,
    required String? nomeInsumo,
    required String? unidadeMedida,
    required double? pontoReposicao,
    required double? estoqueMinimo,
    required double? estoqueMaximo,
    required int? prazoEntregaDias,
  }) = _ConsultaInsumoEstoqueModel;

  factory ConsultaInsumoEstoqueModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaInsumoEstoqueModelFromJson(json);

  static ConsultaInsumoEstoqueModel copy(ConsultaInsumoEstoqueModel obj) {
    return ConsultaInsumoEstoqueModel.fromJson(obj.toJson());
  }
}
