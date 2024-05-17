import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/generate_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/readonly_cubit.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_dto.dart';
import 'package:compartilhados/componentes/botoes/custom_default_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EtiquetaWidget extends StatelessWidget {
  const EtiquetaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextFieldStringWidget txtEtiqueta = TextFieldStringWidget(
      placeholder: 'ID Etiqueta',
      initialValue: context.read<GenerateCubit>().state.dto.idEtiqueta,
      readOnly: context.select(
        (ReadonlyCubit readonly) => readonly.state.txtEtiquetaReadonly,
      ),
      onChanged: (str) {
        GenerateCubit cubit = context.read<GenerateCubit>();
        ItemInserirRapidoGerarInserirDTO dto = cubit.state.dto;
        dto.idEtiqueta = str;
        cubit.setDTO(dto);
      },
    );
    context.read<GenerateCubit>().setTxtEtiqueta(
          txtEtiqueta,
        );
    return Row(
      children: [
        Expanded(child: txtEtiqueta),
        Visibility(
          visible: context.select(
            (ReadonlyCubit readonlyCubit) =>
                readonlyCubit.state.botaoInserirVisible,
          ),
          child: Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CustomDefaultButtonWidget(
                readonly: context.select(
                  (GenerateCubit generateCubit) => generateCubit.state.loading,
                ),
                text: 'Inserir',
                onPressed: () =>
                    context.read<GenerateCubit>().gerarInserir(context),
                cor: Colors.grey.shade500,
                corHovered: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
