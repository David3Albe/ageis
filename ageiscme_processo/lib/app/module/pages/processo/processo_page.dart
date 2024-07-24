import 'dart:async';

import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_consignado_print/estoque_item_consignado_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_kit_print/estoque_kit_item_print/estoque_kit_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_kit_print/estoque_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_print_dto.dart';
import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_item_print/processo_preparation_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_kit_print/processo_preparation_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:ageiscme_impressoes/prints/estoque_printer/estoque_printer_controller.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/etiqueta_lote_printer_controller.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/processo_preparation_printer_controller.dart';
import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/enums/custom_audio.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_action_compliance/processo_page_action_compliance_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_arsenal_localization/processo_page_arsenal_localization_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/processo_page_calculator_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_consigned_items/processo_page_consigned_items_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_lote_equipamento/processo_page_lote_equipamento_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_prontuary/processo_page_prontuary_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_reason_break_cycle/processo_page_reason_break_cycle_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_reason_for_non_compliance_item/processo_page_reason_for_non_compliance_item_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_reason_for_non_compliance_kit/processo_page_reason_for_non_compliance_kit_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_reason_item_arsenal_return/processo_page_reason_item_arsenal_return_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_reason_remove_arsenal/processo_page_reason_remove_arsenal_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_reason_remove_arsenal_item/processo_page_reason_remove_arsenal_item_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_action/processo_page_action_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_local/processo_page_local_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_manual_reading/processo_page_manual_reading_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_zoom/processo_page_zoom_dialog.dart';
import 'package:ageiscme_processo/app/module/web_sockets/processo_leitura/processo_leitura_web_socket.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/dialogs/movable_dialog.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_manual_reading/processo_page_manual_reading_widget_state.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_object_preview/processo_page_object_preview_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_object_reader/processo_page_object_reader_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_origin_destiny/processo_page_origin_destiny_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_priority/processo_page_priority_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_stepper/processo_page_stepper_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_user/processo_page_user_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_warning/processo_page_warning_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/functions/custom_audio_player.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';
import 'package:ageiscme_processo/app/module/services/processo_navigator_service.dart';

class ProcessoPage extends StatefulWidget {
  const ProcessoPage({required this.userCode, super.key});
  final String? userCode;

  @override
  State<ProcessoPage> createState() => _ProcessoPageState();
}

class _ProcessoPageState extends State<ProcessoPage> {
  static const Duration TIMER_REFRESH_DURATION = Duration(seconds: 60);
  static const Duration TIMER_FECHAR_TELA_DURATION = Duration(seconds: 30);
  FocusNode _textNode = FocusNode();
  late final ColetoresHelper coletorHelper = ColetoresHelper(
    onEnter: handleKey,
  );
  late ProcessoLeituraCubit _disposeCubit;
  Timer? TIMER_REFRESH_LEITURAS;
  Timer? TIMER_FECHAR_TELA;

  @override
  void initState() {
    final ProcessoLeituraCubit _cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    _cubit.setFocus(_textNode);
    TIMER_REFRESH_LEITURAS = Timer.periodic(TIMER_REFRESH_DURATION, (Timer t) {
      if (!t.isActive) return;
      updateLastRefreshTime();
    });
    TIMER_FECHAR_TELA = Timer.periodic(TIMER_FECHAR_TELA_DURATION, (timer) {
      if (!timer.isActive) return;
      fecharTela();
    });

    _cubit.webSocket = ProcessoLeituraWebSocket(
      onConnectionLost: onConnectionLost,
      handleKey: () => _cubit.setHandleKey(handleKey),
      onMessageReceived: (p0) => _cubit.onMessage(p0, context),
      onError: _cubit.setException,
    );

    _cubit.webSocket!.connect().then((value) {
      if (widget.userCode != null) {
        _cubit.readCode(widget.userCode);
      }
    });

    super.initState();
  }

  void onConnectionLost(String str) {
    ToastUtils.showCustomToastWarning(context, 'Perca de conexão' + str);
  }

  void fecharTela() {
    ProcessoLeituraCubit cubit = BlocProvider.of<ProcessoLeituraCubit>(context);
    cubit.fecharTela(context);
  }

