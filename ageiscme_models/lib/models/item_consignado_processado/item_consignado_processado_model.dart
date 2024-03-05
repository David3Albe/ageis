import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_consignado_processado_model.g.dart';
part 'item_consignado_processado_model.freezed.dart';

@unfreezed
sealed class ItemConsignadoProcessadoModel
    with _$ItemConsignadoProcessadoModel {
  const ItemConsignadoProcessadoModel._();

  factory ItemConsignadoProcessadoModel({
    required int? codInstituicao,
    required int? codRegistro,
    required int? medico,
    required int? responsavelEntrega,
    required int? responsavelRetirada,
    required int? codUsuario,
    required DateTime? DataHora,
  }) = _ItemConsignadoProcessadoModel;

  factory ItemConsignadoProcessadoModel.fromJson(Map<String, Object?> json) =>
      _$ItemConsignadoProcessadoModelFromJson(json);

  static ItemConsignadoProcessadoModel copy(
      ItemConsignadoProcessadoModel itemConsignadoProcessado) {
    return ItemConsignadoProcessadoModel.fromJson(
        itemConsignadoProcessado.toJson());
  }

  factory ItemConsignadoProcessadoModel.empty() =>
      ItemConsignadoProcessadoModel(
        codInstituicao: 0,
        DataHora: null,
        codRegistro: null,
        codUsuario: null,
        medico: null,
        responsavelRetirada: null,
        responsavelEntrega: null,
      );
}
