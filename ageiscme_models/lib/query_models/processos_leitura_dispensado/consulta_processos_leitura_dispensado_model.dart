import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_dispensado_model.g.dart';
part 'consulta_processos_leitura_dispensado_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDispensadoModel
    with _$ConsultaProcessosLeituraDispensadoModel {
  const ConsultaProcessosLeituraDispensadoModel._();

  factory ConsultaProcessosLeituraDispensadoModel({
    required DateTime? dataHora,
    required int? codKit,
    required int? nroItensFaltantes,
    required String? entradaSaida,
    required DateTime? dataValidade,
    required int? codRegistroProcesso,
    required String? kitDescritorNome,
    required String? idEtiqueta,
    required String? descricaoItem,
    required String? nomeEtapaProcesso,
    required String? nomeProcessoTipo,
    required String? nomeUsuario,
    required String? prontuarioRetirada,
    required String? origem,
    required String? destino,
    required String? circulante,
    required String? nomeGrupo,
    required String? tamanhoKit,
    required String? valorPesoKit,
    required String? tamanhoItem,
    required String? valorPesoItem,
    required String? proprietario,
  }) = _ConsultaProcessosLeituraDispensadoModel;

  factory ConsultaProcessosLeituraDispensadoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDispensadoModelFromJson(json);

  static ConsultaProcessosLeituraDispensadoModel copy(
      ConsultaProcessosLeituraDispensadoModel obj) {
    return ConsultaProcessosLeituraDispensadoModel.fromJson(obj.toJson());
  }
}
