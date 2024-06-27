import 'package:ageiscme_admin/app/module/pages/material/item_descritor/cubits/item_descritor_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/filter/item_descritor_page_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_state.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemDescritorButtonFilterWidget extends StatelessWidget {
  const ItemDescritorButtonFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    ItemDescritorCubitFilter filterCubit =
        context.read<ItemDescritorCubitFilter>();
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => BlocProvider<ItemDescritorCubitFilter>.value(
        value: filterCubit,
        child: ItemDescritorPageFilter(),
      ),
    );
    if (confirm != true) return;
    ItemDescritorPageCubit cubit = context.read<ItemDescritorPageCubit>();
    filterCubit = context.read<ItemDescritorCubitFilter>();
    ItemDescritorFilter dto = filterCubit.state;
    await cubit.getScreenData(dto);
  }
}
