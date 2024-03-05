import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_documento_model.g.dart';
part 'consulta_documento_model.freezed.dart';

@unfreezed
sealed class ConsultaDocumentoModel with _$ConsultaDocumentoModel {
  const ConsultaDocumentoModel._();

  factory ConsultaDocumentoModel({
    required int? cod,
    required String? nome,
    required DateTime? validade,
    required String? tipoDocumento,
  }) = _ConsultaDocumentoModel;

  factory ConsultaDocumentoModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaDocumentoModelFromJson(json);

  static ConsultaDocumentoModel copy(ConsultaDocumentoModel obj) {
    return ConsultaDocumentoModel.fromJson(obj.toJson());
  }
}
