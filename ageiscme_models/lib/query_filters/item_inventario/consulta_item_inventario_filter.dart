import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_item_inventario_filter.g.dart';
part 'consulta_item_inventario_filter.freezed.dart';

@unfreezed
sealed class ConsultaItemInventarioFilter with _$ConsultaItemInventarioFilter {
  const ConsultaItemInventarioFilter._();

  factory ConsultaItemInventarioFilter({
    required int? codItemDescritor,
    required bool? repositorio,
    required bool? descartado,
    required bool? implantavel,
    required bool? complementar,
    required String? situacao,
    required int? codGrupoItem,
    required int? codProprietario,
    required double? cmInicio,
    required double? cmFinal,
  }) = _ConsultaItemInventarioFilter;

  factory ConsultaItemInventarioFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaItemInventarioFilterFromJson(json);

  static ConsultaItemInventarioFilter copy(ConsultaItemInventarioFilter obj) {
    return ConsultaItemInventarioFilter.fromJson(obj.toJson());
  }

  factory ConsultaItemInventarioFilter.empty() => ConsultaItemInventarioFilter(
        codItemDescritor: null,
        descartado: null,
        repositorio: null,
        complementar: null,
        implantavel: null,
        situacao: null,
        codGrupoItem: null,
        codProprietario: null,
        cmFinal: null,
        cmInicio: null,
      );
}
