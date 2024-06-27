import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade_tipo/cubits/anormalidade_tipo_frm_cubit.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/save/anormalidade_tipo_save_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/reactive_forms_component/reactive_checkbox_form/reactive_checkbox_form_widget.dart';
import 'package:compartilhados/reactive_forms_component/reactive_string_form/reactive_string_form_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeTipoFrmPageWidget extends StatelessWidget {
  const AnormalidadeTipoFrmPageWidget({
    required this.onSaved,
    required this.onCancel,
    super.key,
  });
  final void Function() onSaved;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scalePadding = size.width / 1920;
    bool loading =
        context.select((AnormalidadeTipoFrmCubit cubit) => cubit.state.loading);
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
      constraints: BoxConstraints(
        minWidth: size.width * .5,
        minHeight: size.height * .5,
        maxHeight: size.height * .8,
      ),
      child: Stack(
        children: <Widget>[
          ReactiveFormBuilder(
            form: () => context.read<AnormalidadeTipoFrmCubit>().form,
            builder: (context, form, child) {
              return Column(
                children: <Widget>[
                  Row(
                    children: [
                      Builder(
                        builder: (context) {
                          AnormalidadeTipoSaveDTO? dto = context.select(
                            (AnormalidadeTipoFrmCubit cubit) =>
                                cubit.state.dtoOriginal,
                          );
                          return TitleWidget(
                            text: dto?.cod != -1 && dto?.cod != null
                                ? 'Edição do tipo de anormalidade : ${dto!.cod} ${dto.nome}'
                                : 'Criação de novo tipo de anormalidade',
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: ReactiveStringFormWidget(
                      controlName: 'nome',
                      placeholder: 'Nome *',
                      validationMessages: {
                        ValidationMessage.required: (_) => 'Obrigatório',
                        ValidationMessage.maxLength: (_) =>
                            'Número de letras permitidas são no máximo 50',
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ReactiveCheckboxFormWidget(
                            controlName: 'bloqueioEtapa',
                            placeholder:
                                'Bloquear o Equipamento da Etapa de Processo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ReactiveCheckboxFormWidget(
                            controlName: 'bloqueioItens',
                            placeholder:
                                'Bloquear os Itens Processados da Etapa de Processo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ReactiveCheckboxFormWidget(
                            controlName: 'bloqueioTotal',
                            placeholder:
                                'Bloquear os Itens Processados da Etapa de Processo e todos os subsequentes processados',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ReactiveCheckboxFormWidget(
                            controlName: 'ativo',
                            placeholder: 'Ativo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Builder(
                        builder: (context) {
                          AnormalidadeTipoSaveDTO? dto = context.select(
                            (AnormalidadeTipoFrmCubit cubit) =>
                                cubit.state.dtoOriginal,
                          );
                          return CustomPopupMenuWidget(
                            items: [
                              if (dto?.cod != null && dto?.cod != -1)
                                CustomPopupItemHistoryModel.getHistoryItem(
                                  child: HistoricoPage(
                                    pk: dto!.cod,
                                    termo: 'ANORMALIDADE_TIPO',
                                  ),
                                  context: context,
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
                            ReactiveFormConsumer(
                              builder: (context, form, child) {
                                return SaveButtonWidget(
                                  onPressed: form.valid || !form.dirty
                                      ? () => context
                                          .read<AnormalidadeTipoFrmCubit>()
                                          .salvar(
                                            context: context,
                                            onSaved: onSaved,
                                          )
                                      : null,
                                );
                              },
                            ),
                            CleanButtonWidget(
                              onPressed: context
                                  .read<AnormalidadeTipoFrmCubit>()
                                  .clear,
                            ),
                            CancelButtonUnfilledWidget(
                              onPressed: onCancel,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
