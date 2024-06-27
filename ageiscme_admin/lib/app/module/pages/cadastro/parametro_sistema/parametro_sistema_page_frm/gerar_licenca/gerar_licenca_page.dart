import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/cubits/gerar_licenca_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/cubits/licenca_gerada_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/page/gerar_licenca_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class GerarLicencaPage extends StatelessWidget {
  const GerarLicencaPage({
    required this.onSaved,
    Key? key,
  }) : super(key: key);

  final void Function(String) onSaved;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Row(
          children: [
            const TitleWidget(
              text: 'Gerar Licença',
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 600,
                    maxWidth: 1200,
                    minHeight: 600,
                    maxHeight: 1000,
                  ),
                  height: size.height * 0.8,
                  width: size.width * 0.65,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => GerarLicencaCubit(),
                      ),
                      BlocProvider(
                        create: (context) => LicencaGeradaCubit(),
                      ),
                    ],
                    child: GerarLicencaWidget(onSaved: onSaved),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
