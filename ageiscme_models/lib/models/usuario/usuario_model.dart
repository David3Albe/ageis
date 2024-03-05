import 'package:ageiscme_models/models/usuario/usuario_mixin.dart';
import 'package:ageiscme_models/models/usuario_perfil/usuario_perfil_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'usuario_model.freezed.dart';
part 'usuario_model.g.dart';

@unfreezed
abstract class UsuarioModel
    with _$UsuarioModel, DropDownText, DropDownFilterMixin<UsuarioModel>,UsuarioMixin {
  const UsuarioModel._();

  factory UsuarioModel({
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
  }) = _UsuarioModel;

  factory UsuarioModel.fromJson(Map<String, Object?> json) =>
      _$UsuarioModelFromJson(json);

  static UsuarioModel copy(UsuarioModel usuario) {
    return UsuarioModel.fromJson(usuario.toJson());
  }

  factory UsuarioModel.empty() => UsuarioModel(
        cod: 0,
        login: '',
        nome: '',
        rg: 0,
        docClasse: '',
        codBarra: 0,
        codBarraTemporario: 0,
        senha: '',
        colaborador: false,
        nomeEmpresa: '',
        controleGestao: false,
        codInstituicao: 0,
        ativo: true,
        foto: '',
        ultimaAlteracao: null,
        tstamp: '',
        usuariosPerfis: [],
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<UsuarioModel>> GetDropDownFilters(String filter) => [
        DropDownFilterModel(
          (object) =>
              object.codBarra != null && object.codBarra.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null || object.nome!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String CodBarraNomeText() =>
      '($codBarra) ${nome == null ? '' : nome!}';
}
