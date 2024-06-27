import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/motivo_remover_repor_item/motivo_remover_repor_item_page_frm/motivo_remover_repor_item_page_frm_state.dart';
import 'package:ageiscme_data/services/motivo_remover_repor_item/motivo_remover_repor_item_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class MotivoRemoverReporItemPageFrm extends StatefulWidget {
  const MotivoRemoverReporItemPageFrm({
    Key? key,
    required this.motivoRemoverReporItem,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final MotivoRemoverReporItemModel motivoRemoverReporItem;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<MotivoRemoverReporItemPageFrm> createState() =>
      _MotivoRemoverReporItemPageFrmState(
        motivoRemoverReporItem: motivoRemoverReporItem,
      );
}

class _MotivoRemoverReporItemPageFrmState
    extends State<MotivoRemoverReporItemPageFrm> {
  _MotivoRemoverReporItemPageFrmState({required this.motivoRemoverReporItem});
  late String titulo;
  MotivoRemoverReporItemModel motivoRemoverReporItem;
  late final MotivoRemoverReporItemPageFrmCubit cubit =
      MotivoRemoverReporItemPageFrmCubit(
    motivoRemoverReporItemModel: motivoRemoverReporItem,
    service: MotivoRemoverReporItemService(),
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      motivoRemoverReporItem.descricao = txtDescricao.text;
    },
  );

  @override
  void initState() {
    txtDescricao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtDescricao.text = motivoRemoverReporItem.descricao.toString();
    titulo = 'Cadastro de Motivo Remover / Repor Item';
    if (motivoRemoverReporItem.cod != 0) {
      titulo =
          'Edição de Motivo Remover / Repor Item: ${motivoRemoverReporItem.cod} - ${motivoRemoverReporItem.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<MotivoRemoverReporItemPageFrmCubit,
        MotivoRemoverReporItemPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(
            minWidth: size.width * .5,
            minHeight: size.height * .5,
            maxHeight: size.height * .8,
          ),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: TitleWidget(
                          text: titulo,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtDescricao,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: motivoRemoverReporItem.ativo,
                          onClick: (value) =>
                              motivoRemoverReporItem.ativo = value,
                          text: 'Ativo',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: motivoRemoverReporItem.remover,
                          onClick: (value) =>
                              motivoRemoverReporItem.remover = value,
                          text: 'Remover Item',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: motivoRemoverReporItem.repor,
                          onClick: (value) =>
                              motivoRemoverReporItem.repor = value,
                          text: 'Repor Item',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (motivoRemoverReporItem.cod != null &&
                          motivoRemoverReporItem.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              child: HistoricoPage(
                                pk: motivoRemoverReporItem.cod!,
                                termo: 'MOTIVO_REMOVER_REPOR_ITEM',
                              ),
                              context: context,
                            ),
                          ],
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SaveButtonWidget(
                          onPressed: () => {salvar()},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: CleanButtonWidget(
                          onPressed: () => {
                            setState(() {
                              motivoRemoverReporItem =
                                  MotivoRemoverReporItemModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: CancelButtonUnfilledWidget(
                          onPressed: widget.onCancel,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void salvar() {
    if (!txtDescricao.valid) return;
    cubit.save(motivoRemoverReporItem, widget.onSaved);
  }
}
