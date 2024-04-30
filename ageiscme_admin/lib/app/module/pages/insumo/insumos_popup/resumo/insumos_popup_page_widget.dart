import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/widgets/grid/grid_widget.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/widgets/header/header_widget.dart';
import 'package:flutter/material.dart';

class InsumoPopupPageWidget extends StatelessWidget {
  const InsumoPopupPageWidget({
    required this.onClose,
    Key? key,
  }) : super(key: key);

  final Function() onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(),
        GridWidget(onClose: onClose),
      ],
    );
  }
}
