import 'package:ageiscme_models/models/perfil_direito/perfil_direito_model.dart';
import 'package:ageiscme_models/models/usuario/usuario_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'usuario_perfil_model.freezed.dart';
part 'usuario_perfil_model.g.dart';

@unfreezed
abstract class UsuarioPerfilModel with _$UsuarioPerfilModel {
  factory UsuarioPerfilModel({
    required int? cod,
    required int? codUsuario,
    required int? codPerfil,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required UsuarioModel? usuario,
    required List<PerfilDireitoModel>? direitos,
  }) = _UsuarioPerfilModel;

  factory UsuarioPerfilModel.fromJson(Map<String, Object?> json) =>
      _$UsuarioPerfilModelFromJson(json);

  static UsuarioPerfilModel copy(UsuarioPerfilModel usuarioPerfil) {
    return UsuarioPerfilModel.fromJson(usuarioPerfil.toJson());
  }

  factory UsuarioPerfilModel.empty() => UsuarioPerfilModel(
        cod: 0,
        codUsuario: 0,
        codPerfil: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        direitos: [],
        usuario: null,
      );
}
