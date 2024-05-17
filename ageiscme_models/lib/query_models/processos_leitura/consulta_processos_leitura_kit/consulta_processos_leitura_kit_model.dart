import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_kit_model.g.dart';
part 'consulta_processos_leitura_kit_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraKitModel
    with _$ConsultaProcessosLeituraKitModel {
  const ConsultaProcessosLeituraKitModel._();

  factory ConsultaProcessosLeituraKitModel({
    required int cod,
    required String codBarra,
    String? nome,
    String? restricao,
  }) = _ConsultaProcessosLeituraKitModel;

  factory ConsultaProcessosLeituraKitModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraKitModelFromJson(json);

  static ConsultaProcessosLeituraKitModel copy(
      ConsultaProcessosLeituraKitModel obj) {
    return ConsultaProcessosLeituraKitModel.fromJson(obj.toJson());
  }
}
