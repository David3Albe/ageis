import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'documento_model.freezed.dart';
part 'documento_model.g.dart';

@unfreezed
abstract class DocumentoModel with _$DocumentoModel {
  const DocumentoModel._();

  factory DocumentoModel({
    required int? cod,
    required String? descricao,
    required String? observacao,
    required String? usuario,
    required String? documento,
    required String? nomeDocumento,
    required int? codTipo,
    required DateTime? validade,
    required bool? controlarValidade,
    required DateTime? ultimaAlteracao,
    required TipoDocumentoModel? tipoDocumento,
  }) = _DocumentoModel;

  factory DocumentoModel.fromJson(Map<String, Object?> json) =>
      _$DocumentoModelFromJson(json);

  static DocumentoModel copy(DocumentoModel documento) =>
      DocumentoModel.fromJson(documento.toJson());

  factory DocumentoModel.empty() => DocumentoModel(
        cod: 0,
        descricao: '',
        observacao: '',
        usuario: '',
        documento: '',
        nomeDocumento: null,
        codTipo: 0,
        validade: DateTime.now(),
        controlarValidade: false,
        ultimaAlteracao: null,
        tipoDocumento: null,
      );
}
