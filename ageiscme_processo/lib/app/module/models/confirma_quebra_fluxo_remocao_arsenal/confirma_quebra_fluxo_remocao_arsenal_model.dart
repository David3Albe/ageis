import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'confirma_quebra_fluxo_remocao_arsenal_model.freezed.dart';
part 'confirma_quebra_fluxo_remocao_arsenal_model.g.dart';

@unfreezed
abstract class ConfirmaQuebraFluxoRemocaoArsenalModel with _$ConfirmaQuebraFluxoRemocaoArsenalModel {
  const ConfirmaQuebraFluxoRemocaoArsenalModel._();
  factory ConfirmaQuebraFluxoRemocaoArsenalModel({
    bool? solicitouConfirmacao,
    bool? prosseguirQuebraFluxo,
  }) = _ConfirmaQuebraFluxoRemocaoArsenalModel;

  factory ConfirmaQuebraFluxoRemocaoArsenalModel.fromJson(Map<String, Object?> json) =>
      _$ConfirmaQuebraFluxoRemocaoArsenalModelFromJson(json);
}
