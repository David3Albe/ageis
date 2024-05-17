import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_equipamento_model.g.dart';
part 'consulta_processos_leitura_equipamento_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraEquipamentoModel
    with _$ConsultaProcessosLeituraEquipamentoModel {
  const ConsultaProcessosLeituraEquipamentoModel._();

  factory ConsultaProcessosLeituraEquipamentoModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraEquipamentoModel;

  factory ConsultaProcessosLeituraEquipamentoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraEquipamentoModelFromJson(json);

  static ConsultaProcessosLeituraEquipamentoModel copy(
      ConsultaProcessosLeituraEquipamentoModel obj) {
    return ConsultaProcessosLeituraEquipamentoModel.fromJson(obj.toJson());
  }
}
