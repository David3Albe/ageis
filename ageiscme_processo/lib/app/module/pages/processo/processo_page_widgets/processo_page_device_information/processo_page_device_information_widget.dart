import 'package:ageiscme_models/main.dart';
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
    if (width > 1600) return 20;
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
        return state.processo.maquina == null
            ? const SizedBox()
            : Tooltip(
                message: _getMessage(state),
                child: Icon(
                  Symbols.help,
                  size: _getIconSize(size),
                ),
              );
      },
    );
  }

  String _getMessage(ProcessoLeituraState state) {
    String value = '';
    value = _addParameter(value, state.processo.maquina ?? '');
    if (state.processo.leituraAtual.dataHoraInicioProcesso != null) {
      final f = DateFormat('dd/MM/yyyy HH:mm');
      String dataHora =
          f.format(state.processo.leituraAtual.dataHoraInicioProcesso!);

      value = _addParameter(value, dataHora);
    }
    InstituicaoModel? instituicao = state.processo.leituraAtual.instituicao;
    value = _addParameter(value, 'Instituição: ' + (instituicao?.nome ?? ''));

    return value;
  }

  String _addParameter(String value, String? parameter) {
    if (parameter == null) return value;
    if (!value.isEmpty) value += '\n';
    return value + parameter;
  }
}
