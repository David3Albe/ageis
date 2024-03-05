import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_devolvido_model.g.dart';
part 'consulta_processos_leitura_devolvido_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDevolvidoModel
    with _$ConsultaProcessosLeituraDevolvidoModel {
  const ConsultaProcessosLeituraDevolvidoModel._();

  factory ConsultaProcessosLeituraDevolvidoModel({
    required int? codLocal,
    required String? nomeLocal,
    required int? qtde,
  }) = _ConsultaProcessosLeituraDevolvidoModel;

  factory ConsultaProcessosLeituraDevolvidoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDevolvidoModelFromJson(json);

  static ConsultaProcessosLeituraDevolvidoModel copy(
      ConsultaProcessosLeituraDevolvidoModel obj) {
    return ConsultaProcessosLeituraDevolvidoModel.fromJson(obj.toJson());
  }
}
