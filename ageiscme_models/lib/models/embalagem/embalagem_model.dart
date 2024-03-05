import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'embalagem_model.g.dart';
part 'embalagem_model.freezed.dart';

@unfreezed
abstract class EmbalagemModel with _$EmbalagemModel, DropDownText {
  const EmbalagemModel._();

  factory EmbalagemModel({
    required int? cod,
    required String? nome,
    required int? validadeProcessosDias,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _EmbalagemModel;

  factory EmbalagemModel.fromJson(Map<String, Object?> json) =>
      _$EmbalagemModelFromJson(json);

  static EmbalagemModel copy(EmbalagemModel embalagem) {
    return EmbalagemModel.fromJson(embalagem.toJson());
  }

  factory EmbalagemModel.empty() => EmbalagemModel(
        cod: 0,
        nome: '',
        validadeProcessosDias: null,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;
}
