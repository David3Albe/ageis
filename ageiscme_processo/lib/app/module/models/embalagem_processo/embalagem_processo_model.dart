import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'embalagem_processo_model.freezed.dart';
part 'embalagem_processo_model.g.dart';

@unfreezed
abstract class EmbalagemProcessoModel with _$EmbalagemProcessoModel {
  const EmbalagemProcessoModel._();
  factory EmbalagemProcessoModel({
    bool? utilizaEmbalagemGeral,
    bool? solicitouUtilizaEmbalagemGeral,
    bool? solicitouUtilizaEmbalagemGeralSegundaVez,
    int? codKit,
    int? codItem,
    int? codItemZ,
    EmbalagemModel? embalagem,
  }) = _EmbalagemProcessoModel;

  factory EmbalagemProcessoModel.fromJson(Map<String, Object?> json) =>
      _$EmbalagemProcessoModelFromJson(json);
}
