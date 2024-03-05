import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_acao_ocorrencia_filter.g.dart';
part 'consulta_processos_leitura_acao_ocorrencia_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraAcaoOcorrenciaFilter
    with _$ConsultaProcessosLeituraAcaoOcorrenciaFilter {
  const ConsultaProcessosLeituraAcaoOcorrenciaFilter._();

  factory ConsultaProcessosLeituraAcaoOcorrenciaFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codKit,
    required int? codItem,
    required int? codUsuarioAcao,
    required int? codUsuarioAutorizacao,
    required int? codAcaoOcorrencia,
    ItemModel? item,
  }) = _ConsultaProcessosLeituraAcaoOcorrenciaFilter;

  factory ConsultaProcessosLeituraAcaoOcorrenciaFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraAcaoOcorrenciaFilterFromJson(json);

  static ConsultaProcessosLeituraAcaoOcorrenciaFilter copy(
      ConsultaProcessosLeituraAcaoOcorrenciaFilter obj) {
    return ConsultaProcessosLeituraAcaoOcorrenciaFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraAcaoOcorrenciaFilter.empty() =>
      ConsultaProcessosLeituraAcaoOcorrenciaFilter(
        codKit: null,
        codItem: null,
        codUsuarioAutorizacao: null,
        codUsuarioAcao: null,
        finalDate: null,
        startDate: null,
        codAcaoOcorrencia: null,
      );
}
