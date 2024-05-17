import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_dispensado_filter.g.dart';
part 'consulta_processos_leitura_dispensado_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDispensadoFilter
    with _$ConsultaProcessosLeituraDispensadoFilter {
  const ConsultaProcessosLeituraDispensadoFilter._();

  factory ConsultaProcessosLeituraDispensadoFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codItem,
    required String? idEtiquetaContem,
    required int? codKit,
    required String? codBarraKitContem,
    required int? codLocal,
    ItemModel? item,
  }) = _ConsultaProcessosLeituraDispensadoFilter;

  factory ConsultaProcessosLeituraDispensadoFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDispensadoFilterFromJson(json);

  static ConsultaProcessosLeituraDispensadoFilter copy(
      ConsultaProcessosLeituraDispensadoFilter obj) {
    return ConsultaProcessosLeituraDispensadoFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraDispensadoFilter.empty() =>
      ConsultaProcessosLeituraDispensadoFilter(
        codItem: null,
        codKit: null,
        codLocal: null,
        finalDate: null,
        startDate: null,
        codBarraKitContem: null,
        idEtiquetaContem: null,
      );
}
