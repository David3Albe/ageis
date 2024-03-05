import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_cor_filter.freezed.dart';
part 'kit_cor_filter.g.dart';

@unfreezed
sealed class KitCorFilter with _$KitCorFilter {
  factory KitCorFilter({
    int? cod,
    bool? apenasAtivos,
    bool? ordernarPorNomeCrescente,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _KitCorFilter;

  factory KitCorFilter.fromJson(Map<String, Object?> json) =>
      _$KitCorFilterFromJson(json);

  static KitCorFilter copy(KitCorFilter filter) {
    return KitCorFilter.fromJson(filter.toJson());
  }
}
