import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/models/processo_registro/processo_registro_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_consignado_model.freezed.dart';
part 'item_consignado_model.g.dart';

@unfreezed
sealed class ItemConsignadoModel with _$ItemConsignadoModel {
  factory ItemConsignadoModel({
    int? cod,
    int? codItem,
    String? descricao,
    int? quantidade,
    int? conferenciaCadastro,
    int? conferenciaRecepcao,
    int? codRegistroProcessoRecepcao,
    int? conferenciaPreparo,
    int? codRegistroProcessoPreparo,
    int? conferenciaExpurgo,
    int? codRegistroProcessoExpurgo,
    int? codInsituicao,
    DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') String? TStamp,
    ItemModel? item,
    ProcessoRegistroModel? processoRegistro,
  }) = _ItemConsignadoModel;

  factory ItemConsignadoModel.fromJson(Map<String, Object?> json) =>
      _$ItemConsignadoModelFromJson(json);
}
