import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_descritor_filter.freezed.dart';
part 'kit_descritor_filter.g.dart';

@unfreezed
sealed class KitDescritorFilter with _$KitDescritorFilter {
  factory KitDescritorFilter({
    int? cod,
    bool? apenasAtivos,
    bool? ordernarPorNomeCrescente,
    bool? carregarProcessoTipo,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _KitDescritorFilter;

  factory KitDescritorFilter.fromJson(Map<String, Object?> json) =>
      _$KitDescritorFilterFromJson(json);

  static KitDescritorFilter copy(KitDescritorFilter filter) {
    return KitDescritorFilter.fromJson(filter.toJson());
  }
}
