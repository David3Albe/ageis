import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_model.freezed.dart';
part 'solicitacao_material_model.g.dart';

@unfreezed
abstract class SolicitacaoMaterialModel with _$SolicitacaoMaterialModel {
  const SolicitacaoMaterialModel._();
  factory SolicitacaoMaterialModel({
    required int? cod,
    required int? codUsuarioSolicitante,
    required int? codUsuarioAutorizacao,
    required int? codUsuarioEntrega,
    required int? codUsuarioRecebimento,
    required DateTime? dataHoraSolicitacao,
    required DateTime? dataHoraAutorizacao,
    required DateTime? dataHoraEntrega,
    required int? situacao,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required List<SolicitacaoMaterialItemModel>? solicitacoesMateriais,
  }) = _SolicitacaoMaterialModel;

  factory SolicitacaoMaterialModel.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialModelFromJson(json);

  static SolicitacaoMaterialModel copy(
      SolicitacaoMaterialModel solicitacaoMaterial) {
    return SolicitacaoMaterialModel.fromJson(solicitacaoMaterial.toJson());
  }

  factory SolicitacaoMaterialModel.empty() => SolicitacaoMaterialModel(
        cod: 0,
        codUsuarioEntrega: null,
        codUsuarioRecebimento: null,
        codUsuarioSolicitante: null,
        codUsuarioAutorizacao: null,
        dataHoraAutorizacao: null, 
        dataHoraEntrega: null,
        dataHoraSolicitacao: null,
        situacao: null,
        solicitacoesMateriais: [],
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
