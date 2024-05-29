import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processo_resposta_epcepi_filter.g.dart';
part 'consulta_processo_resposta_epcepi_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessoRespostaEPCEPIFilter
    with _$ConsultaProcessoRespostaEPCEPIFilter {
  const ConsultaProcessoRespostaEPCEPIFilter._();

  factory ConsultaProcessoRespostaEPCEPIFilter({
    DateTime? startDate,
    DateTime? finalDate,
    int? codUsuario,
    int? codEquipamento,
    bool? respostaSim,
    bool? respostaNao,
    bool? entrada,
    bool? saida,
    DateTime? startTime,
    DateTime? finalTime,
    UsuarioDropDownSearchResponseDTO? usuario,
  }) = _ConsultaProcessoRespostaEPCEPIFilter;

  factory ConsultaProcessoRespostaEPCEPIFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessoRespostaEPCEPIFilterFromJson(json);

  static ConsultaProcessoRespostaEPCEPIFilter copy(
      ConsultaProcessoRespostaEPCEPIFilter obj) {
    return ConsultaProcessoRespostaEPCEPIFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessoRespostaEPCEPIFilter.empty() =>
      ConsultaProcessoRespostaEPCEPIFilter(
        respostaNao: true,
        respostaSim: null,
        codEquipamento: null,
        codUsuario: null,
        finalDate: null,
        startDate: null,
        entrada: null,
        saida: null,
      );
}
