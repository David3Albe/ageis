import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_motivo_quebra_fluxo_model.g.dart';
part 'consulta_processos_leitura_motivo_quebra_fluxo_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraMotivoQuebraFluxoModel
    with _$ConsultaProcessosLeituraMotivoQuebraFluxoModel {
  const ConsultaProcessosLeituraMotivoQuebraFluxoModel._();

  factory ConsultaProcessosLeituraMotivoQuebraFluxoModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraMotivoQuebraFluxoModel;

  factory ConsultaProcessosLeituraMotivoQuebraFluxoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraMotivoQuebraFluxoModelFromJson(json);

  static ConsultaProcessosLeituraMotivoQuebraFluxoModel copy(
      ConsultaProcessosLeituraMotivoQuebraFluxoModel obj) {
    return ConsultaProcessosLeituraMotivoQuebraFluxoModel.fromJson(obj.toJson());
  }
}
