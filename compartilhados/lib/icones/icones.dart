import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

abstract class Icones {
  static const Icon iconeProcesso = const Icon(
    Symbols.cycle,
  );

  static const Icon iconeAdmin = const Icon(
    Symbols.settings,
  );

  static const Icon iconeSenhaInvisivel = const Icon(
    Symbols.visibility_off,
    color: Colors.black,
  );

  static const Icon iconeSenhaVisivel = const Icon(
    Symbols.visibility,
    color: Colors.black,
  );
}
