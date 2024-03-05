import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_devolvido_sub_model.g.dart';
part 'consulta_processos_leitura_devolvido_sub_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDevolvidoSubModel
    with _$ConsultaProcessosLeituraDevolvidoSubModel {
  const ConsultaProcessosLeituraDevolvidoSubModel._();

  factory ConsultaProcessosLeituraDevolvidoSubModel({
    required int? codLocal,
    required String? nomeLocal,
    required DateTime? dataHora,
    required String? entradaSaida,
    required String? nomeEtapa,
    required int? codDescritorKit,
    required String? nomeKit,
    required int? codDescritorItem,
    required String? descricaoCurtaItem,
    required int? saida,
    required int? devolucao,
    required String? motivo,
    required String? motivoQuebraFluxo,
    required String? acaoOcorrencia,
    required String? motivoReporRemoverItem,
  }) = _ConsultaProcessosLeituraDevolvidoSubModel;

  factory ConsultaProcessosLeituraDevolvidoSubModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDevolvidoSubModelFromJson(json);

  static ConsultaProcessosLeituraDevolvidoSubModel copy(
      ConsultaProcessosLeituraDevolvidoSubModel obj) {
    return ConsultaProcessosLeituraDevolvidoSubModel.fromJson(obj.toJson());
  }
}
