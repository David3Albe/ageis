import 'package:ageiscme_admin/app/module/pages/material/kit/cubits/kit_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/filter/kit_page_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_state.dart';
import 'package:ageiscme_models/dto/kit/kit_search/kit_search_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitButtonFilterWidget extends StatelessWidget {
  const KitButtonFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    KitCubitFilter filterCubit = context.read<KitCubitFilter>();
    bool? result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<KitCubitFilter>.value(
          value: filterCubit,
          child: KitPageFilter(),
        );
      },
    );
    if (result != true) return;
    KitPageCubit kitCubit = context.read<KitPageCubit>();
    filterCubit = context.read<KitCubitFilter>();
    KitSearchDTO dto = filterCubit.state;
    await kitCubit.searchKits(dto);
  }
}
