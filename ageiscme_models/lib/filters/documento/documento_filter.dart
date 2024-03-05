import 'package:freezed_annotation/freezed_annotation.dart';

part 'documento_filter.freezed.dart';
part 'documento_filter.g.dart';

@unfreezed
sealed class DocumentoFilter with _$DocumentoFilter {
  factory DocumentoFilter({
    int? cod,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _DocumentoFilter;

  factory DocumentoFilter.fromJson(Map<String, Object?> json) =>
      _$DocumentoFilterFromJson(json);

  static DocumentoFilter copy(DocumentoFilter filter) {
    return DocumentoFilter.fromJson(filter.toJson());
  }
}
