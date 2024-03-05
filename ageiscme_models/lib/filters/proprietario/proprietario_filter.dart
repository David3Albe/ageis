import 'package:freezed_annotation/freezed_annotation.dart';

part 'proprietario_filter.freezed.dart';
part 'proprietario_filter.g.dart';

@unfreezed
sealed class ProprietarioFilter with _$ProprietarioFilter {
  factory ProprietarioFilter({
    int? cod,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
    String? comecaCom,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _ProprietarioFilter;

  factory ProprietarioFilter.fromJson(Map<String, Object?> json) =>
      _$ProprietarioFilterFromJson(json);

  static ProprietarioFilter copy(ProprietarioFilter filter) {
    return ProprietarioFilter.fromJson(filter.toJson());
  }
}
