import 'package:ageiscme_models/models/perfil_direito/perfil_direito_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'perfil_acesso_model.freezed.dart';
part 'perfil_acesso_model.g.dart';

@unfreezed
abstract class PerfilAcessoModel with _$PerfilAcessoModel {
  factory PerfilAcessoModel({
    required int? cod,
    required String? descricao,
    required int? codInstituicao,
    required bool? ativo,
    required bool? perfilRestrito,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required List<PerfilDireitoModel>? perfilDireitos,
  }) = _PerfilAcessoModel;

  factory PerfilAcessoModel.fromJson(Map<String, Object?> json) =>
      _$PerfilAcessoModelFromJson(json);

  static PerfilAcessoModel copy(PerfilAcessoModel perfilAcesso) {
    return PerfilAcessoModel.fromJson(perfilAcesso.toJson());
  }

  factory PerfilAcessoModel.empty() => PerfilAcessoModel(
        cod: 0,
        descricao: '',
        codInstituicao: 0,
        ativo: true,
        perfilRestrito: false,
        ultimaAlteracao: null,
        tstamp: '',
        perfilDireitos: [],
      );
}
