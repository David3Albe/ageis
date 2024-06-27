import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/filter_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FilterFormWidget extends StatelessWidget {
  FilterFormWidget({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    FilterState state = BlocProvider.of<FilterCubit>(context).state;
    return FilterDialogWidget(
      child: Column(
        children: [
          CustomAutocompleteWidget<ItemModel>(
            initialValue: state.idEtiqueta,
            onChange: (str) {
              BlocProvider.of<FilterCubit>(context).setItem(str);
            },
            onItemSelectedText: (item) => item.idEtiqueta ?? null,
            label: 'Item',
            title: (p0) => Text(p0.EtiquetaDescricaoText()),
            suggestionsCallback: (str) => ItemService().Filter(
              ItemFilter(numeroRegistros: 30, termoPesquisa: str),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          CustomAutocompleteWidget<KitDropDownSearchResponseDTO>(
            initialValue: state.codBarraKit,
            onChange: (str) {
              BlocProvider.of<FilterCubit>(context).setKit(str);
            },
            onItemSelectedText: (kit) => kit.codBarra,
            label: 'Kit',
            title: (p0) => Text(p0.CodBarraDescritorText()),
            suggestionsCallback: (str) async {
              return (await KitService().getDropDownSearchKits(
                    KitDropDownSearchDTO(
                      search: str,
                      numeroRegistros: 30,
                    ),
                  ))
                      ?.$2 ??
                  [];
            },
          ),
        ],
      ),
    );
  }
}
