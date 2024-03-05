import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoPageDeviceInformationWidget extends StatefulWidget {
  const ProcessoPageDeviceInformationWidget({Key? key});

  @override
  State<ProcessoPageDeviceInformationWidget> createState() =>
      _ProcessoPageDeviceInformationWidgetState();
}

class _ProcessoPageDeviceInformationWidgetState
    extends State<ProcessoPageDeviceInformationWidget> {
  String message = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.height / 1080;
    return BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
      buildWhen: (previous, current) =>
          current.rebuildType == ProcessoLeituraRebuildType.All,
      builder: (context, state) {
        return state.processo.maquina == null
            ? const SizedBox()
            : Tooltip(
                message: state.processo.maquina ?? '',
                child: Icon(
                  Symbols.help,
                  size: 24 * scale,
                ),
              );
      },
    );
  }
}
