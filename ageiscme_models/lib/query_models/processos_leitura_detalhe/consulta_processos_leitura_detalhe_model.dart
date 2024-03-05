import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_detalhe_model.g.dart';
part 'consulta_processos_leitura_detalhe_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDetalheModel
    with _$ConsultaProcessosLeituraDetalheModel {
  const ConsultaProcessosLeituraDetalheModel._();

  factory ConsultaProcessosLeituraDetalheModel({
    required String? entregaRetirada,
    required int? codUsuarioEntrega,
    required String? nomeUsuarioEntrega,
    required int? codUsuarioRetirada,
    required String? nomeUsuarioRetirada,
    required int? codLocalEntrega,
    required String? nomeLocalEntrega,
    required int? codLocalRetirada,
    required String? nomeLocalRetirada,
    required int? codCirurgiao,
    required String? nomeCirurgiao,
    required String? prontuarioRetirada,
    required bool? conferidoVisualmente,
    required String? nivelPrioridade,
    required String? observacao,
    required int? codRegistroProcesso,
  }) = _ConsultaProcessosLeituraDetalheModel;

  factory ConsultaProcessosLeituraDetalheModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDetalheModelFromJson(json);

  static ConsultaProcessosLeituraDetalheModel copy(
      ConsultaProcessosLeituraDetalheModel obj) {
    return ConsultaProcessosLeituraDetalheModel.fromJson(obj.toJson());
  }
}
