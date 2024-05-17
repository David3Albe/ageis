import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_motivo_model.g.dart';
part 'consulta_processos_leitura_motivo_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraMotivoModel
    with _$ConsultaProcessosLeituraMotivoModel {
  const ConsultaProcessosLeituraMotivoModel._();

  factory ConsultaProcessosLeituraMotivoModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraMotivoModel;

  factory ConsultaProcessosLeituraMotivoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraMotivoModelFromJson(json);

  static ConsultaProcessosLeituraMotivoModel copy(
      ConsultaProcessosLeituraMotivoModel obj) {
    return ConsultaProcessosLeituraMotivoModel.fromJson(obj.toJson());
  }
}
