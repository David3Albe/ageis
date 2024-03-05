import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_estoque_vencido_model.g.dart';
part 'consulta_estoque_vencido_model.freezed.dart';

@unfreezed
sealed class ConsultaEstoqueVencidoModel with _$ConsultaEstoqueVencidoModel {
  const ConsultaEstoqueVencidoModel._();

  factory ConsultaEstoqueVencidoModel({
    required DateTime? dataValidade,
    required DateTime? dataEntrada,
    required int? codKit,
    required int? codItem,
    required String? nomeArsenalEstoque,
    required String? nomeLocalEstoque,
    required String? nomeKit,
    required String? nomeItem,
    required String? idEtiqueta,
    required String? codBarra,
  }) = _ConsultaEstoqueVencidoModel;

  factory ConsultaEstoqueVencidoModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaEstoqueVencidoModelFromJson(json);

  static ConsultaEstoqueVencidoModel copy(ConsultaEstoqueVencidoModel obj) {
    return ConsultaEstoqueVencidoModel.fromJson(obj.toJson());
  }
}
