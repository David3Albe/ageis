import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/cubits/remove_cubit.dart';
import 'package:compartilhados/componentes/botoes/custom_default_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FotterWidget extends StatelessWidget {
  const FotterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Spacer(),
              CustomDefaultButtonWidget(
                cor: Colors.red.shade500,
                corHovered: Colors.red.shade700,
                text: 'Remover',
                onPressed: () => context.read<RemoveCubit>().remove(context),
                icon: Icons.cancel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
