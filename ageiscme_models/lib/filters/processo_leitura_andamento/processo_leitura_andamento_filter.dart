import 'package:freezed_annotation/freezed_annotation.dart';

part 'processo_leitura_andamento_filter.freezed.dart';
part 'processo_leitura_andamento_filter.g.dart';

@unfreezed
sealed class ProcessoLeituraAndamentoFilter with _$ProcessoLeituraAndamentoFilter {
  factory ProcessoLeituraAndamentoFilter({
    int? cod,
    int? codDiferenteDe,
    int? codUsuario,
    int? codUsuarioDiferenteDe,
    DateTime? dataHoraDiferenteDe,
    bool? carregarUsuario,
  }) = _ProcessoLeituraAndamentoFilter;

  factory ProcessoLeituraAndamentoFilter.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraAndamentoFilterFromJson(json);
}
