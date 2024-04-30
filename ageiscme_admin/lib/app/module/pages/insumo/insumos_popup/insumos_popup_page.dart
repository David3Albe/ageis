import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/insumos_popup_page_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class InsumosPopupPage extends StatelessWidget {
  const InsumosPopupPage({
    required this.cubit,
    required this.onClose,
    Key? key,
  }) : super(key: key);
  final SearchCubit cubit;
  final Function() onClose;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
      ],
      child: InsumoPopupPageWidget(onClose: onClose),
    );
  }
}
