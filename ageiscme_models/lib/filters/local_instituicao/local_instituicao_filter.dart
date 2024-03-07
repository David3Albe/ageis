import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_instituicao_filter.freezed.dart';
part 'local_instituicao_filter.g.dart';

@unfreezed
sealed class LocalInstituicaoFilter with _$LocalInstituicaoFilter {
  factory LocalInstituicaoFilter({
    int? cod,
    int? codInstituicao,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _LocalInstituicaoFilter;

  factory LocalInstituicaoFilter.fromJson(Map<String, Object?> json) =>
      _$LocalInstituicaoFilterFromJson(json);

  static LocalInstituicaoFilter copy(LocalInstituicaoFilter filter) {
    return LocalInstituicaoFilter.fromJson(filter.toJson());
  }
}
