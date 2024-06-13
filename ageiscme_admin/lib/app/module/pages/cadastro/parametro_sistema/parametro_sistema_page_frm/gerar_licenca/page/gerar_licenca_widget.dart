import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/cubits/gerar_licenca_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/cubits/licenca_gerada_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/page/gerar_licenca_campos_widget.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/page/licenca_gerada_widget.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/states/licenca_gerada_state.dart';
import 'package:compartilhados/componentes/botoes/default_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class GerarLicencaWidget extends StatelessWidget {
  const GerarLicencaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GerarLicencaCamposWidget(),
        const Padding(
          padding: EdgeInsets.only(top: 6),
        ),
        Row(
          children: [
            DefaultButtonWidget(
              text: 'Gerar',
              onPressed: () =>
                  context.read<GerarLicencaCubit>().gerar(context: context),
              cor: Colors.lightGreen.shade400,
              corHovered: Colors.lightGreen.shade600,
              icon: Symbols.create,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            BlocBuilder<LicencaGeradaCubit, LicencaGeradaState>(
              builder: (context, state) {
                return DefaultButtonWidget(
                  readonly: state.licencaGerada == null,
                  text: 'Copiar Licença',
                  onPressed: () => context
                      .read<LicencaGeradaCubit>()
                      .copiar(context: context),
                  cor: Colors.lightBlue.shade400,
                  corHovered: Colors.lightBlue.shade600,
                  icon: Symbols.copy_all,
                );
              },
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 6),
        ),
        const LicencaGeradaWidget(),
      ],
    );
  }
}
