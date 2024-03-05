import 'package:freezed_annotation/freezed_annotation.dart';

part 'direito_filter.freezed.dart';
part 'direito_filter.g.dart';

@unfreezed
sealed class DireitoFilter with _$DireitoFilter {
  factory DireitoFilter({
    int? cod,
    bool? ordenarPorNomeCrescente,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _DireitoFilter;

  factory DireitoFilter.fromJson(Map<String, Object?> json) =>
      _$DireitoFilterFromJson(json);

  static DireitoFilter copy(DireitoFilter filter) {
    return DireitoFilter.fromJson(filter.toJson());
  }
}
