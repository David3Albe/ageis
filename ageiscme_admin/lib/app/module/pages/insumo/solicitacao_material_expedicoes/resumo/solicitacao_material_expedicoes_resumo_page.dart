import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/widgets/filter/filter_widget.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/widgets/grid/grid_widget.dart';
import 'package:flutter/material.dart';

class SolicitacaoMaterialExpedicoesResumoPage extends StatelessWidget {
  const SolicitacaoMaterialExpedicoesResumoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterWidget(),
        GridWidget(),
      ],
    );
  }
}
