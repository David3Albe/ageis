import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_prioridade_model.g.dart';
part 'consulta_processos_leitura_prioridade_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraPrioridadeModel
    with _$ConsultaProcessosLeituraPrioridadeModel {
  const ConsultaProcessosLeituraPrioridadeModel._();

  factory ConsultaProcessosLeituraPrioridadeModel({
    required int cod,
    required String nome,
  }) = _ConsultaProcessosLeituraPrioridadeModel;

  factory ConsultaProcessosLeituraPrioridadeModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraPrioridadeModelFromJson(json);

  static ConsultaProcessosLeituraPrioridadeModel copy(
      ConsultaProcessosLeituraPrioridadeModel obj) {
    return ConsultaProcessosLeituraPrioridadeModel.fromJson(obj.toJson());
  }
}
