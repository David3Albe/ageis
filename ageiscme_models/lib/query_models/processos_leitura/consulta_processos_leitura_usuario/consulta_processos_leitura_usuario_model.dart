import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_usuario_model.g.dart';
part 'consulta_processos_leitura_usuario_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraUsuarioModel
    with _$ConsultaProcessosLeituraUsuarioModel {
  const ConsultaProcessosLeituraUsuarioModel._();

  factory ConsultaProcessosLeituraUsuarioModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraUsuarioModel;

  factory ConsultaProcessosLeituraUsuarioModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraUsuarioModelFromJson(json);

  static ConsultaProcessosLeituraUsuarioModel copy(
      ConsultaProcessosLeituraUsuarioModel obj) {
    return ConsultaProcessosLeituraUsuarioModel.fromJson(obj.toJson());
  }
}
