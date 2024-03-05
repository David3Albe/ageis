import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_estoque_disponivel_model.g.dart';
part 'consulta_estoque_disponivel_model.freezed.dart';

@unfreezed
sealed class ConsultaEstoqueDisponivelModel
    with _$ConsultaEstoqueDisponivelModel {
  const ConsultaEstoqueDisponivelModel._();

  factory ConsultaEstoqueDisponivelModel({
    required DateTime? dataValidade,
    required String? nomeArsenal,
    required String? local,
    required String? nomeProprietario,
    required String? nomeKit,
    required int? codKit,
    required String? codBarraKit,
    required String? nomeItem,
    required int? codItem,
    required String? idEtiqueta,
    required DateTime? dataEntrada,
  }) = _ConsultaEstoqueDisponivelModel;

  factory ConsultaEstoqueDisponivelModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaEstoqueDisponivelModelFromJson(json);

  static ConsultaEstoqueDisponivelModel copy(
      ConsultaEstoqueDisponivelModel obj) {
    return ConsultaEstoqueDisponivelModel.fromJson(obj.toJson());
  }
}
