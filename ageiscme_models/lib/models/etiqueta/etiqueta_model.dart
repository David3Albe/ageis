import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'etiqueta_model.freezed.dart';
part 'etiqueta_model.g.dart';

@unfreezed
abstract class EtiquetaModel with _$EtiquetaModel, DropDownText {
  const EtiquetaModel._();

  factory EtiquetaModel({
    required int? cod,
    required String? descricao,
    required int? limiteProcessos,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _EtiquetaModel;

  factory EtiquetaModel.fromJson(Map<String, Object?> json) =>
      _$EtiquetaModelFromJson(json);

  static EtiquetaModel copy(EtiquetaModel etiqueta) {
    return EtiquetaModel.fromJson(etiqueta.toJson());
  }

  factory EtiquetaModel.empty() => EtiquetaModel(
        cod: 0,
        descricao: '',
        limiteProcessos: null,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => descricao == null ? '' : descricao!;
}
