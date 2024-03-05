import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_consignado_filter.g.dart';
part 'consulta_processos_consignado_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosConsignadoFilter
    with _$ConsultaProcessosConsignadoFilter {
  const ConsultaProcessosConsignadoFilter._();

  factory ConsultaProcessosConsignadoFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codItemDescritor,
    required int? codItemConsignado,
    required int? codProprietario,
    required bool? consignado,
    ItemModel? item,
  }) = _ConsultaProcessosConsignadoFilter;

  factory ConsultaProcessosConsignadoFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosConsignadoFilterFromJson(json);

  static ConsultaProcessosConsignadoFilter copy(
      ConsultaProcessosConsignadoFilter obj) {
    return ConsultaProcessosConsignadoFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosConsignadoFilter.empty() =>
      ConsultaProcessosConsignadoFilter(
        finalDate: null,
        startDate: null,
        codItemConsignado: null,
        codItemDescritor: null,
        codProprietario: null,
        consignado: null,
      );
}
