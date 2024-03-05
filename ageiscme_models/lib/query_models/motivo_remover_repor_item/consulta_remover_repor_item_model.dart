import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'consulta_remover_repor_item_model.g.dart';
part 'consulta_remover_repor_item_model.freezed.dart';

@unfreezed
sealed class ConsultaRemoverReporItemModel
    with _$ConsultaRemoverReporItemModel {
  const ConsultaRemoverReporItemModel._();

  factory ConsultaRemoverReporItemModel({
    required DateTime? dataHora,
    required KitModel? kit,
    required ItemModel? item,
    required UsuarioModel? usuario,
    required UsuarioModel? autorizadoPor,
    required MotivoRemoverReporItemModel motivoReporRemoverItem,
    required String? tipo,
  }) = _ConsultaRemoverReporItemModel;

  factory ConsultaRemoverReporItemModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaRemoverReporItemModelFromJson(json);

  static ConsultaRemoverReporItemModel copy(
      ConsultaRemoverReporItemModel obj) {
    return ConsultaRemoverReporItemModel.fromJson(obj.toJson());
  }
}
