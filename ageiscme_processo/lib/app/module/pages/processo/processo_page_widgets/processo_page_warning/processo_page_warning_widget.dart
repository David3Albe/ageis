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
              return Consumer<ProcessoPageWarningController>(
                builder: (context, value, child) => Container(
                  decoration: BoxDecoration(
                    color: value.corFundo,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 8 * scale,
                      bottom: 8 * scale,
                      right: 14 * scale,
                      left: 14 * scale,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.aviso == null ||
                                state.aviso == '' ||
                                !value.mostrarMensagem
                            ? Wrap(
                                children: [
                                  Text(
                                    'AVISO',
                                    style: Fontes.getSegoe(
                                      fontSize: 14 * scale,
                                      cor: Cores.CorTitleCards,
                                    ),
                                  ),
                                ],
                              )
                            : Wrap(
                                children: [
                                  Tooltip(
                                    message:
                                        state.aviso != null ? state.aviso : '',
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      state.aviso != null &&
                                              state.aviso! != '' &&
                                              value.mostrarMensagem
                                          ? state.aviso!
                                          : ' ',
                                      style: Fontes.getRobotoBold(
                                        fontSize: 24 * scale,
                                        cor: value.corTexto,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
