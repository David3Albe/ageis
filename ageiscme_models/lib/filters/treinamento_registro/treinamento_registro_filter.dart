import 'package:freezed_annotation/freezed_annotation.dart';

part 'treinamento_registro_filter.freezed.dart';
part 'treinamento_registro_filter.g.dart';

@unfreezed
sealed class TreinamentoRegistroFilter with _$TreinamentoRegistroFilter {
  factory TreinamentoRegistroFilter({
    int? cod,
    bool? carregarUsuario,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _TreinamentoRegistroFilter;

  factory TreinamentoRegistroFilter.fromJson(Map<String, Object?> json) =>
      _$TreinamentoRegistroFilterFromJson(json);

  static TreinamentoRegistroFilter copy(TreinamentoRegistroFilter filter) {
    return TreinamentoRegistroFilter.fromJson(filter.toJson());
  }
}
