import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_warning/processo_page_warning_controller.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/provider_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageWarningWidget extends StatefulWidget {
  const ProcessoPageWarningWidget({Key? key});

  @override
  State<ProcessoPageWarningWidget> createState() =>
      _ProcessoPageWarningWidgetState();
}

class _ProcessoPageWarningWidgetState extends State<ProcessoPageWarningWidget> {
  late ProcessoPageWarningController _controller;

  @override
  void initState() {
    _controller = ProcessoPageWarningController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scale = MediaQuery.of(context).size.width / 1920;
    return ChangeNotifierProvider.value(
      value: _controller,
      child: Material(
        elevation: 10,
        child: BlocListener<ProcessoLeituraCubit, ProcessoLeituraState>(
          listener: (context, state) {
            if (state.rebuildType != ProcessoLeituraRebuildType.All) return;
            _controller.reiniciarTimerMensagem(state);
            _controller.reiniciaTimerCor(state);
          },
          child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
            buildWhen: (previous, current) =>
                current.rebuildType == ProcessoLeituraRebuildType.All,
            builder: (context, state) {
              double escalaFonte = state.processo.getEscala();
              double lineHeightRobot = state.processo.getLineHeightRoboto();
              return Consumer<ProcessoPageWarningController>(
                builder: (context, value, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: value.corFundo,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8 * scale / escalaFonte,
                        bottom: 8 * scale / escalaFonte,
                        right: 14 * scale / escalaFonte,
                        left: 14 * scale / escalaFonte,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: state.aviso == null ||
                                state.aviso == '' ||
                                !value.mostrarMensagem
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        mainAxisAlignment: state.aviso == null ||
                                state.aviso == '' ||
                                !value.mostrarMensagem
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          state.aviso == null ||
                                  state.aviso == '' ||
                                  !value.mostrarMensagem
                              ? Wrap(
                                  children: [
                                    Text(
                                      'AVISO',
                                      style: Fontes.getSegoe(
                                        fontSize: 14 * scale * escalaFonte,
                                        cor: Cores.CorTitleCards,
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Tooltip(
                                    richMessage: TextSpan(
                                      text: state.aviso != null
                                          ? state.aviso
                                          : '',
                                      style: TextStyle(
                                        fontSize: 26 * escalaFonte,
                                      ),
                                    ),
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      state.aviso != null &&
                                              state.aviso! != '' &&
                                              value.mostrarMensagem
                                          ? state.aviso!
                                          : ' ',
                                      style: Fontes.getRobotoBold(
                                        fontSize: 20 * scale * escalaFonte,
                                        cor: value.corTexto,
                                        lineHeight: lineHeightRobot,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
