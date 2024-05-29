import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_acao_ocorrencia_filter.g.dart';
part 'consulta_processos_leitura_acao_ocorrencia_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraAcaoOcorrenciaFilter
    with _$ConsultaProcessosLeituraAcaoOcorrenciaFilter {
  const ConsultaProcessosLeituraAcaoOcorrenciaFilter._();

  factory ConsultaProcessosLeituraAcaoOcorrenciaFilter({
    DateTime? startDate,
    DateTime? startTime,
    DateTime? finalDate,
    DateTime? finalTime,
    int? codKit,
    String? codBarraKitContem,
    int? codItem,
    String? idEtiquetaContem,
    int? codUsuarioAcao,
    int? codUsuarioAutorizacao,
    int? codAcaoOcorrencia,
    ItemModel? item,
    UsuarioDropDownSearchResponseDTO? usuarioAcao,
    UsuarioDropDownSearchResponseDTO? usuarioAutorizacao,
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
        codBarraKitContem: null,
        idEtiquetaContem: null,
      );
}
