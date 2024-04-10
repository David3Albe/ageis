import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/widgets/cancelar_leituras/cancelar_leituras_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/widgets/filter/filter_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/widgets/leituras/leituras_widget.dart';
import 'package:flutter/material.dart';

class CancelamentoPreparoPageWidget extends StatelessWidget {
  const CancelamentoPreparoPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FilterWidget(),
            Spacer(),
            CancelarLeiturasWidget(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 4),
        ),
        Expanded(child: LeiturasWidget()),
      ],
    );
  }
}
