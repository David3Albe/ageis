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
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class FilterFormWidget extends StatelessWidget {
  FilterFormWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    late bool Function() validateItem;
    late bool Function() validateKit;

    FilterState state =
        BlocProvider.of<FilterCubit>(context, listen: true).state;
    return FilterDialogWidget(
      validate: () => (validateItem() && validateKit()) == true,
      child: Column(
        children: [
          DropDownSearchApiWidget<ItemModel>(
            validateBuilder: (context, validateMethodBuilder) =>
                validateItem = validateMethodBuilder,
            validator: (val) {
              KitDropDownSearchResponseDTO? kit =
                  BlocProvider.of<FilterCubit>(context).state.kit;
              if (val != null && kit != null) {
                return 'Não é possível filtrar kit e item ao mesmo tempo, escolha apenas 1.';
              }
              return null;
            },
            textFunction: (item) => item.EtiquetaDescricaoText(),
            initialValue: state.item,
            search: (str) => Modular.get<ItemService>().Filter(
              ItemFilter(
                numeroRegistros: 35,
                termoPesquisa: str,
              ),
            ),
            onChanged: (value) {
              BlocProvider.of<FilterCubit>(context).setItem(value);
              validateKit();
            },
            placeholder: 'Item',
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          DropDownSearchApiWidget<KitDropDownSearchResponseDTO>(
            validateBuilder: (context, validateMethodBuilder) =>
                validateKit = validateMethodBuilder,
            textFunction: (kit) => kit.CodBarraDescritorText(),
            initialValue: state.kit,
            validator: (val) {
              ItemModel? item =
                  BlocProvider.of<FilterCubit>(context).state.item;
              if (val != null && item != null) {
                return 'Não é possível filtrar kit e item ao mesmo tempo, escolha apenas 1.';
              }
              return null;
            },
            search: (str) async =>
                (await Modular.get<KitService>().getDropDownSearchKits(
                  KitDropDownSearchDTO(
                    numeroRegistros: 35,
                    search: str,
                  ),
                ))
                    ?.$2 ??
                [],
            onChanged: (value) {
              BlocProvider.of<FilterCubit>(context).setKit(value);
              validateItem();
            },
            placeholder: 'Kit',
          ),
        ],
      ),
    );
  }
}