  @override
  void dispose() {
    _disposeCubit.webSocket?.close();
    TIMER_REFRESH_LEITURAS?.cancel();
    TIMER_FECHAR_TELA?.cancel();
    super.dispose();
  }

  void updateLastRefreshTime() {
    _disposeCubit.updateLastRefreshTimeOfReading(_disposeCubit.state.processo);
  }

  double getFontSize(Size size) {
    double height = size.height;
    if (height > 900) {
      return 18;
    } else if (height > 800) {
      return 16;
    } else if (height > 700) {
      return 15;
    } else if (height > 600) {
      return 14;
    }
    return 13;
  }

  @override
  Widget build(BuildContext context) {
    _disposeCubit = BlocProvider.of<ProcessoLeituraCubit>(context);
    Size size = MediaQuery.of(context).size;
    double fontSize = getFontSize(size);
    return ContextMenuOverlay(
      buttonStyle: ContextMenuButtonStyle(
        textStyle: TextStyle(
          fontSize: fontSize,
        ),
        fgColor: Colors.black,
        bgColor: Colors.white,
        hoverFgColor: Colors.black87,
        hoverBgColor: Colors.grey[350],
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProcessoPageManualReadingWidgetCubit,
              ProcessoPageManualReadingWidgetState>(
            listenWhen: (previous, current) =>
                previous.visible != current.visible,
            listener: (context, state) {
              _toogleManualReadingsOverlay(state.visible);
            },
          ),
          BlocListener<ProcessoLeituraCubit, ProcessoLeituraState>(
            listenWhen: (previous, current) {
              return current.rebuildType == ProcessoLeituraRebuildType.All ||
                  current.rebuildType == ProcessoLeituraRebuildType.Zoom ||
                  current.rebuildType == ProcessoLeituraRebuildType.Loading;
            },
            listener: (context, state) async {
              switch (state.rebuildType) {
                case (ProcessoLeituraRebuildType.All):
                  _playAudio(state.processo);
                  await _showProntuaryDialog(state.processo);
                  await _showArsenalLocalizationSelectDialog(state.processo);
                  _showLoteEquipamento(state.processo);
                  _showReasonForNonComplianceItemDialog(state.processo);
                  _showReasonForNonComplianceKitDialog(state.processo);
                  _showItemArsenalReturnReasonDialog(state.processo);
                  _showKitArsenalReturnReasonDialog(state.processo);
                  _showReasonBreakCycleDialog(state.processo);
                  _showReasonRemoveKitItemArsenalDialog(state.processo);
                  _showReasonRemoveItemArsenalDialog(state.processo);
                  await _showDialogActionCompliance(state.processo);
                  await _showCalculator(state.processo, state.aviso);
                  await _showConsigned(state.processo);
                  await _printPreparoPdf(state.processo);
                  await _printEtiquetaLotePdf(state.processo);
                  await _printRelatorioRetirada(state.processo);
                  break;
                case (ProcessoLeituraRebuildType.Zoom):
                  _zoom(context);
                  break;
                default:
                  break;
              }
              _endReading(state);
            },
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return KeyboardListener(
              onKeyEvent: coletorHelper.handleKey,
              autofocus: true,
              focusNode: _textNode,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 70,
                                          minHeight: 45,
                                        ),
                                        height: constraints.maxHeight * 0.08,
                                        child:
                                            const ProcessoPageStepperWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 70,
                                          minHeight: 40,
                                        ),
                                        height: constraints.maxHeight * 0.08,
                                        child:
                                            const ProcessoPageObjectReaderWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                  ),
                                ),
                                const Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: const Column(
                                          children: [
                                            Expanded(
                                              child:
                                                  const ProcessoPageObjectPreviewWidget(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 90,
                                          minHeight: 50,
                                        ),
                                        child:
                                            const ProcessoPageWarningWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxHeight: 70,
                                                    minHeight: 40,
                                                  ),
                                                  height:
                                                      constraints.maxHeight *
                                                          0.08,
                                                  child:
                                                      const ProcessoPageUserWidget(),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                  left: 8,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxHeight: 70,
                                                    minHeight: 40,
                                                  ),
                                                  height:
                                                      constraints.maxHeight *
                                                          0.08,
                                                  child:
                                                      const ProcessoPageLocalWidget(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxHeight: 70,
                                                    minHeight: 40,
                                                  ),
                                                  height:
                                                      constraints.maxHeight *
                                                          0.08,
                                                  child:
                                                      const ProcessoPageActionWidget(),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                  left: 8,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxHeight: 70,
                                                    minHeight: 40,
                                                  ),
                                                  height:
                                                      constraints.maxHeight *
                                                          0.08,
                                                  child:
                                                      const ProcessoPageOriginDestinyWidget(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                const Expanded(
                                  flex: 10000,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: const ProcessoPageReadingsWidget(),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: 70,
                                      minHeight: 40,
                                    ),
                                    height: constraints.maxHeight * 0.08,
                                    child: const ProcessoPagePriorityWidget(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future handleKey(String barCode) async {
    final ProcessoLeituraCubit _cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    await _cubit.readCode(barCode);
  }

  void _playAudio(ProcessoLeituraMontagemModel processoLeitura) async {
    if (processoLeitura.leituraCodigo.avisosSonoro.isEmpty) return;
    List<CustomAudio> audios = [];
    for (int codAudio in processoLeitura.leituraCodigo.avisosSonoro) {
      CustomAudio? audio = CustomAudio.getOneFromCode(codAudio);
      if (audio == null) return;
      audios.add(audio);
    }
    await CustomAudioPlayer.playAudiosFromAsset(
      audios.map((e) => e.path).toList(),
    );
  }

  void _toogleManualReadingsOverlay(bool visible) {
    final ProcessoPageManualReadingWidgetCubit _manualReadingsCubit =
        BlocProvider.of<ProcessoPageManualReadingWidgetCubit>(context);
    if (visible) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return MovableDialog(
            x: _manualReadingsCubit.state.x,
            y: _manualReadingsCubit.state.y,
            onPan: _manualReadingsCubit.onPan,
            alertDialog: AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: ProcessoPageManualReadingWidget(
                cubit: cubit,
              ),
            ),
          );
        },
      ).then(
        (value) {
          _manualReadingsCubit.toogleVisibility();
        },
      );
    }
  }

  Future _showProntuaryDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) async {
    if (processoLeitura.leituraAtual.decisao != DecisaoEnum.MontarProntuario) {
      return;
    }
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageProntuaryDialog(processoLeitura: processoLeitura);
      },
    );
    final ProcessoLeituraCubit cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    String lastCode = cubit.state.processo.filaLeituras!.removeLast();
    await cubit.readCode(lastCode);
  }

  void _showLoteEquipamento(ProcessoLeituraMontagemModel processoLeitura) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.InformaLoteEquipamento) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageLoteEquipamentoDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      cubit.readCode('IGNORAR');
    });
  }

  void _showReasonForNonComplianceItemDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.SelecionaMotivoNaoConformidadeItem) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageReasonForNonComplianceItemDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      String lastCode = cubit.state.processo.filaLeituras!.removeLast();
      cubit.readCode(lastCode);
    });
  }

  Future _showArsenalLocalizationSelectDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) async {
    if (processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.DefinirLocalizacaoItem &&
        processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.DefinirLocalizacaoKit) {
      return;
    }
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageArsenalLocalizationDialog(
          processoLeitura: processoLeitura,
        );
      },
    );
    final ProcessoLeituraCubit cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    String lastCode = cubit.state.processo.filaLeituras!.last;
    await cubit.readCode(lastCode);
  }

  void _showReasonForNonComplianceKitDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.SelecionaMotivoNaoConformidadeKit) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageReasonForNonComplianceKitDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      String lastCode = cubit.state.processo.filaLeituras!.removeLast();
      cubit.readCode(lastCode);
    });
  }

  void _showItemArsenalReturnReasonDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.SelecionarMotivoRetornoArsenalItem) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageReasonItemArsenalReturnDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      String lastCode = cubit.state.processo.filaLeituras!.removeLast();
      cubit.readCode(lastCode);
    });
  }

  void _showKitArsenalReturnReasonDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.SelecionarMotivoRetornoArsenalKit) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageReasonItemArsenalReturnDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      String lastCode = cubit.state.processo.filaLeituras!.removeLast();
      cubit.readCode(lastCode);
    });
  }

  void _showReasonBreakCycleDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.SelecionarMotivoQuebraFluxo) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageReasonBreakCycleDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      String lastCode = cubit.state.processo.filaLeituras!.removeLast();
      cubit.readCode(lastCode);
    });
  }

  void _showReasonRemoveKitItemArsenalDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.SelecionarMotivoReprocessamentoKit) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageReasonRemoveArsenalDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      String lastCode = cubit.state.processo.filaLeituras!.removeLast();
      cubit.readCode(lastCode);
    });
  }

  void _showReasonRemoveItemArsenalDialog(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.SelecionarMotivoReprocessamentoItem) {
      return;
    }
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageReasonRemoveArsenalItemDialog(
          processoLeitura: processoLeitura,
        );
      },
    ).then((salvou) {
      final ProcessoLeituraCubit cubit =
          BlocProvider.of<ProcessoLeituraCubit>(context);
      String lastCode = cubit.state.processo.filaLeituras!.removeLast();
      cubit.readCode(lastCode);
    });
  }

  Future _showCalculator(
    ProcessoLeituraMontagemModel processoLeitura,
    String? aviso,
  ) async {
    if (processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.DefinirValorCalculadora &&
        processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.RetentativaDefinirValorCalculadora) {
      return;
    }
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    if (processoLeitura.leituraAtual.decisao ==
            DecisaoEnum.RetentativaDefinirValorCalculadora &&
        aviso != null) {
      WarningUtils.showWarningDialog(
        context,
        aviso,
      );
    }
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: processoCubit,
          child: const ProcessoPageCalculatorDialog(),
        );
      },
    );
  }

  Future _showDialogActionCompliance(
    ProcessoLeituraMontagemModel processoLeitura,
  ) async {
    if (processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.EscolherAcaoCorretiva &&
        processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.EscolherMotivoNaoCorrecao) {
      return;
    }
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: processoCubit,
          child: ProcessoPageActionComplianceDialog(
            processoLeitura: processoLeitura,
          ),
        );
      },
    );
  }

  Future _showConsigned(
    ProcessoLeituraMontagemModel processoLeitura,
  ) async {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.DefinirItemConsignado) {
      return;
    }
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: processoCubit,
          child: const ProcessoPageConsignedItemsDialog(),
        );
      },
    );
  }

  DateTime? dataPreparo;
  Future _printPreparoPdf(ProcessoLeituraMontagemModel processoLeitura) async {
    if (processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.ImprimirItemPreparo &&
        processoLeitura.leituraAtual.decisao !=
            DecisaoEnum.ImprimirMaisEtiquetasPreparo) {
      return;
    }

    ProcessoPreparationPrintDTO dto =
        createPrintPreparationDTO(processoLeitura);
    bool sucess =
        await ProcessoPreparationPrinterController(context: context, dto: dto)
            .print();

    if (sucess == false) {
      ErrorUtils.showErrorDialog(context, [
        'Houve um erro ao realizar a impressão de preparo, entre em contato com o T.I.',
      ]);
    }
  }

  ProcessoPreparationPrintDTO createPrintPreparationDTO(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    List<ProcessoPreparationItemPrintDTO> itens = [];
    for (ItemProcessoModel item in processoLeitura.leituraAtual.itens) {
      ItemDescritorModel itemDescritor = item.getDescritor(processoLeitura)!;
      int prioridade =
          item.prioridade ?? processoLeitura.leituraAtual.prioridade!;
      ProcessoTipoModel processoTipo = getTipoProcessoPrioridade(
        prioridade: prioridade,
        tipoProcessoEmergencia: itemDescritor.tipoProcessoEmergencia,
        tipoProcessoNormal: itemDescritor.tipoProcesso,
        tipoProcessoUrgente: itemDescritor.tipoProcessoUrgencia,
      );
      EmbalagemModel embalagem = processoLeitura.leituraAtual.embalagens!
          .firstWhere((element) => element.cod == item.codEmbalagem);
      itens.add(
        ProcessoPreparationItemPrintDTO(
          nome: item.descricao!,
          nomeProprietario: item.getProprietario(processoLeitura)!.nome!,
          nomeProcesso: processoTipo.nome,
          validadeEmbalagem: embalagem.validadeProcessosDias ?? 0,
          tagId: item.idEtiqueta!,
          urgency: prioridade == 2,
          ordemLeitura: item.ordemLeitura ?? 0,
        ),
      );
    }

    List<ProcessoPreparationKitPrintDTO> kits = [];
    for (KitProcessoModel kit in processoLeitura.leituraAtual.kits) {
      KitDescritorModel kitDescritor = kit.descritor!;
      int? prioridade =
          kit.prioridade ?? processoLeitura.leituraAtual.prioridade;
      if (prioridade == null) {
        prioridade = kit.itens
            ?.where((item) => item.prioridade != null)
            .firstOrNull
            ?.prioridade;
      }
      if (prioridade == null) {
        WarningUtils.showWarningDialog(
          context,
          'Não foi possível definir a prioridade do kit ${kitDescritor.descricao} Entre em contato com o suporte!',
        );
        continue;
      }
      ProcessoTipoModel processoTipo = getTipoProcessoPrioridade(
        prioridade: prioridade,
        tipoProcessoEmergencia: kitDescritor.tipoProcessoEmergencia,
        tipoProcessoNormal: kitDescritor.tipoProcesso,
        tipoProcessoUrgente: kitDescritor.tipoProcessoUrgencia,
      );
      EmbalagemModel embalagem = processoLeitura.leituraAtual.embalagens!
          .firstWhere((element) => element.cod == kit.codEmbalagem);
      kits.add(
        ProcessoPreparationKitPrintDTO(
          itensLidos: kit.itensLidosCalculado!,
          itensTotalKit: kit.itensTotalKitCalculado!,
          nomeDescritor: kitDescritor.nome!,
          nomeProprietario: kit.itens!
              .where(
                (element) =>
                    element.getProprietario(processoLeitura)?.nome != null,
              )
              .first
              .getProprietario(processoLeitura)!
              .nome!,
          nomeProcesso: processoTipo.nome,
          validadeEmbalagem: embalagem.validadeProcessosDias ?? 0,
          tagId: kit.codBarra!,
          urgency: prioridade == 2,
        ),
      );
    }
    if (dataPreparo == null) {
      dataPreparo = DateTime.now();
    }
    return ProcessoPreparationPrintDTO(
      companyName: processoLeitura.leituraAtual.instituicao!.nome!,
      actualTime: dataPreparo!,
      userName: processoLeitura.leituraAtual.usuario!.nome!,
      kits: kits,
      itens: itens,
    );
  }

  ProcessoTipoModel getTipoProcessoPrioridade({
    required ProcessoTipoModel? tipoProcessoNormal,
    required ProcessoTipoModel? tipoProcessoUrgente,
    required ProcessoTipoModel? tipoProcessoEmergencia,
    required int prioridade,
  }) {
    if (prioridade == 1) return tipoProcessoNormal!;
    if (prioridade == 2) return tipoProcessoUrgente!;
    return tipoProcessoEmergencia!;
  }

  DateTime? dataHoraEtiquetaLote;
  Future _printEtiquetaLotePdf(
    ProcessoLeituraMontagemModel processoLeitura,
  ) async {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.ImprimirMaisEtiquetasLote) {
      return;
    }

    EtiquetaLotePrintDTO lote = _criarDTOetiquetaLote(processoLeitura);
    bool? sucess =
        await EtiquetaLotePrinterController(context: context, dto: lote)
            .print();

    if (sucess == false) {
      ErrorUtils.showErrorDialog(context, [
        'Houve um erro ao realizar a impressão de etiqueta de lote, entre em contato com o T.I.',
      ]);
    }
  }

  EtiquetaLotePrintDTO _criarDTOetiquetaLote(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    int impressoes = 0;
    for (int i = 0; i < processoLeitura.leituraAtual.kits.length; i++) {
      impressoes++;
    }

    for (int i = 0; i < processoLeitura.leituraAtual.itens.length; i++) {
      impressoes++;
    }
    impressoes = impressoes + 2;
    if (dataHoraEtiquetaLote == null) {
      dataHoraEtiquetaLote = DateTime.now();
    }

    return EtiquetaLotePrintDTO(
      codRegistroProcesso: processoLeitura.leituraAtual.processoRegistro!.cod!,
      dataAtual: dataHoraEtiquetaLote!,
      nomeEquipamento: processoLeitura.leituraAtual.equipamento!.nome!,
      nomeUsuario: processoLeitura.leituraAtual.usuario!.nome!,
      impressoes: impressoes,
      codLote: processoLeitura.leituraAtual.loteEquipamento.codLote,
    );
  }

  Future _printRelatorioRetirada(
    ProcessoLeituraMontagemModel processoLeitura,
  ) async {
    if (processoLeitura.leituraAtual.decisao !=
        DecisaoEnum.ImprimirRelatorioRetirada) {
      return;
    }
    bool? sucess = await EstoquePrinterController(
      dto: _getEstoquePrintDTO(processoLeitura),
      context: context,
    ).print();
    if (sucess == false) {
      ErrorUtils.showErrorDialog(context, [
        'Houve um erro ao realizar a impressão de relatório de retirada, entre em contato com o T.I.',
      ]);
    }
  }

  EstoquePrintDTO _getEstoquePrintDTO(
    ProcessoLeituraMontagemModel processoLeitura,
  ) {
    List<EstoqueKitPrintDTO> kits = [];
    for (KitProcessoModel kit in processoLeitura.leituraAtual.kits) {
      kits.add(
        EstoqueKitPrintDTO(
          codBarra: kit.codBarra!,
          nome: kit.descritor!.nome!,
          itens: kit.itens!
              .map(
                (item) => EstoqueKitItemPrintDTO(
                  codBarra: item.idEtiqueta!,
                  nome: item.descricao!,
                  riscado: item.status == '3' || item.status == '4',
                ),
              )
              .toList(),
        ),
      );
    }

    List<EstoqueItemPrintDTO> itens = [];
    for (ItemProcessoModel item in processoLeitura.leituraAtual.itens) {
      List<EstoqueItemConsignadoPrintDTO> consignados = [];
      if (item.getDescritor(processoLeitura)?.consignado == true &&
          item.itensConsignados != null) {
        consignados = item.itensConsignados!
            .map(
              (e) => EstoqueItemConsignadoPrintDTO(
                cod: e.cod.toString(),
                nome: e.descricao!,
                quantidade: e.conferenciaPreparo ?? e.quantidade ?? 0,
              ),
            )
            .toList();
      }
      itens.add(
        EstoqueItemPrintDTO(
          codBarra: item.idEtiqueta!,
          nome: item.descricao!,
          consignados: consignados,
        ),
      );
    }

    return EstoquePrintDTO(
      actualTime: DateTime.now(),
      circulante: processoLeitura.leituraAtual.circulante!.nome!,
      companyName: processoLeitura.leituraAtual.instituicao!.nome!,
      nomeLocal: processoLeitura.leituraAtual.estoque!.nome!,
      userName: processoLeitura.leituraAtual.usuario!.nome!,
      circulanteDoc: processoLeitura.leituraAtual.circulante?.docClasse,
      userDoc: processoLeitura.leituraAtual.usuario?.docClasse,
      prontuario: processoLeitura
          .leituraAtual.processoDetalheRegistro?.prontuarioRetirada,
      kits: kits,
      itens: itens,
    );
  }

  void _endReading(ProcessoLeituraState processoLeitura) {
    if (processoLeitura.cancelouLeitura != true &&
        processoLeitura.finalizouLeitura != true) return;
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (_) {
        return const SizedBox();
      },
    );
    Future.delayed(
      const Duration(milliseconds: 5000),
      ProcessoNavigatorService.ToUserScreen,
    );
  }

  void _zoom(BuildContext context) {
    final ProcessoLeituraCubit cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    ItemProcessoModel? item = cubit.state.processo.getItemSelecionado();
    KitProcessoModel? kit = cubit.state.processo.leituraAtual.kits
        .where((element) => element.selecionado == true)
        .firstOrNull;
    if (kit == null &&
        item == null &&
        cubit.state.processo.leituraAtual.kitEmLeitura?.selecionado == true) {
      kit = cubit.state.processo.leituraAtual.kitEmLeitura;
    }
    if (item == null && kit == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não há item nem kit para aplicar o zoom',
      );
      return;
    }
    showDialog<bool>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return ProcessoPageZoomDialog(
          leituraCubit: cubit,
        );
      },
    );
  }
}
