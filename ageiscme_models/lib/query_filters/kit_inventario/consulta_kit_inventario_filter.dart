import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_kit_inventario_filter.g.dart';
part 'consulta_kit_inventario_filter.freezed.dart';

@unfreezed
sealed class ConsultaKitInventarioFilter with _$ConsultaKitInventarioFilter {
  const ConsultaKitInventarioFilter._();

  factory ConsultaKitInventarioFilter({
    required int? codKitDescritor,
    required String? codSituacao,
  }) = _ConsultaKitInventarioFilter;

  factory ConsultaKitInventarioFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaKitInventarioFilterFromJson(json);

  static ConsultaKitInventarioFilter copy(ConsultaKitInventarioFilter obj) {
    return ConsultaKitInventarioFilter.fromJson(obj.toJson());
  }

  factory ConsultaKitInventarioFilter.empty() => ConsultaKitInventarioFilter(
        codKitDescritor: null,
        codSituacao: null,
      );
}
