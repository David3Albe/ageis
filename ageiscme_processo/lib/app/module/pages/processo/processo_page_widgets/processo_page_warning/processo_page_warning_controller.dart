import 'dart:async';

import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageWarningController extends ChangeNotifier
    implements Disposable {
  static const Color COR_TEXTO_VERMELHO = const Color(0xffFF0A0A);
  static const Color COR_TEXTO_PRETO = Cores.CorTextCards;
  static const Color COR_FUNDO_PRETO = Cores.CorCards;
  static const Color COR_FUNDO_VERMELHO = const Color(0xffBFC3DA);

  Color? corTexto;
  Color? corFundo;
  bool mostrarMensagem = true;
  int timesRunned = 4;

  Timer? timerCor;
  Timer? timerOcultaMensagem;

  void ocultaMensagem() {
    mostrarMensagem = false;
    notifyListeners();
  }

  void reiniciarTimerMensagem(ProcessoLeituraState state) {
    mostrarMensagem = true;
    timerOcultaMensagem?.cancel();
    int? tempoOcultarMensagem = buscarTempoOcultaMensagem(state);
    if (tempoOcultarMensagem == null) return;
    timerOcultaMensagem = Timer(const Duration(seconds: 10), ocultaMensagem);
  }

  int? buscarTempoOcultaMensagem(ProcessoLeituraState state) {
    switch (state.processo.leituraAtual.decisao) {
      case DecisaoEnum.DeterminarPriodade:
      case DecisaoEnum.ConfirmarUsoEPCEntrada:
      case DecisaoEnum.ConfirmarUsoEPCSaida:
      case DecisaoEnum.DefinirUsuarioCirculante:
      case DecisaoEnum.DefinirLocalOrigemDestino:
      case DecisaoEnum.DefineExistemKitsItensNaoConforme:
      case DecisaoEnum.ExistemItensNaoConforme:
      case DecisaoEnum.ItemNaoConforme:
      case DecisaoEnum.ExistemKitsNaoConforme:
      case DecisaoEnum.KitNaoConforme:
      case DecisaoEnum.AutorizarQuebraFluxo:
      case DecisaoEnum.DefinirTipoEmbalagemItemZ:
      case DecisaoEnum.DefinirUsoCalculadora:
      case DecisaoEnum.DefinirEmbalagemGeralItem:
      case DecisaoEnum.DefinirEmbalagemGeralKit:
      case DecisaoEnum.DefinirSeIraUsarAMesmaEmbalagemParaTodosItens:
      case DecisaoEnum.DefinirSeIraUsarAMesmaEmbalagemParaTodosKits:
      case DecisaoEnum.DefinirTipoEmbalagemItem:
      case DecisaoEnum.DefinirTipoEmbalagemKit:
      case DecisaoEnum.SolicitaIntegradorKit:
      case DecisaoEnum.RealizarConferenciaVisual:
      case DecisaoEnum.ProsseguirKitImcompleto:
      case DecisaoEnum.AutorizarKitImcompleto:
      case DecisaoEnum.RegistrarIndicador:
      case DecisaoEnum.RegistrarBiologico:
      case DecisaoEnum.ImprimirMaisEtiquetasLote:
      case DecisaoEnum.ImprimirMaisEtiquetasPreparo:
      case DecisaoEnum.ImprimirRelatorioRetirada:
      case DecisaoEnum.DefinirItemDataMatrixDanificado:
      case DecisaoEnum.ProsseguirDatamatrixDanificado:
      case DecisaoEnum.TomarDecisaoAcaoItem:
      case DecisaoEnum.TomarDecisaoAcaoKit:
      case DecisaoEnum.AutorizarAcaoOcorrencias:
        return null;
      default:
        return 10;
    }
  }

  void reiniciaTimerCor() {
    timerCor?.cancel();
    timesRunned = 0;
    setRedColor();
    timerCor =
        Timer.periodic(const Duration(milliseconds: 700), changeTimerColor);
  }

  void setRedColor() {
    corTexto = COR_TEXTO_VERMELHO;
    corFundo = COR_FUNDO_VERMELHO;
    timesRunned++;
    notifyListeners();
  }

  void changeTimerColor(Timer t) {
    if (!t.isActive) return;
    if (timesRunned > 1) {
      timerCor?.cancel();
      return;
    }
    corTexto =
        corTexto == COR_TEXTO_VERMELHO ? COR_TEXTO_PRETO : COR_TEXTO_VERMELHO;
    corFundo =
        corFundo == COR_FUNDO_VERMELHO ? COR_FUNDO_PRETO : COR_FUNDO_VERMELHO;
    timesRunned++;
    notifyListeners();
  }

  @override
  void dispose() {
    timerCor?.cancel();
    timerOcultaMensagem?.cancel();
    super.dispose();
  }
}
