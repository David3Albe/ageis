import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit/kit_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_dispensado/consulta_processos_leitura_dispensado_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_dispensado/consulta_processos_leitura_dispensado_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraDispensadoPage extends StatelessWidget {
  const ConsultaProcessosLeituraDispensadoPage({
    required this.colunas,
    required this.bloc,
    required this.localInstituicaoBloc,
    required this.kitBloc,
    required this.itemFilter,
    required this.filter,
  });
  final List<CustomDataColumn> colunas;

  final ConsultaProcessosLeituraDispensadoPageCubit bloc;
  final LocalInstituicaoCubit localInstituicaoBloc;
  final KitCubit kitBloc;
  final ItemFilter itemFilter;
  final ConsultaProcessosLeituraDispensadoFilter filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterButtonWidget(
          onPressed: () => {
            openModal(context),
          },
        ),
        BlocListener<ConsultaProcessosLeituraDispensadoPageCubit,
            ConsultaProcessosLeituraDispensadoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state, context);
          },
          child: BlocBuilder<ConsultaProcessosLeituraDispensadoPageCubit,
              ConsultaProcessosLeituraDispensadoPageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: PlutoGridWidget(
                    smallRows: true,
                    columns: colunas,
                    items: state.processosLeiturasDispensados,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(
    ConsultaProcessosLeituraDispensadoPageState state,
    BuildContext context,
  ) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
          child: Column(
            children: [
              DatePickerWidget(
                placeholder: 'Data Inicio',
                onDateSelected: (value) => filter.startDate = value,
                initialValue: filter.startDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DatePickerWidget(
                placeholder: 'Data Término',
                onDateSelected: (value) => filter.finalDate = value,
                initialValue: filter.finalDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
                bloc: localInstituicaoBloc,
                builder: (context, locaisState) {
                  if (locaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<LocalInstituicaoModel> locais =
                      locaisState.locaisInstituicoes;

                  LocalInstituicaoModel? local = locais
                      .where(
                        (element) => element.cod == filter.codLocal,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<LocalInstituicaoModel>(
                    textFunction: (local) => local.LocalInstituicaoText(),
                    initialValue: local,
                    sourceList: locais,
                    onChanged: (value) => filter.codLocal = value?.cod,
                    placeholder: 'Local',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<KitCubit, List<KitModel>>(
                bloc: kitBloc,
                builder: (context, kits) {
                  KitModel? kit = kits
                      .where(
                        (element) => element.cod == filter.codKit,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<KitModel>(
                    textFunction: (kit) => kit.CodBarraDescritorText(),
                    initialValue: kit,
                    sourceList: kits,
                    onChanged: (value) => filter.codKit = value?.cod,
                    placeholder: 'Kit',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DropDownSearchApiWidget<ItemModel>(
                textFunction: (item) => item.EtiquetaDescricaoText(),
                initialValue: filter.item,
                search: (str) => ItemService().Filter(
                  itemFilter.copyWith(numeroRegistros: 30, termoPesquisa: str),
                ),
                onChanged: (value) {
                  filter.item = value;
                  filter.codItem = value?.cod;
                },
                placeholder: 'Item',
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadProcessosLeituraDispensado(filter);
      }
    });
  }
}
