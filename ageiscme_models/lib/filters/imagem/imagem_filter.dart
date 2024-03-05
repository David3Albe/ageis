import 'package:freezed_annotation/freezed_annotation.dart';

part 'imagem_filter.freezed.dart';
part 'imagem_filter.g.dart';

@unfreezed
sealed class ImagemFilter with _$ImagemFilter {
  factory ImagemFilter({
    int? cod,
    List<String>? identificadores,
    bool? apenasAtivas,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _ImagemFilter;

  factory ImagemFilter.fromJson(Map<String, Object?> json) =>
      _$ImagemFilterFromJson(json);

  static ImagemFilter copy(ImagemFilter filter) {
    return ImagemFilter.fromJson(filter.toJson());
  }
}
