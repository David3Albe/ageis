import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'perfil_direito_model.freezed.dart';
part 'perfil_direito_model.g.dart';

@unfreezed
abstract class PerfilDireitoModel with _$PerfilDireitoModel {
  factory PerfilDireitoModel({
    required int? cod,
    required int? codDireito,
    required int? codPerfil,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    required String? tstamp,
    required PerfilAcessoModel? perfilAcesso,
    required UsuarioPerfilModel? usuarioPerfil,
  }) = _PerfilDireitoModel;

  factory PerfilDireitoModel.fromJson(Map<String, Object?> json) =>
      _$PerfilDireitoModelFromJson(json);

  factory PerfilDireitoModel.empty() => PerfilDireitoModel(
        cod: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        codDireito: 0,
        codPerfil: 0,
        perfilAcesso: null,
        usuarioPerfil: null,
      );
}
