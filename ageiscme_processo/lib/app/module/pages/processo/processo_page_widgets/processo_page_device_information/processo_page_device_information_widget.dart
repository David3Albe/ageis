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

  double _getIconSize(Size size) {
    double width = size.width;
    if (width > 1600) return 16;
    if (width > 800) return 14;
    if (width > 600) return 12;
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
      buildWhen: (previous, current) =>
          current.rebuildType == ProcessoLeituraRebuildType.All,
      builder: (context, state) {
        double? escalaFonte = state.processo.getEscala();
        return state.processo.maquina == null
            ? const SizedBox()
            : Tooltip(
                richMessage: TextSpan(
                  text: _getMessage(state),
                  style: TextStyle(fontSize: 16 * escalaFonte),
                ),
                child: Icon(
                  Symbols.help,
                  size: _getIconSize(size) * escalaFonte,
                ),
              );
      },
    );
  }

  String _getMessage(ProcessoLeituraState state) {
    String value = '';
    if (state.processo.cod != null) {
      value = _addParameter(value, 'Código: ' + state.processo.cod.toString());
    }
    value = _addParameter(value, 'Máquina: ' + (state.processo.maquina ?? ''));
    if (state.processo.leituraAtual.dataHoraInicioProcesso != null) {
      final f = DateFormat('dd/MM/yyyy HH:mm');
      String dataHora =
          f.format(state.processo.leituraAtual.dataHoraInicioProcesso!);

      value = _addParameter(value, 'Início Leitura: ' + dataHora);
    }

    return value;
  }

  String _addParameter(String value, String? parameter) {
    if (parameter == null) return value;
    if (!value.isEmpty) value += '\n';
    return value + parameter;
  }
}
