import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_kit_inventario_model.g.dart';
part 'consulta_kit_inventario_model.freezed.dart';

@unfreezed
sealed class ConsultaKitInventarioModel with _$ConsultaKitInventarioModel {
  const ConsultaKitInventarioModel._();

  factory ConsultaKitInventarioModel({
    required int? codDescritorKit,
    required int? qtdeKits,
    required int? qtdeItensPadrao,
    required int? qtdeItensFisico,
    required KitDescritorModel? kitDescritor,
  }) = _ConsultaKitInventarioModel;

  factory ConsultaKitInventarioModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaKitInventarioModelFromJson(json);

  static ConsultaKitInventarioModel copy(ConsultaKitInventarioModel obj) {
    return ConsultaKitInventarioModel.fromJson(obj.toJson());
  }
}
