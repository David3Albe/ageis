import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/registros_popup_page_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class RegistrosPopupPage extends StatelessWidget {
  const RegistrosPopupPage({
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
      child: RegistrosPopupPageWidget(onClose: onClose),
    );
  }
}
