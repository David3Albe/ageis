import 'package:freezed_annotation/freezed_annotation.dart';

part 'processo_leitura_filter.freezed.dart';
part 'processo_leitura_filter.g.dart';

@unfreezed
sealed class ProcessoLeituraFilter with _$ProcessoLeituraFilter {
  factory ProcessoLeituraFilter({
    required int? codItem,
  }) = _ProcessoLeituraFilter;

  factory ProcessoLeituraFilter.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraFilterFromJson(json);

  static ProcessoLeituraFilter copy(ProcessoLeituraFilter filter) {
    return ProcessoLeituraFilter.fromJson(filter.toJson());
  }
}
