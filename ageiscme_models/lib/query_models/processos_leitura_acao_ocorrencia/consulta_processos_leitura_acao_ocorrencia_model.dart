import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_acao_ocorrencia_model.g.dart';
part 'consulta_processos_leitura_acao_ocorrencia_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraAcaoOcorrenciaModel
    with _$ConsultaProcessosLeituraAcaoOcorrenciaModel {
  const ConsultaProcessosLeituraAcaoOcorrenciaModel._();
  factory ConsultaProcessosLeituraAcaoOcorrenciaModel({
    required DateTime? dataHora,
    required String? codBarraKit,
    required String? nomeKit,
    required String? idEtiqueta,
    required String? descricaoItem,
    required String? nomeProprietario,
    required String? entradaSaida,
    required String? nomeEquipamento,
    required String? nomeEtapaProcesso,
    required String? nomeTipoProcesso,
    required String? prioridade,
    required String? nomeUsuario,
    required String? nomeUsuarioLiberacao,
    required String? prontuario,
    required String? origem,
    required String? destino,
    required String? circulante,
    required String? confVisual,
    required String? nomeRespKitIncomp,
    required String? nomeRespQuebFluxo,
    required String? indicador,
    required String? lote,
    required String? embalagem,
    required int? codItem,
    required int? codKit,
    required int? codEtapaProcesso,
    required int? codLeitura,
    required String? motivo,
    required String? motivoQuebraFluxo,
    required String? acaoOcorrencia,
    required String? tipoAcaoOcorrencia,
    required String? observacao,
  }) = _ConsultaProcessosLeituraAcaoOcorrenciaModel;

  factory ConsultaProcessosLeituraAcaoOcorrenciaModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraAcaoOcorrenciaModelFromJson(json);

  static ConsultaProcessosLeituraAcaoOcorrenciaModel copy(
      ConsultaProcessosLeituraAcaoOcorrenciaModel obj) {
    return ConsultaProcessosLeituraAcaoOcorrenciaModel.fromJson(obj.toJson());
  }
}
