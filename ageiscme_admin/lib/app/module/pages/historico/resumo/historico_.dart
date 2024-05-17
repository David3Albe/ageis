import 'package:ageiscme_admin/app/module/pages/historico/resumo/widgets/detailed_grid/detailed_grid_widget.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/widgets/filter/filter_widget.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/widgets/grid/grid_widget.dart';
import 'package:flutter/material.dart';

class HistoricoResumoPage extends StatelessWidget {
  const HistoricoResumoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterWidget(),
        Expanded(
          child: Row(
            children: [
              GridWidget(),
              const Padding(
                padding: EdgeInsets.only(left: 8),
              ),
              DetailedGridWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
