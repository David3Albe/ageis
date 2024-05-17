import 'package:ageiscme_models/query_models/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_model.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class LegendaWidget extends StatelessWidget {
  const LegendaWidget({required this.kit, Key? key}) : super(key: key);
  final ConsultaProcessosLeituraDetalheKitModel? kit;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: kit?.legenda != null,
      child: SelectableText(
        kit?.legenda ?? '',
        style: TextStyle(
          color: getColor(kit?.statusKit ?? ''),
        ),
      ),
    );
  }

  Color getColor(String statusKit) {
    switch (statusKit) {
      case 'Bloqueado':
        return Cores.corTextoBloqueado;
      case 'Liberado':
        return Cores.corTextoLiberado;
      case 'Liberado com Restrições':
        return Cores.corTextoLiberadoRestricao;
      default:
        return Colors.black;
    }
  }
}
