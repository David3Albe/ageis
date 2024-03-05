import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_consignado_base_model.g.dart';
part 'item_consignado_base_model.freezed.dart';

@unfreezed
sealed class ItemConsignadoBaseModel with _$ItemConsignadoBaseModel {
  const ItemConsignadoBaseModel._();

  factory ItemConsignadoBaseModel({
    required int tipoAcesso,
    @Default(false) bool preparo,
  }) = _ItemConsignadoBaseModel;

  factory ItemConsignadoBaseModel.fromJson(Map<String, Object?> json) =>
      _$ItemConsignadoBaseModelFromJson(json);
}
