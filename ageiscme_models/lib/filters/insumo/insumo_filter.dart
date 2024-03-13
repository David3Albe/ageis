import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_filter.g.dart';
part 'insumo_filter.freezed.dart';

@unfreezed
sealed class InsumoFilter with _$InsumoFilter {
  factory InsumoFilter({
    List<int>? codigos,
    bool? apenasAtivos,
    bool? ordenarPorNomeAsc,
  }) = _InsumoFilter;

  factory InsumoFilter.fromJson(Map<String, Object?> json) =>
      _$InsumoFilterFromJson(json);

  static InsumoFilter copy(InsumoFilter obj) {
    return InsumoFilter.fromJson(obj.toJson());
  }
}
