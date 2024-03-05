import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'selecao_kit_item_model.freezed.dart';
part 'selecao_kit_item_model.g.dart';

@unfreezed
abstract class SelecaoKitItemModel with _$SelecaoKitItemModel {
  const SelecaoKitItemModel._();
  factory SelecaoKitItemModel({
    required int cod,
    required int tipoSelecao,
    required int? decisao,
    required String? mensagem,
  }) = _SelecaoKitItemModel;

  factory SelecaoKitItemModel.fromJson(Map<String, Object?> json) =>
      _$SelecaoKitItemModelFromJson(json);
}
