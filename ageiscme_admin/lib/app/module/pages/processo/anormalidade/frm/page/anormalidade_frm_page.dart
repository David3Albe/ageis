import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/cubits/anormalidade_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/states/anormalidade_frm_state.dart';
import 'package:ageiscme_data/services/anormalidade_tipo/anormalidade_tipo_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/anormalidade/save/anormalidade_save_dto.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/short/anormalidade_tipo_short_dto.dart';
import 'package:ageiscme_models/dto/item/drop_down_search/item_drop_down_search_dto.dart';
import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/short/anormalidade_tipo_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/drop_down_search/item_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/processo_registro/ultimo/processo_registro_ultimo_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_selectable_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_controller_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeFrmPageWidget extends StatelessWidget {
  const AnormalidadeFrmPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scalePadding = size.width / 1920;
    bool loading =
        context.select((AnormalidadeFrmCubit cubit) => cubit.state.loading);
    if (loading == true) {
      return Container(
        constraints: BoxConstraints(
          minWidth: size.width * .5,
          minHeight: size.height * .5,
          maxHeight: size.height * .8,
        ),
        child: const Center(
          child: LoadingWidget(),
        ),
      );
    }

    return Container(
      constraints: const BoxConstraints(
        minWidth: 500,
        maxWidth: 1500,
        minHeight: 500,
        maxHeight: 1200,
      ),
      height: size.height * .8,
      width: size.width * .5,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Builder(
                builder: (context) {
                  AnormalidadeSaveDTO? dto = context.select(
                    (AnormalidadeFrmCubit cubit) => cubit.state.dtoOriginal,
                  );
                  return TitleWidget(
                    text: dto?.cod != 0 && dto?.cod != null
                        ? 'Edição do registro de anormalidade : ${dto!.cod} ${dto.usuario?.nome ?? ''}'
                        : 'Criação de novo registro de anormalidade',
                  );
                },
              ),
              const Spacer(),
              CloseButtonWidget(
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child:
                          BlocBuilder<ProcessoEtapaCubit, ProcessoEtapaState>(
                        builder: (context, state) {
                          if (state.loading) return const LoadingWidget();
                          List<ProcessoEtapaModel> processosEtapas =
                              state.processosEtapas;

                          processosEtapas.sort(
                            (a, b) => a.tipoProcesso!.nome
                                .compareTo(b.tipoProcesso!.nome),
                          );

                          return BlocBuilder<AnormalidadeFrmCubit,
                              AnormalidadeFrmState>(
                            builder: (context, anormalidadeState) {
                              int? codEtapaSelecionada =
                                  anormalidadeState.dto?.codProcessoEtapa;
                              bool itemSelecionado =
                                  anormalidadeState.dto?.codItem != null;
                              return DropDownSearchWidget<ProcessoEtapaModel>(
                                maxItems: 200,
                                readOnly: itemSelecionado ||
                                    (anormalidadeState.dto?.cod ?? 0) > 0,
                                initialValue: processosEtapas
                                    .where(
                                      (element) =>
                                          element.cod == codEtapaSelecionada,
                                    )
                                    .firstOrNull,
                                textFunction: (processoEtapa) =>
                                    processoEtapa.GetNomeEtapaTipoText(),
                                sourceList: processosEtapas
                                    .where((element) => element.ativo == true)
                                    .toList(),
                                onChanged: (etapa) =>
                                    BlocProvider.of<AnormalidadeFrmCubit>(
                                  context,
                                ).changeEtapa(
                                  context: context,
                                  etapa: etapa,
                                ),
                                placeholder: 'Etapa do Processo',
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: BlocBuilder<AnormalidadeFrmCubit,
                          AnormalidadeFrmState>(
                        builder: (context, state) {
                          AnormalidadeFrmState anormalidadeState =
                              BlocProvider.of<AnormalidadeFrmCubit>(context)
                                  .state;
                          bool etapaSelecionada =
                              anormalidadeState.dto?.codProcessoEtapa != null;
                          return CustomAutocompleteSelectableWidget<
                              ItemDropDownSearchResponseDTO>(
                            initialValue: state.dto?.item,
                            readonly:
                                etapaSelecionada || (state.dto?.cod ?? 0) > 0,
                            onSelected: (item) =>
                                BlocProvider.of<AnormalidadeFrmCubit>(context)
                                    .changeItem(context: context, item: item),
                            selectedText: (item) => item.idEtiqueta,
                            label: 'Item',
                            title: (p0) => Text(p0.IdEtiquetaDescricao()),
                            suggestionsCallback: (str) async =>
                                (await ItemService().dropDownSearch(
                                  ItemDropDownSearchDTO(
                                    numeroRegistros: 30,
                                    termoPesquisa: str,
                                  ),
                                ))
                                    ?.$2 ??
                                [],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: BlocBuilder<AnormalidadeFrmCubit,
                          AnormalidadeFrmState>(
                        builder: (context, state) {
                          ProcessoRegistroUltimoResponseDTO? registro =
                              state.dto?.processoRegistro;
                          String processo = registro?.cod != null
                              ? 'Reg.: ${registro!.cod ?? ''} / Etapa: ${registro.nomeEtapa ?? ''}'
                              : '';
                          return TextFieldStringWidget(
                            readOnly: true,
                            placeholder: 'Processo',
                            initialValue: processo,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: BlocBuilder<AnormalidadeFrmCubit,
                          AnormalidadeFrmState>(
                        builder: (context, state) {
                          DateFormat format = DateFormat('dd/MM/yyyy HH:mm');
                          DateTime? dataInicio =
                              state.dto?.processoRegistro?.dataHoraInicio;
                          DateTime? dataFim =
                              state.dto?.processoRegistro?.dataHoraTermino;
                          String strDataInicio = dataInicio == null
                              ? ''
                              : format.format(dataInicio);
                          String strDataFim =
                              dataFim == null ? '' : format.format(dataFim);
                          return Row(
                            children: [
                              Expanded(
                                child: TextFieldStringWidget(
                                  readOnly: true,
                                  initialValue: strDataInicio,
                                  placeholder: 'Início',
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 36,
                                ),
                              ),
                              Expanded(
                                child: TextFieldStringWidget(
                                  readOnly: true,
                                  placeholder: 'Término',
                                  initialValue: strDataFim,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: BlocBuilder<AnormalidadeFrmCubit,
                          AnormalidadeFrmState>(
                        builder: (context, state) =>
                            CustomAutocompleteSelectableWidget<
                                AnormalidadeTipoShortResponseDTO>(
                          initialValue: state.dto?.anormalidadeTipo,
                          onSelected:
                              BlocProvider.of<AnormalidadeFrmCubit>(context)
                                  .changeTipoAnormalidade,
                          selectedText: (item) => item.Nome(),
                          readonly: (state.dto?.cod ?? 0) > 0,
                          label: 'Tipo de Anormalidade',
                          title: (p0) => Text(p0.Nome()),
                          suggestionsCallback: (str) async =>
                              (await Modular.get<AnormalidadeTipoService>()
                                      .short(
                                AnormalidadeTipoShortDTO(
                                  numeroRegistros: 30,
                                  termoPesquisa: str,
                                ),
                              ))
                                  ?.$2 ??
                              [],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: Builder(
                        builder: (context) {
                          return BlocBuilder<AnormalidadeFrmCubit,
                              AnormalidadeFrmState>(
                            buildWhen: (previous, current) =>
                                previous.dto?.descricao !=
                                current.dto?.descricao,
                            builder: (context, state) =>
                                TextFieldStringAreaControllerWidget(
                              validators: [
                                (str) => str.length > 400
                                    ? 'Máximo 400 Caractéres'
                                    : '',
                              ],
                              placeholder: 'Descrição',
                              controller: TextEditingController(
                                text: state.dto?.descricao,
                              ),
                              onChanged:
                                  BlocProvider.of<AnormalidadeFrmCubit>(context)
                                      .changeDescription,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: Builder(
                        builder: (context) {
                          return BlocBuilder<AnormalidadeFrmCubit,
                              AnormalidadeFrmState>(
                            buildWhen: (previous, current) =>
                                previous.dto?.usuario?.nome !=
                                    current.dto?.usuario?.nome ||
                                previous.dto?.dataHora != current.dto?.dataHora,
                            builder: (context, state) => Row(
                              children: [
                                Expanded(
                                  child: TextFieldStringWidget(
                                    readOnly: true,
                                    placeholder: 'Usuario',
                                    initialValue: state.dto?.usuario?.nome,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 36,
                                  ),
                                ),
                                Expanded(
                                  child: DatePickerWidget(
                                    readOnly: true,
                                    placeholder: 'Data Hora',
                                    initialValue: state.dto?.dataHora,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: BlocBuilder<AnormalidadeFrmCubit,
                          AnormalidadeFrmState>(
                        buildWhen: (previous, current) =>
                            previous.dto?.observacaoLiberacao !=
                            current.dto?.observacaoLiberacao,
                        builder: (context, state) =>
                            TextFieldStringAreaControllerWidget(
                          readOnly: true,
                          validators: [
                            (str) =>
                                str.length > 400 ? 'Máximo 400 Caractéres' : '',
                          ],
                          placeholder: 'Observações da Liberação',
                          controller: TextEditingController(
                            text: state.dto?.observacaoLiberacao,
                          ),
                          onChanged:
                              BlocProvider.of<AnormalidadeFrmCubit>(context)
                                  .changeObservacaoLiberacao,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: Builder(
                        builder: (context) {
                          return BlocBuilder<AnormalidadeFrmCubit,
                              AnormalidadeFrmState>(
                            builder: (context, state) => Row(
                              children: [
                                Expanded(
                                  child: TextFieldStringWidget(
                                    readOnly: true,
                                    placeholder:
                                        'Usuario Responsável Liberação',
                                    initialValue:
                                        state.dto?.usuarioLiberacao?.nome,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 36,
                                  ),
                                ),
                                Expanded(
                                  child: DatePickerWidget(
                                    readOnly: true,
                                    placeholder: 'Data Hora Liberação',
                                    initialValue: state.dto?.dataLiberacao,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Builder(
                builder: (context) {
                  AnormalidadeSaveDTO? dto = context.select(
                    (AnormalidadeFrmCubit cubit) => cubit.state.dtoOriginal,
                  );
                  return CustomPopupMenuWidget(
                    items: [
                      if (dto?.cod != null && dto?.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: dto!.cod,
                            termo: 'ANORMALIDADE',
                          ),
                          context: context,
                        ),
                      if (dto?.cod != null &&
                          dto?.cod != 0 &&
                          dto?.codUsuarioLiberacao == null)
                        CustomPopupItemModel(
                          text: 'Liberar',
                          onTap: () =>
                              BlocProvider.of<AnormalidadeFrmCubit>(context)
                                  .liberar(
                            context: context,
                          ),
                        ),
                    ],
                  );
                },
              ),
              Expanded(
                child: Wrap(
                  runSpacing: 16 * scalePadding,
                  spacing: 16 * scalePadding,
                  alignment: WrapAlignment.end,
                  children: [
                    SaveButtonWidget(
                      onPressed: () =>
                          BlocProvider.of<AnormalidadeFrmCubit>(context)
                              .salvar(context: context),
                    ),
                    CleanButtonWidget(
                      onPressed:
                          BlocProvider.of<AnormalidadeFrmCubit>(context).clear,
                    ),
                    CancelButtonUnfilledWidget(
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
