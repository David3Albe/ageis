import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_documento_filter.g.dart';
part 'consulta_documento_filter.freezed.dart';

@unfreezed
sealed class ConsultaDocumentoFilter with _$ConsultaDocumentoFilter {
  const ConsultaDocumentoFilter._();

  factory ConsultaDocumentoFilter({
    required int? codTipo,
    required String? descricao,
    required bool? validade,
  }) = _ConsultaDocumentoFilter;

  factory ConsultaDocumentoFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaDocumentoFilterFromJson(json);

  static ConsultaDocumentoFilter copy(ConsultaDocumentoFilter obj) {
    return ConsultaDocumentoFilter.fromJson(obj.toJson());
  }

  factory ConsultaDocumentoFilter.empty() => ConsultaDocumentoFilter(
        codTipo: null,
        descricao: null,
        validade: null,
      );
}
