import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_embalagem_model.g.dart';
part 'consulta_processos_leitura_embalagem_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraEmbalagemModel
    with _$ConsultaProcessosLeituraEmbalagemModel {
  const ConsultaProcessosLeituraEmbalagemModel._();

  factory ConsultaProcessosLeituraEmbalagemModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraEmbalagemModel;

  factory ConsultaProcessosLeituraEmbalagemModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraEmbalagemModelFromJson(json);

  static ConsultaProcessosLeituraEmbalagemModel copy(
      ConsultaProcessosLeituraEmbalagemModel obj) {
    return ConsultaProcessosLeituraEmbalagemModel.fromJson(obj.toJson());
  }
}
