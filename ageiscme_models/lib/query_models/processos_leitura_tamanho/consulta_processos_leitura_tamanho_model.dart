import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_tamanho_model.g.dart';
part 'consulta_processos_leitura_tamanho_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraTamanhoModel
    with _$ConsultaProcessosLeituraTamanhoModel {
  const ConsultaProcessosLeituraTamanhoModel._();

  factory ConsultaProcessosLeituraTamanhoModel({
    required String? nomeCentroCusto,
    required String? nomeLocal,
    required String? tamanho,
    required int? qtde,
    required int? codLocal,
  }) = _ConsultaProcessosLeituraTamanhoModel;

  factory ConsultaProcessosLeituraTamanhoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraTamanhoModelFromJson(json);

  static ConsultaProcessosLeituraTamanhoModel copy(
      ConsultaProcessosLeituraTamanhoModel obj) {
    return ConsultaProcessosLeituraTamanhoModel.fromJson(obj.toJson());
  }
}
