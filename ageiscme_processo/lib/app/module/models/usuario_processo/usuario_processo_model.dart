import 'package:ageiscme_models/models/usuario/usuario_mixin.dart';
import 'package:ageiscme_models/models/usuario_perfil/usuario_perfil_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_processo_model.freezed.dart';
part 'usuario_processo_model.g.dart';

@unfreezed
abstract class UsuarioProcessoModel with _$UsuarioProcessoModel, UsuarioMixin {
  const UsuarioProcessoModel._();

  factory UsuarioProcessoModel({
    required int? cod,
    required String? login,
    required String? nome,
    required int? rg,
    required String? docClasse,
    required int? codBarra,
    required int? codBarraTemporario,
    required String? senha,
    required bool? colaborador,
    required String? nomeEmpresa,
    required bool? controleGestao,
    required int? codInstituicao,
    required bool? ativo,
    required String? foto,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required List<UsuarioPerfilModel>? usuariosPerfis,
    required List<int>? codigoDireitos,
  }) = _UsuarioProcessoModel;

  factory UsuarioProcessoModel.fromJson(Map<String, Object?> json) =>
      _$UsuarioProcessoModelFromJson(json);

  static UsuarioProcessoModel copy(UsuarioProcessoModel usuario) {
    return UsuarioProcessoModel.fromJson(usuario.toJson());
  }
}
