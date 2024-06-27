import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/cubits/kit_descritor_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/filter/kit_descritor_page_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/kit_descritor_page_state.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitDescritorButtonFilterWidget extends StatelessWidget {
  const KitDescritorButtonFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    KitDescritorCubitFilter filterCubit =
        context.read<KitDescritorCubitFilter>();
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => BlocProvider<KitDescritorCubitFilter>.value(
        value: filterCubit,
        child: KitDescritorPageFilter(
        ),
      ),
    );
    if (confirm != true) return;
    KitDescritorPageCubit kitCubit = context.read<KitDescritorPageCubit>();
    filterCubit = context.read<KitDescritorCubitFilter>();
    KitDescritorFilter dto = filterCubit.state;
    await kitCubit.getScreenData(dto);
  }
}
