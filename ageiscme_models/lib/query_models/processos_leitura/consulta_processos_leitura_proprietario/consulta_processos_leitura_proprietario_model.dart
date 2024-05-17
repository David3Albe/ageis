import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_proprietario_model.g.dart';
part 'consulta_processos_leitura_proprietario_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraProprietarioModel
    with _$ConsultaProcessosLeituraProprietarioModel {
  const ConsultaProcessosLeituraProprietarioModel._();

  factory ConsultaProcessosLeituraProprietarioModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraProprietarioModel;

  factory ConsultaProcessosLeituraProprietarioModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraProprietarioModelFromJson(json);

  static ConsultaProcessosLeituraProprietarioModel copy(
      ConsultaProcessosLeituraProprietarioModel obj) {
    return ConsultaProcessosLeituraProprietarioModel.fromJson(obj.toJson());
  }
}
