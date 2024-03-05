import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_retirados_div_local_model.g.dart';
part 'consulta_processos_leitura_retirados_div_local_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraRetiradosDivLocalModel
    with _$ConsultaProcessosLeituraRetiradosDivLocalModel {
  const ConsultaProcessosLeituraRetiradosDivLocalModel._();

  factory ConsultaProcessosLeituraRetiradosDivLocalModel({
    required DateTime? dataHora,
    required int? codKit,
    required String? nomeKit,
    required String? idEtiqueta,
    required String? nomeDescritorItem,
    required String? entradaSaida,
    required String? nomeEtapaProcesso,
    required String? circulante,
    required String? destino,
    required String? proprietarioItem,
    required String? proprietarioKit,
    required String? nomeUsuario,
  }) = _ConsultaProcessosLeituraRetiradosDivLocalModel;

  factory ConsultaProcessosLeituraRetiradosDivLocalModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraRetiradosDivLocalModelFromJson(json);

  static ConsultaProcessosLeituraRetiradosDivLocalModel copy(
      ConsultaProcessosLeituraRetiradosDivLocalModel obj) {
    return ConsultaProcessosLeituraRetiradosDivLocalModel.fromJson(
        obj.toJson());
  }
}
