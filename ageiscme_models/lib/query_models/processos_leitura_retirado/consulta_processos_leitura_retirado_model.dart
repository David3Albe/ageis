import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_retirado_model.g.dart';
part 'consulta_processos_leitura_retirado_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraRetiradoModel
    with _$ConsultaProcessosLeituraRetiradoModel {
  const ConsultaProcessosLeituraRetiradoModel._();

  factory ConsultaProcessosLeituraRetiradoModel({
    required DateTime? dataHora,
    required int? codKit,
    required String? codBarraKit,
    required String? nomeKit,
    required int? nroItemFaltantes,
    required String? idEtiqueta,
    required String? nomeItem,
    required String? entradaSaida,
    required String? nomeEtapaProcesso,
    required String? nomeUsuario,
    required String? prontuarioRetirada,
    required String? origem,
    required String? destino,
    required String? circulante,
    required DateTime? dataValidade,
    required int? codRegistroProcesso,
  }) = _ConsultaProcessosLeituraRetiradoModel;

  factory ConsultaProcessosLeituraRetiradoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraRetiradoModelFromJson(json);

  static ConsultaProcessosLeituraRetiradoModel copy(
      ConsultaProcessosLeituraRetiradoModel obj) {
    return ConsultaProcessosLeituraRetiradoModel.fromJson(obj.toJson());
  }
}
