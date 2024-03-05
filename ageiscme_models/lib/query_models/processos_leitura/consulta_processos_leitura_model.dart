import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_model.g.dart';
part 'consulta_processos_leitura_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraModel
    with _$ConsultaProcessosLeituraModel {
  const ConsultaProcessosLeituraModel._();

  factory ConsultaProcessosLeituraModel({
    required DateTime? dataHora,
    required String? codBarraKit,
    required String? nomeKit,
    required int? nroItensFaltante,
    required String? idEtiqueta,
    required String? descricaoItem,
    required String? nomeProprietario,
    required String? entradaSaida,
    required String? nomeEquipamento,
    required String? nomeEtapaProcesso,
    required String? nomeTipoProcesso,
    required String? prioridade,
    required int? qtdeProcessos,
    required String? nomeUsuario,
    required String? prontuarioRetirada,
    required String? origem,
    required String? destino,
    required String? circulante,
    required String? conferidoVisualmente,
    required String? nomeRespKitIncomp,
    required String? nomeRespQuebFluxo,
    required String? nomeRepDestinoNaoCompativel,
    required String? indicador,
    required String? biologico,
    required String? implantavel,
    required String? lote,
    required String? integradorKit,
    required String? embalagem,
    required int? codItem,
    required int? codKit2,
    required int? codEtapaProcesso,
    required int? codLeitura,
    required String? motivo,
    required String? motivoQuebraFluxo,
    required String? observacao,
    required int? statusKit,
    required String? restricaoKit,
    required String? kitLiberadoIncompleto,
    required int? codRegistroProcesso,
  }) = _ConsultaProcessosLeituraModel;

  factory ConsultaProcessosLeituraModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraModelFromJson(json);

  static ConsultaProcessosLeituraModel copy(ConsultaProcessosLeituraModel obj) {
    return ConsultaProcessosLeituraModel.fromJson(obj.toJson());
  }
}
