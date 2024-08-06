import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_filter.g.dart';
part 'consulta_processos_leitura_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraFilter
    with _$ConsultaProcessosLeituraFilter {
  const ConsultaProcessosLeituraFilter._();

  factory ConsultaProcessosLeituraFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required DateTime? startTime,
    required DateTime? finalTime,
    required int? codKit,
    required int? codItem,
    required String? idEtiquetaContem,
    required int? codEtapaProcesso,
    required int? lote,
    required String? indicador,
    required String? biologico,
    required bool? implantavel,
    required String? prontuario,
    required String? codBarraKitContem,
    int? codDescritorKit,
    int? codDescritorItem,
    ItemModel? item,
    PlutoGridApiModel? gridModel,
  }) = _ConsultaProcessosLeituraFilter;

  factory ConsultaProcessosLeituraFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraFilterFromJson(json);

  static ConsultaProcessosLeituraFilter copy(
      ConsultaProcessosLeituraFilter obj) {
    return ConsultaProcessosLeituraFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraFilter.empty() =>
      ConsultaProcessosLeituraFilter(
        startDate: null,
        finalDate: null,
        codItem: null,
        codKit: null,
        finalTime: null,
        startTime: null,
        lote: null,
        codEtapaProcesso: null,
        implantavel: null,
        indicador: null,
        biologico: null,
        prontuario: null,
        idEtiquetaContem: null,
        codBarraKitContem: null,
      );
}
