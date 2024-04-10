import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/widgets/leituras/resumo/leitura_resumo_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/search_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LeiturasResumoWidget extends StatelessWidget {
  const LeiturasResumoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchState state = context.watch<SearchCubit>().state;

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: ListView(
        children: state.response?.leituras
                .map(
                  (leitura) => LeituraResumoWidget(leitura: leitura),
                )
                .toList() ??
            [],
      ),
    );
  }
}
