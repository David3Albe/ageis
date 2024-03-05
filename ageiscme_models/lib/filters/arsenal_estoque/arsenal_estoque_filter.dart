import 'package:freezed_annotation/freezed_annotation.dart';

part 'arsenal_estoque_filter.freezed.dart';
part 'arsenal_estoque_filter.g.dart';

@unfreezed
sealed class ArsenalEstoqueFilter with _$ArsenalEstoqueFilter {
  factory ArsenalEstoqueFilter({
    int? cod,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _ArsenalEstoqueFilter;

  factory ArsenalEstoqueFilter.fromJson(Map<String, Object?> json) =>
      _$ArsenalEstoqueFilterFromJson(json);

  static ArsenalEstoqueFilter copy(ArsenalEstoqueFilter filter) {
    return ArsenalEstoqueFilter.fromJson(filter.toJson());
  }
}
