import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_entrada_automatica_filter.g.dart';
part 'consulta_processos_leitura_entrada_automatica_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraEntradaAutomaticaFilter
    with _$ConsultaProcessosLeituraEntradaAutomaticaFilter {
  const ConsultaProcessosLeituraEntradaAutomaticaFilter._();

  factory ConsultaProcessosLeituraEntradaAutomaticaFilter({
    DateTime? startDate,
    DateTime? startTime,
    DateTime? finalDate,
    DateTime? finalTime,
    int? codSituacao,
    int? codKit,
    String? codBarraKitContem,
    int? codItem,
    String? idEtiquetaContem,
    int? codEtapaProcesso,
    int? codRegistroProcesso,
    String? indicador,
    String? prontuarioRetirada,
    ItemModel? item,
  }) = _ConsultaProcessosLeituraEntradaAutomaticaFilter;

  factory ConsultaProcessosLeituraEntradaAutomaticaFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraEntradaAutomaticaFilterFromJson(json);

  static ConsultaProcessosLeituraEntradaAutomaticaFilter copy(
      ConsultaProcessosLeituraEntradaAutomaticaFilter obj) {
    return ConsultaProcessosLeituraEntradaAutomaticaFilter.fromJson(
        obj.toJson());
  }

  factory ConsultaProcessosLeituraEntradaAutomaticaFilter.empty() =>
      ConsultaProcessosLeituraEntradaAutomaticaFilter(
        codSituacao: 0,
        finalDate: null,
        startDate: null,
        codEtapaProcesso: null,
        codItem: null,
        codKit: null,
        codRegistroProcesso: null,
        indicador: null,
        prontuarioRetirada: null,
        codBarraKitContem: null,
        idEtiquetaContem: null,
      );
}
