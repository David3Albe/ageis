import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_consignado_filter.g.dart';
part 'consulta_processos_consignado_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosConsignadoFilter
    with _$ConsultaProcessosConsignadoFilter {
  const ConsultaProcessosConsignadoFilter._();

  factory ConsultaProcessosConsignadoFilter({
    DateTime? startDate,
    DateTime? startTime,
    DateTime? finalDate,
    DateTime? finalTime,
    int? codItemDescritor,
    int? codItemConsignado,
    String? idEtiquetaContem,
    int? codProprietario,
    bool? consignado,
    ItemDescritorDropDownSearchResponseDTO? itemDescritor,
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
        idEtiquetaContem: null,
      );
}
