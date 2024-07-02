import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_entrada_automatica_model.g.dart';
part 'consulta_processos_leitura_entrada_automatica_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraEntradaAutomaticaModel
    with
        _$ConsultaProcessosLeituraEntradaAutomaticaModel{
  const ConsultaProcessosLeituraEntradaAutomaticaModel._();

  factory ConsultaProcessosLeituraEntradaAutomaticaModel({
    required DateTime? dataHora,
    required int? codRegistroProcesso,
    required int? codEntradaAut,
    required String? situacao,
    required String? observacao,
    required String? codBarraKit,
    required String? nomeKit,
    required String? idEtiqueta,
    required String? descricaoItem,
    required String? nomeProprietario,
    required String? entradaSaida,
    required String? nomeEquipamento,
    required String? nomeEtapaProcesso,
    required String? nomeTipoProcesso,
    required String? nivelPrioridade,
    required String? nomeUsuario,
    required String? prontuario,
    required String? origem,
    required String? destino,
    required String? circulante,
    required String? confVisual,
    required String? nomeRespLibKitIncomp,
    required String? nomeRespLibQuebFluxo,
    required String? indicador,
    required String? lote,
    required String? embalagem,
    required int? codItem,
    required int? codKit2,
    required int? codEtapaProcesso,
    required int? codLeitura,
    required String? motivo,
    required String? motivoQuebraFluxo,
    required String? observacoes,
    required String? tstamp,
    required bool? cancelar,
    required int? codSituacao,
  }) = _ConsultaProcessosLeituraEntradaAutomaticaModel;

  factory ConsultaProcessosLeituraEntradaAutomaticaModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraEntradaAutomaticaModelFromJson(json);

  static ConsultaProcessosLeituraEntradaAutomaticaModel copy(
      ConsultaProcessosLeituraEntradaAutomaticaModel obj) {
    return ConsultaProcessosLeituraEntradaAutomaticaModel.fromJson(
        obj.toJson());
  }

  String get getStatusText => situacao == null
      ? ''
      : EntradaAutomaticaSituacaoOptions.getOpcaoFromId(situacao!);
}

class EntradaAutomaticaSituacaoOptions with DropDownText {
  final String text;
  final int cod;

  EntradaAutomaticaSituacaoOptions(this.text, this.cod);

  static final List<EntradaAutomaticaSituacaoOptions> situacaoOptions = [
    EntradaAutomaticaSituacaoOptions('Aberto', 0),
    EntradaAutomaticaSituacaoOptions('Finalizado', 1),
    EntradaAutomaticaSituacaoOptions('Cancelado', 2),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<EntradaAutomaticaSituacaoOptions>? situacao =
        situacaoOptions.where((element) => element.cod.toString() == opcao);

    if (situacao.isEmpty) {
      return '';
    } else {
      return situacao.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
