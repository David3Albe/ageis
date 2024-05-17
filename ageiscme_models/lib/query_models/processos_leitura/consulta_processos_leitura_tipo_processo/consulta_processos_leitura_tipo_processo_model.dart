import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_tipo_processo_model.g.dart';
part 'consulta_processos_leitura_tipo_processo_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraTipoProcessoModel
    with _$ConsultaProcessosLeituraTipoProcessoModel {
  const ConsultaProcessosLeituraTipoProcessoModel._();

  factory ConsultaProcessosLeituraTipoProcessoModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraTipoProcessoModel;

  factory ConsultaProcessosLeituraTipoProcessoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraTipoProcessoModelFromJson(json);

  static ConsultaProcessosLeituraTipoProcessoModel copy(
      ConsultaProcessosLeituraTipoProcessoModel obj) {
    return ConsultaProcessosLeituraTipoProcessoModel.fromJson(obj.toJson());
  }
}
