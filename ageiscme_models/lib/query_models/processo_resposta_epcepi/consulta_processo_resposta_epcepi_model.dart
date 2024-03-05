import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processo_resposta_epcepi_model.g.dart';
part 'consulta_processo_resposta_epcepi_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessoRespostaEPCEPIModel
    with _$ConsultaProcessoRespostaEPCEPIModel {
  const ConsultaProcessoRespostaEPCEPIModel._();

  factory ConsultaProcessoRespostaEPCEPIModel({
    required DateTime? dataHora,
    required int? codEquipamento,
    required String? nomeEquipamento,
    required String? nomeUsuario,
    required String? resposta,
    required String? entradaSaida,
  }) = _ConsultaProcessoRespostaEPCEPIModel;

  factory ConsultaProcessoRespostaEPCEPIModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessoRespostaEPCEPIModelFromJson(json);

  static ConsultaProcessoRespostaEPCEPIModel copy(
      ConsultaProcessoRespostaEPCEPIModel obj) {
    return ConsultaProcessoRespostaEPCEPIModel.fromJson(obj.toJson());
  }
}
