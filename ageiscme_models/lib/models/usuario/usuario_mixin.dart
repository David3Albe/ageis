import 'dart:core';

import 'package:ageiscme_models/main.dart';

mixin UsuarioMixin {
  int? get cod;
  set cod(int? value);
  String? get login;
  set login(String? value);
  String? get nome;
  set nome(String? value);
  int? get rg;
  set rg(int? value);
  String? get docClasse;
  set docClasse(String? value);
  int? get codBarra;
  set codBarra(int? value);
  int? get codBarraTemporario;
  set codBarraTemporario(int? value);
  String? get senha;
  set senha(String? value);
  bool? get colaborador;
  set colaborador(bool? value);
  String? get nomeEmpresa;
  set nomeEmpresa(String? value);
  bool? get controleGestao;
  set controleGestao(bool? value);
  int? get codInstituicao;
  set codInstituicao(int? value);
  bool? get ativo;
  set ativo(bool? value);
  String? get foto;
  set foto(String? value);
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  String? get tstamp;
  set tstamp(String? value);
  List<UsuarioPerfilModel>? get usuariosPerfis;
  set usuariosPerfis(List<UsuarioPerfilModel>? value);
}
