import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calculadora_item_model.g.dart';
part 'calculadora_item_model.freezed.dart';

@unfreezed
sealed class CalculadoraItemModel with _$CalculadoraItemModel {
  const CalculadoraItemModel._();

  factory CalculadoraItemModel({
    required int? codEstoque,
    required String? saldo,
    required int? valorInformado,
    required bool? calculadoraJaDefinida,
  }) = _CalculadoraItemModel;

  factory CalculadoraItemModel.fromJson(Map<String, Object?> json) =>
      _$CalculadoraItemModelFromJson(json);
}
