import 'package:flutter/material.dart';

class KitProcessoStatus {
  static const int lidos = 1;
  static const int dataMatrixDanificado = 2;
  static const int faltantes = 3;
  static const int naoLidos = 4;
  static const int preparado = 5;
  static const int modoConsulta = 6;

  KitProcessoStatus({required this.cod});
  int cod;

  static String getDescription(int cod) {
    switch (cod) {
      case KitProcessoStatus.lidos:
        return 'Lidos';
      case KitProcessoStatus.dataMatrixDanificado:
        return 'Etiqueta Danificada';
      case KitProcessoStatus.naoLidos:
        return 'Não Lidos';
      case KitProcessoStatus.faltantes:
        return 'Faltantes';
      case KitProcessoStatus.preparado:
        return 'Kit Preparado';
        case KitProcessoStatus.modoConsulta:
        return 'Modo Consulta';
    }
    throw Exception('Kit Processo Status Tipo Não Definido');
  }

  static KitProcessoStatus getStatusFromCod(int cod) =>
      KitProcessoStatus(cod: cod);

  static Color getCorFromStatus(int cod) {
    switch (cod) {
      case KitProcessoStatus.lidos:
        return const Color(0xff038308);
      case KitProcessoStatus.dataMatrixDanificado:
        return const Color(0xffFF0A0A);
      case KitProcessoStatus.naoLidos:
        return const Color(0xffE69A1C);
      case KitProcessoStatus.faltantes:
        return const Color.fromARGB(255, 43, 141, 221);
      case KitProcessoStatus.preparado:
        return const Color.fromARGB(255, 78, 78, 78);
      case KitProcessoStatus.modoConsulta:
        return const Color.fromARGB(255, 37, 37, 37);
    }
    throw Exception('Kit Processo Status Tipo Não Definido');
  }
}
