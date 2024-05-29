import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/generate_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/readonly_cubit.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_dto.dart';
import 'package:compartilhados/componentes/botoes/custom_default_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class QuantidadeWidget extends StatelessWidget {
  const QuantidadeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextFieldNumberWidget txtQuantidade = TextFieldNumberWidget(
      readOnly: context.select(
        (ReadonlyCubit cubit) => cubit.state.txtQuantidadeReadonly,
      ),
      placeholder: 'Quantidade',
      startValue: context.read<GenerateCubit>().state.dto.quantidade,
      onChanged: (String? str) {
        GenerateCubit cubit = context.read<GenerateCubit>();
        ItemInserirRapidoGerarInserirDTO dto = cubit.state.dto;
        dto.quantidade = str == null ? null : int.parse(str);
        cubit.setDTO(dto);
      },
    );
    context.read<GenerateCubit>().setTxtQuantidade(txtQuantidade);

    return Row(
      children: [
        Expanded(
          child: txtQuantidade,
        ),
        Visibility(
          visible: context.select(
            (ReadonlyCubit cubit) => cubit.state.botaoGerarVisible,
          ),
          child: Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: CustomDefaultButtonWidget(
                readonly: context.select(
                  (GenerateCubit cubit) => cubit.state.loading,
                ),
                text: 'Gerar',
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
