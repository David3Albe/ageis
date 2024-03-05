import 'dart:core';

import 'package:ageiscme_models/main.dart';
import 'package:flutter/material.dart';

mixin KitMixin {
  set cod(int? value);
  int? get cod;
  String? get codBarra;
  set codBarra(String? value);
  int? get codCor1;
  set codCor1(int? codCor1);
  int? get codCor2;
  set codCor2(int? codCor2);
  int? get codCor3;
  set codCor3(int? codCor3);
  int? get codCor4;
  set codCor4(int? codCor4);
  String? get status;
  set status(String? status);
  String? get restricao;
  set restricao(String? restricao);
  int? get codDescritorKit;
  set codDescritorKit(int? codDescritorKit);
  int? get codConjunto;
  set codConjunto(int? codConjunto);
  int? get codInstituicao;
  set codInstituicao(int? codInstituicao);
  String? get preparo;
  set preparo(String? preparo);
  int? get codProcessoLeitura;
  set codProcessoLeitura(int? codProcessoLeitura);
  int? get codEmbalagem;
  set codEmbalagem(int? codEmbalagem);
  EmbalagemModel? get embalagem;
  set embalagem(EmbalagemModel? embalagem);
  String? get imagem;
  set imagem(String? imagem);
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? ultimaAlteracao);
  KitDescritorModel? get descritor;
  set descritor(KitDescritorModel? descritor);
  List<ItemModel>? get itens;
  set itens(List<ItemModel>? itens);
  KitCorModel? get cor1;
  set cor1(KitCorModel? cor1);
  KitCorModel? get cor2;
  set cor2(KitCorModel? cor2);
  KitCorModel? get cor3;
  set cor3(KitCorModel? cor3);
  KitCorModel? get cor4;
  set cor4(KitCorModel? cor4);
  String? get tStamp;
  set tStamp(String? tStamp);

  Color getCor1() {
    if (cor1 == null) return Colors.transparent;
    return Color.fromRGBO(cor1!.red ?? 0, cor1!.green ?? 0, cor1!.blue ?? 0, 1);
  }

  Color getCor2() {
    if (cor2 == null) return Colors.transparent;
    return Color.fromRGBO(cor2!.red ?? 0, cor2!.green ?? 0, cor2!.blue ?? 0, 1);
  }

  Color getCor3() {
    if (cor3 == null) return Colors.transparent;
    return Color.fromRGBO(cor3!.red ?? 0, cor3!.green ?? 0, cor3!.blue ?? 0, 1);
  }

  Color getCor4() {
    if (cor4 == null) return Colors.transparent;
    return Color.fromRGBO(cor4!.red ?? 0, cor4!.green ?? 0, cor4!.blue ?? 0, 1);
  }

  List<Color> getAllCores() {
    List<Color> cores = [];
    cores.add(getCor1());
    cores.add(getCor2());
    cores.add(getCor3());
    cores.add(getCor4());
    return cores;
  }

  bool get preparado => preparo == '1';
}
