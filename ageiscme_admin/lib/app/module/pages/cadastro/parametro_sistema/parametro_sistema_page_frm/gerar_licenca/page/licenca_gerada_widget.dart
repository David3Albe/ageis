import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/cubits/licenca_gerada_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/states/licenca_gerada_state.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_controller_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LicencaGeradaWidget extends StatelessWidget {
  const LicencaGeradaWidget({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return BlocListener<LicencaGeradaCubit, LicencaGeradaState>(
      listener: (context, state) {
        _controller.text = state.licencaGerada?.licenca ?? '';
      },
      child: TextFieldStringAreaControllerWidget(
        readOnly: true,
        placeholder: 'Licença',
        controller: _controller,
      ),
    );
  }
}
