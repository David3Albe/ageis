import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_descritor_filter.freezed.dart';
part 'epi_descritor_filter.g.dart';

@unfreezed
sealed class EpiDescritorFilter
    with _$EpiDescritorFilter {
  factory EpiDescritorFilter({
    int? cod,
    bool? carregarTipo,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _EpiDescritorFilter;

  factory EpiDescritorFilter.fromJson(Map<String, Object?> json) =>
      _$EpiDescritorFilterFromJson(json);

  static EpiDescritorFilter copy(
      EpiDescritorFilter filter) {
    return EpiDescritorFilter.fromJson(filter.toJson());
  }
}
