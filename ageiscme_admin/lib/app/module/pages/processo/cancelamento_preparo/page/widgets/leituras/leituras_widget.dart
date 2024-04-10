import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/widgets/leituras/resumo/leituras_resumo_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/widgets/leituras/selecionado/leitura_selecionada_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/search_state.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LeiturasWidget extends StatelessWidget {
  const LeiturasWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchState cubit = context.watch<SearchCubit>().state;
    if (cubit.loading == true) {
      return const Center(
        child: LoadingWidget(),
      );
    }
    return const Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Expanded(child: LeiturasResumoWidget()),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                ),
                Expanded(flex: 3, child: LeituraSelecionadaWidget()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
