import 'package:ageiscme_admin/app/module/pages/colaborador/turno/cubits/sigla_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_models/dto/turno/save/turno_save_dto.dart';
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

class TurnoFrmPageWidget extends StatelessWidget {
  const TurnoFrmPageWidget({
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
    bool loading = context.select((TurnoFrmCubit cubit) => cubit.state.loading);
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
            form: () => context.read<TurnoFrmCubit>().form,
            builder: (context, form, child) {
              return Column(
                children: <Widget>[
                  Row(
                    children: [
                      Builder(
                        builder: (context) {
                          TurnoSaveDTO? dto = context.select(
                            (TurnoFrmCubit cubit) => cubit.state.dtoOriginal,
                          );
                          return TitleWidget(
                            text: dto?.cod != -1 && dto?.cod != null
                                ? 'Edição de Turno : ${dto!.cod} - ${dto.descricao}'
                                : 'Criação de novo Turno',
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: ReactiveStringFormWidget(
                      controlName: 'descricao',
                      placeholder: 'Descrição *',
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
                          TurnoSaveDTO? dto = context.select(
                            (TurnoFrmCubit cubit) => cubit.state.dtoOriginal,
                          );
                          return CustomPopupMenuWidget(
                            items: [
                              if (dto?.cod != null && dto?.cod != -1)
                                CustomPopupItemHistoryModel.getHistoryItem(
                                  child: HistoricoPage(
                                    pk: dto!.cod,
                                    termo: 'TURNO',
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
                            SaveButtonWidget(
                              onPressed: () => context
                                  .read<TurnoFrmCubit>()
                                  .salvar(context: context, onSaved: onSaved),
                            ),
                            CleanButtonWidget(
                              onPressed: context.read<TurnoFrmCubit>().clear,
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