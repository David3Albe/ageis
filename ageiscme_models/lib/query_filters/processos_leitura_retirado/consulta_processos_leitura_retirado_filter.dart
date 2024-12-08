import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_retirado_filter.g.dart';
part 'consulta_processos_leitura_retirado_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraRetiradoFilter
    with _$ConsultaProcessosLeituraRetiradoFilter {
  const ConsultaProcessosLeituraRetiradoFilter._();

  factory ConsultaProcessosLeituraRetiradoFilter({
    DateTime? startDate,
    DateTime? startTime,
    DateTime? finalDate,
    DateTime? finalTime,
    int? codItem,
    String? idEtiquetaContem,
    int? codKit,
    String? codBarraKitContem,
    int? codLocal,
    bool? rotulado,
    ItemModel? item,
  }) = _ConsultaProcessosLeituraRetiradoFilter;

  factory ConsultaProcessosLeituraRetiradoFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraRetiradoFilterFromJson(json);

  static ConsultaProcessosLeituraRetiradoFilter copy(
      ConsultaProcessosLeituraRetiradoFilter obj) {
    return ConsultaProcessosLeituraRetiradoFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraRetiradoFilter.empty() =>
      ConsultaProcessosLeituraRetiradoFilter(
        codItem: null,
        codKit: null,
        codLocal: null,
        rotulado: null,
        finalDate: null,
        startDate: null,
        codBarraKitContem: null,
        idEtiquetaContem: null,
      );
}
