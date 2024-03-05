import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_filter.freezed.dart';
part 'kit_filter.g.dart';

@unfreezed
sealed class KitFilter with _$KitFilter {
  factory KitFilter({
    int? cod,
    String? codBarra,
    bool? carregarDescritor,
    bool? carregarKit,
    bool? carregarCores,
    bool? carregarItens,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _KitFilter;

  factory KitFilter.fromJson(Map<String, Object?> json) =>
      _$KitFilterFromJson(json);

  static KitFilter copy(KitFilter filter) {
    return KitFilter.fromJson(filter.toJson());
  }
}
