import 'package:flutter/material.dart';

abstract class Cores {
  static const Color corPrincipal = Color(0xffE3E5F1);

  static const Map<int, Color> _corPrincipalOpacidade = {
    50: Color.fromRGBO(227, 229, 241, .1),
    100: Color.fromRGBO(227, 229, 241, .2),
    200: Color.fromRGBO(227, 229, 241, .3),
    300: Color.fromRGBO(227, 229, 241, .4),
    400: Color.fromRGBO(227, 229, 241, .5),
    500: Color.fromRGBO(227, 229, 241, .6),
    600: Color.fromRGBO(227, 229, 241, .7),
    700: Color.fromRGBO(227, 229, 241, .8),
    800: Color.fromRGBO(227, 229, 241, .9),
    900: Color.fromRGBO(227, 229, 241, 1),
  };

  static const MaterialColor materialCorPrincipal =
      MaterialColor(0xffE3E5F1, _corPrincipalOpacidade);

  static const Color corAvatarFundo = Color(0xff192E58);

  static const Color corAvatarTexto = Color(0xffffffff);

  static const Color corNomeUsuario = Color(0xff373737);

  static const Color corBotaoVerde = Color(0xff186511);

  static const Color corBotaoVerdeSelecionado =
      Color.fromARGB(228, 24, 101, 17);

  static const Color codBotaoAdicionarLinha = Color(0xff1c85c9);

  static const Color corBotaoAdicionarLinhaSelecionado =
      Color.fromARGB(255, 17, 77, 117);

  static const Color corBotaoSalvar = Color.fromARGB(255, 28, 114, 20);

  static const Color corBotaoSalvarHovered = Color(0xff186511);

  static const Color corBotaoLimpar = Color(0xff1c85c9);

  static const Color corBotaoLimparHovered = Color.fromARGB(255, 17, 77, 117);

  static const Color corBotaoInserir = Color(0xff192E58);

  static const Color corBotaoInserirHovered = Color.fromARGB(255, 15, 28, 53);

  static const Color corBotaoVoltar = Color(0xff1c85c9);

  static const Color corBotaoVoltarSelecionado =
      Color.fromARGB(255, 24, 113, 172);

  static const Color corBotaoLogin = Color(0xff192E58);

  static const Color corBotaoLoginSelecionado = Color.fromARGB(255, 18, 34, 65);

  static const Color corBotaoEditar = Color(0xff192E58);

  static const Color corBotaoEditarSelecionado =
      Color.fromARGB(255, 18, 34, 65);

  static const Color corBotaoRemover = Color(0xffD7011E);

  static const Color corBotaoRemoverSelecionado =
      Color.fromARGB(255, 146, 1, 20);

  static const Color corBotaoCancelar = Color(0xffD7011E);

  static const Color corBotaoCancelarHovered = Color(0xffD7011E);

  static const Color corTextoBranco = Color(0xffffffff);

  static const Color corIconeBranco = Color(0xffffffff);

  static const Color corRotaPai = Color(0xff727272);

  static const Color corRota = Color(0xff192E58);

  static const Color corSelecionarModulo = Color(0xff192E58);

  static const Color corFundoBranco = Color(0xffffffff);

  static const Color corFundoAgeis = Color(0xffBFC3DA);

  static const Color corModuloSelecionado = Color(0xffEEEEEE);

  static const Color corModuloNaoSelecionado = Color(0xffACAAAA);

  static const Color corSombraModuloSelecionado = Color(0xff000029);

  static const Color corFundoTextField = Color(0xffF2F2F2);

  static const Color corPlaceholderTextField = Color(0xff707070);

  static const Color corLetrasTextFieldLogin = Color(0xff003366);

  static const Color corFundoGrid = Color(0xffE0E0E0);

  static const Color corLoading = Color.fromARGB(255, 33, 150, 243);

  static const Color corBotaoClose = Color(0xff727272);

  static const Color corBotaoCloseHover = Color.fromARGB(255, 88, 88, 88);

  static const Color corBotaoLink = Color(0xFF727272);

  static const Color corBotaoLinkHover = Color(0xFF727272);

  static const Color corBotaoArquivo = Color(0xFF707070);

  static const Color corBotaoArquivoHover = Color(0xff716E6E);

  static const Color corBotaoAbrirTela = Color(0xFF707070);

  static const Color corBotaoAbrirTelaHover = Color(0xff716E6E);

  static const Color corTextSelection = Color.fromARGB(55, 3, 168, 244);

  static const Color corToastSucesso = Color(0xffD6ECC5);

  static const Color corIconeSucesso = Color(0xff0C5705);

  static const Color corTextoSucesso = Color(0xff373737);

  static const Color corToastErro = Color(0xffFFCCD2);

  static const Color corIconeToastBackgroundErro = Color(0xffC9000E);

  static const Color corToastBackgroundErro = Color(0xffFFCCD2);

  static const Color corToastBackgroundWarning = Color(0xffF6F5C0);

  static const Color corIconeToastWarning = Color(0xffE19D00);

  static const Color corIconeErro = Color(0xff9C160D);

  static const Color corFundoIconeErro = Color(0xffFFCCD2);

  static const Color corFundoIconeWarning = Color.fromARGB(90, 225, 157, 0);

  static const Color corFonteErro = Color(0xff9C160D);

  static const Color corTextoErro = Color(0xff161616);

  static const Color corTexto = Color(0xFF050505);

  static const Color corScrollBar = Color(0xFFB9B7B7);

  static const Color corMenuItens = Color(0xFFE0E0E0);

  static const Color corTextoVermelho = Color(0xffD7011E);

  static const Color corTextoBloqueado = Colors.grey;

  static const Color corTextoLiberado = Colors.lightGreen;

  static const Color corTextoLiberadoRestricao = Colors.orange;

  static const Color corTextoPendente = Colors.lightBlue;

  static const Color corTextoDanificado = Colors.redAccent;

  static const Color corBotaoImprimir = Color(0xff727272);
}
