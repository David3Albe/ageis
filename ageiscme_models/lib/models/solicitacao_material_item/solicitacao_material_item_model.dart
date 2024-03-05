import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_item_model.freezed.dart';
part 'solicitacao_material_item_model.g.dart';

@unfreezed
abstract class SolicitacaoMaterialItemModel
    with _$SolicitacaoMaterialItemModel {
  const SolicitacaoMaterialItemModel._();
  factory SolicitacaoMaterialItemModel({
    required int? cod,
    required int? codInsumoSolicitacao,
    required int? codEquipamento,
    required int? codInsumo,
    required double? quantidadeSolicitada,
    required double? quantidadeEntregue,
    required String? nomeEquipamento,
    required String? nomeInsumo,
    required String? unidadeMedida,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required SolicitacaoMaterialModel? solicitacaoMaterial,
  }) = _SolicitacaoMaterialItemModel;

  factory SolicitacaoMaterialItemModel.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialItemModelFromJson(json);

  static SolicitacaoMaterialItemModel copy(
      SolicitacaoMaterialItemModel solicitacaoMaterialItem) {
    return SolicitacaoMaterialItemModel.fromJson(
        solicitacaoMaterialItem.toJson());
  }

  factory SolicitacaoMaterialItemModel.empty() => SolicitacaoMaterialItemModel(
        cod: 0,
        codEquipamento: null,
        codInsumo: null,
        codInsumoSolicitacao: 0,
        quantidadeEntregue: null,
        quantidadeSolicitada: 0,
        solicitacaoMaterial: null,
        tstamp: '',
        nomeEquipamento: null,
        unidadeMedida: null,
        nomeInsumo: null,
      );
}
