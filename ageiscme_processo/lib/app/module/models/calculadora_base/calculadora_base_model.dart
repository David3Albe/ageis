import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calculadora_base_model.g.dart';
part 'calculadora_base_model.freezed.dart';

@unfreezed
sealed class CalculadoraBaseModel with _$CalculadoraBaseModel {
  const CalculadoraBaseModel._();

  factory CalculadoraBaseModel({
    required bool? utilizarCalculadora,
  }) = _CalculadoraBaseModel;

  factory CalculadoraBaseModel.fromJson(Map<String, Object?> json) =>
      _$CalculadoraBaseModelFromJson(json);
}
