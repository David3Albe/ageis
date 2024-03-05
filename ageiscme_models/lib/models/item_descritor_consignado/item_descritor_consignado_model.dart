import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_descritor_consignado_model.freezed.dart';
part 'item_descritor_consignado_model.g.dart';

@unfreezed
abstract class ItemDescritorConsignadoModel
    with _$ItemDescritorConsignadoModel {
  const ItemDescritorConsignadoModel._();

  factory ItemDescritorConsignadoModel({
    required int? cod,
    required int? codItemDescritor,
    required String? descricao,
    required int? quantidade,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ItemDescritorConsignadoModel;

  factory ItemDescritorConsignadoModel.fromJson(Map<String, Object?> json) =>
      _$ItemDescritorConsignadoModelFromJson(json);

  factory ItemDescritorConsignadoModel.empty() => ItemDescritorConsignadoModel(
        cod: 0,
        codInstituicao: 0,
        codItemDescritor: 0,
        descricao: null,
        quantidade: 0,
        tstamp: null,
        ultimaAlteracao: null,
      );
}
