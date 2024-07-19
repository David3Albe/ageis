import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'localizacao_estoque_model.freezed.dart';
part 'localizacao_estoque_model.g.dart';

@unfreezed
abstract class LocalizacaoEstoqueModel with _$LocalizacaoEstoqueModel {
  const LocalizacaoEstoqueModel._();
  factory LocalizacaoEstoqueModel({
        int? codLocalizacaoItem,
        int? codItem,
        bool? utilizarLocalizacaoItens,
        int? codLocalizacaoKit,
        int? codKit,
        bool? utilizarLocalizacaoKits,
  }) = _LocalizacaoEstoqueModel;

  factory LocalizacaoEstoqueModel.fromJson(Map<String, Object?> json) =>
      _$LocalizacaoEstoqueModelFromJson(json);
}
