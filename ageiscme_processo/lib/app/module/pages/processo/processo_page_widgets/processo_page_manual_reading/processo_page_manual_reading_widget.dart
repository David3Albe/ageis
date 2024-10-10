import 'package:ageiscme_models/models/processo_leitura_acao/processo_leitura_acao_model.dart';
import 'package:ageiscme_models/models/processo_leitura_prioridade/processo_leitura_prioridade_model.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/componentes/botoes/read_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:flutter/material.dart';

class ProcessoPageManualReadingWidget extends StatefulWidget {
  const ProcessoPageManualReadingWidget({
    required this.cubit,
    Key? key,
  });

  final ProcessoLeituraCubit cubit;

  @override
  State<ProcessoPageManualReadingWidget> createState() =>
      _ProcessoPageManualReadingWidgetState();
}

class _ProcessoPageManualReadingWidgetState
    extends State<ProcessoPageManualReadingWidget> {
  late TextFieldStringWidget txtCodigoBarra;
  late TextFieldStringWidget txtEquipamento;
  late TextFieldStringWidget txtUsuario;
  late TextFieldStringAreaWidget txtFilaLeituras;

  @override
  void initState() {
    txtCodigoBarra = TextFieldStringWidget(
      placeholder: 'Código Barra',
    );

    txtEquipamento = TextFieldStringWidget(
      placeholder: 'Equipamento',
      initialValue: '10200210200000001',
    );

    txtUsuario = TextFieldStringWidget(
      placeholder: 'Usuário',
      initialValue: '10100200000001',
    );
    
    txtFilaLeituras = TextFieldStringAreaWidget(
      placeholder: 'Fila leituras',
    );

    super.initState();
  }

  double getHeightManualReadings(Size size) {
    double height = size.height;
    if (height > 800) {
      return 485;
    } else if (height > 700) {
      return 475;
    }
    return 465;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scaleHeight = size.height / 1080;
    double height = getHeightManualReadings(size);
    return Material(
      elevation: 20,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          color: Cores.CorCardsEscuro,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0 * scaleHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      'Leitura Manual',
                      style: Fontes.getSegoe(
                        fontSize: 14,
                        cor: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: _reset,
                    icon: const Icon(Icons.restart_alt),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: txtUsuario,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: ReadButtonWidget(
                      onPressed: () => _ler(txtUsuario.text, context),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: txtEquipamento,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: ReadButtonWidget(
                      onPressed: () => _ler(txtEquipamento.text, context),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: DropDownWidget<ProcessoLeituraAcaoModel>(
                      sourceList: ProcessoLeituraAcaoModel.getAll(),
                      onChanged: (ProcessoLeituraAcaoModel item) =>
                          _lerAcao(item.codigo, context),
                      placeholder: 'Ação',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: DropDownWidget<ProcessoLeituraPrioridadeModel>(
                      sourceList: ProcessoLeituraPrioridadeModel.getAll(),
                      onChanged: (ProcessoLeituraPrioridadeModel item) =>
                          _lerPrioridade(item.codigo, context),
                      placeholder: 'Prioridade',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: txtCodigoBarra,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0 * scaleHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: ReadButtonWidget(
                      onPressed: () => _ler(txtCodigoBarra.text, context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _ler(String codigo, BuildContext context) async =>
      await widget.cubit.readManualCode(codigo);

  void _lerAcao(int codigo, BuildContext context) async =>
      await widget.cubit.readActionCode(codigo);

  void _lerPrioridade(int codigo, BuildContext context) async =>
      await widget.cubit.readPriority(codigo);

  void _reset() => widget.cubit.reset();

}
