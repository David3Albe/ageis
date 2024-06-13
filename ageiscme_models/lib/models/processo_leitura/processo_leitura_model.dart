import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'processo_leitura_model.g.dart';
part 'processo_leitura_model.freezed.dart';

@unfreezed
sealed class ProcessoLeituraModel with _$ProcessoLeituraModel, DropDownText {
  const ProcessoLeituraModel._();

  factory ProcessoLeituraModel({
    required int? cod,
    required int? codRegistroProcesso,
    required int? codItem,
    required int? codKit,
    required String? entradaSaida,
    required int? codUsuario,
    required int? nroItensFaltantes,
    required bool? kitLiberadoIncompleto,
    required int? codUsuarioLiberacao,
    required bool? conferidoVisualmente,
    required DateTime? dataHora,
    required int? codUsuarioQuebraSeq,
    required int? codEmbalagem,
    required DateTime? dataValidade,
    required int? codEtapaProcesso,
    required int? codMotivo,
    required int? codMotivoQuebraFluxo,
    required int? codMotivoReporRemoverItem,
    required int? codAcaoOcorrencia,
    required int? entradaAutomatica,
    required String? loteEquipamento,
    required int? codUsuarioResponsavelLocal,
    required bool? integradorKit,
    required int? statusKit,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    ProcessoEtapaModel? processoEtapa,
  }) = _ProcessoLeituraModel;

  factory ProcessoLeituraModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraModelFromJson(json);

  static ProcessoLeituraModel copy(ProcessoLeituraModel conjunto) {
    return ProcessoLeituraModel.fromJson(conjunto.toJson());
  }

  factory ProcessoLeituraModel.empty() => ProcessoLeituraModel(
        cod: 0,
        codAcaoOcorrencia: 0,
        codEmbalagem: 0,
        codEtapaProcesso: 0,
        codItem: 0,
        codKit: 0,
        codMotivo: 0,
        codMotivoQuebraFluxo: 0,
        codMotivoReporRemoverItem: 0,
        codRegistroProcesso: 0,
        codUsuario: 0,
        codUsuarioLiberacao: 0,
        codUsuarioQuebraSeq: 0,
        codUsuarioResponsavelLocal: 0,
        conferidoVisualmente: false,
        dataHora: null,
        dataValidade: null,
        entradaAutomatica: 0,
        entradaSaida: '',
        integradorKit: false,
        kitLiberadoIncompleto: false,
        loteEquipamento: '',
        nroItensFaltantes: 0,
        statusKit: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => entradaSaida == null ? '' : entradaSaida!;
}
