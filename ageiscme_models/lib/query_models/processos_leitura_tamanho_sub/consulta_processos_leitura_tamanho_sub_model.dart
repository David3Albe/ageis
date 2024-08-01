import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_tamanho_sub_model.g.dart';
part 'consulta_processos_leitura_tamanho_sub_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraTamanhoSubModel
    with _$ConsultaProcessosLeituraTamanhoSubModel {
  const ConsultaProcessosLeituraTamanhoSubModel._();

  factory ConsultaProcessosLeituraTamanhoSubModel({
    required String? nomeCentroCusto,
    required DateTime? dataHora,
    required String? nomeLocal,
    required String? nomeItem,
    required String? idEtiqueta,
    required String? codBarra,
    required String? nomeKit,
    required String? tamanho,
    required int? qtde,
    required int? codLocal,
  }) = _ConsultaProcessosLeituraTamanhoSubModel;

  factory ConsultaProcessosLeituraTamanhoSubModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraTamanhoSubModelFromJson(json);

  static ConsultaProcessosLeituraTamanhoSubModel copy(
      ConsultaProcessosLeituraTamanhoSubModel obj) {
    return ConsultaProcessosLeituraTamanhoSubModel.fromJson(obj.toJson());
  }
}
