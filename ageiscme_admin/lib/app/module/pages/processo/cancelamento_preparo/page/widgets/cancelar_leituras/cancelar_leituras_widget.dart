import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/cancel_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/search_state.dart';
import 'package:compartilhados/componentes/botoes/default_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CancelarLeiturasWidget extends StatelessWidget {
  const CancelarLeiturasWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchState state = context.watch<SearchCubit>().state;
    bool readonly = state.response == null || state.response!.leituras.isEmpty;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: DefaultButtonWidget(
        cor: Colors.red.shade500,
        corHovered: Colors.red.shade700,
        icon: Icons.cancel,
        text: 'Cancelar Leituras',
        readonly: readonly,
        onPressed: () => context.read<CancelCubit>().cancel(context),
      ),
    );
  }
}
