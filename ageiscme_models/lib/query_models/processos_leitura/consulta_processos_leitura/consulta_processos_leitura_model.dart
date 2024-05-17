import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_model.g.dart';
part 'consulta_processos_leitura_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraModel
    with _$ConsultaProcessosLeituraModel {
  const ConsultaProcessosLeituraModel._();

  factory ConsultaProcessosLeituraModel({
        DateTime? dataHora,
        DateTime? data,
        String? hora,
        int? nroItensFaltante,
        int? codProprietario,
        String? entradaSaida,
        String? codPrioridade,
        int? codUsuario,
        String? prontuarioRetirada,
        int? codLocalOrigem,
        int? codLocalDestino,
        int? codCirculante,
        String? conferidoVisualmente,
        int? codRespKitIncomp,
        int? codRespQuebFluxo,
        int? codRespDestinoNaoCompativel,
        String? indicador,
        String? biologico,
        String? implantavel,
        String? integradorKit,
        int? codEmbalagem,
        int? codItem,
        int? codKit,
        int? codEtapaProcesso,
        int? codLeitura,
        int? codMotivo,
        int? codMotivoQuebraFluxo,
        int? statusKit,
        String? observacao,
        String? kitLiberadoIncompleto,
        int? lote,
        int? codRegistroProcesso,
        DateTime? dataHoraInicio,
        bool? cancelada,
  }) = _ConsultaProcessosLeituraModel;

  factory ConsultaProcessosLeituraModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraModelFromJson(json);

  static ConsultaProcessosLeituraModel copy(
      ConsultaProcessosLeituraModel obj) {
    return ConsultaProcessosLeituraModel.fromJson(obj.toJson());
  }
}
