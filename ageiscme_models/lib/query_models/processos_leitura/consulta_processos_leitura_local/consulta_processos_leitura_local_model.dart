import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_local_model.g.dart';
part 'consulta_processos_leitura_local_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraLocalModel
    with _$ConsultaProcessosLeituraLocalModel {
  const ConsultaProcessosLeituraLocalModel._();

  factory ConsultaProcessosLeituraLocalModel({
        required int cod,
        required String nome,
  }) = _ConsultaProcessosLeituraLocalModel;

  factory ConsultaProcessosLeituraLocalModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraLocalModelFromJson(json);

  static ConsultaProcessosLeituraLocalModel copy(
      ConsultaProcessosLeituraLocalModel obj) {
    return ConsultaProcessosLeituraLocalModel.fromJson(obj.toJson());
  }
}
