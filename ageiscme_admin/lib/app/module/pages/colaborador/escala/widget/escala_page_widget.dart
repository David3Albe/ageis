import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/widget/grid/escala_grid_page_widget.dart';
import 'package:compartilhados/componentes/botoes/default_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
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
            Expanded(
              child: DatePickerWidget(
                placeholder: 'Ano/Mês',
                formato: DateFormat('MM/yyyy'),
                onDateSelected: (data) =>
                    BlocProvider.of<EscalaPageCubit>(context)
                        .setData(data: data),
              ),
            ),
            const Spacer(flex: 2),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DefaultButtonWidget(
                    cor: Colors.blue.shade400,
                    corHovered: Colors.blue.shade600,
                    icon: Icons.search,
                    onPressed: () => consultar(context: context),
                    text: 'Consultar',
                  ),
                ),
              ),
            ),
          ],
        ),
        const Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: EscalaPageGridWidget(),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child:
                  SaveButtonWidget(onPressed: () => salvar(context: context)),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
      ],
    );
  }

  void consultar({required BuildContext context}) =>
      BlocProvider.of<EscalaPageCubit>(context).queryOne(context: context);

  void salvar({
    required BuildContext context,
  }) =>
      BlocProvider.of<EscalaPageCubit>(context).salvar(
        context: context,
      );
}
