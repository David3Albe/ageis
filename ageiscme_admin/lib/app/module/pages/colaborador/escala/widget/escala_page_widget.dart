import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_grid_cubit.dart';
import 'package:compartilhados/componentes/botoes/default_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class EscalaPageWidget extends StatelessWidget {
  const EscalaPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DatePickerWidget(
              placeholder: 'Ano/Mês',
              formato: DateFormat('MM/yyyy'),
            ),
            const Spacer(),
            DefaultButtonWidget(
              cor: Colors.blue.shade400,
              corHovered: Colors.blue.shade600,
              icon: Icons.search,
              onPressed: () => consultar(context: context),
              text: 'Consultar',
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: PlutoGrid(
              columns:
                  BlocProvider.of<EscalaPageGridCubit>(context, listen: true)
                      .state
                      .columns,
              rows: BlocProvider.of<EscalaPageGridCubit>(context, listen: true)
                  .state
                  .rows,
              onLoaded: (e) => e.stateManager.setRowGroup(
                PlutoRowGroupByColumnDelegate(
                  columns: [
                    BlocProvider.of<EscalaPageGridCubit>(context, listen: true)
                        .state
                        .columns[0],
                  ],
                  showFirstExpandableIcon: false,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void consultar({required BuildContext context}) =>
      BlocProvider.of<EscalaPageCubit>(context).queryOne(context: context);
}
