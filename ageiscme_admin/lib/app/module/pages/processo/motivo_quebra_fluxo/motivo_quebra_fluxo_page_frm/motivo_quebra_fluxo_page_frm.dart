import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/motivo_quebra_fluxo/motivo_quebra_fluxo_page_frm/motivo_quebra_fluxo_page_frm_state.dart';
import 'package:ageiscme_data/services/motivo_quebra_fluxo/motivo_quebra_fluxo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class MotivoQuebraFluxoPageFrm extends StatefulWidget {
  const MotivoQuebraFluxoPageFrm({
    Key? key,
    required this.motivoQuebraFluxo,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final MotivoQuebraFluxoModel motivoQuebraFluxo;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<MotivoQuebraFluxoPageFrm> createState() =>
      _MotivoQuebraFluxoPageFrmState(motivoQuebraFluxo: motivoQuebraFluxo);
}

class _MotivoQuebraFluxoPageFrmState extends State<MotivoQuebraFluxoPageFrm> {
  _MotivoQuebraFluxoPageFrmState({required this.motivoQuebraFluxo});
  late String titulo;
  MotivoQuebraFluxoModel motivoQuebraFluxo;
  late final MotivoQuebraFluxoPageFrmCubit cubit =
      MotivoQuebraFluxoPageFrmCubit(
    motivoQuebraFluxoModel: motivoQuebraFluxo,
    service: MotivoQuebraFluxoService(),
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      motivoQuebraFluxo.descricao = txtDescricao.text;
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
    txtDescricao.text = motivoQuebraFluxo.descricao.toString();
    titulo = 'Cadastro de Motivo de Quebra de Fluxo';
    if (motivoQuebraFluxo.cod != 0) {
      titulo =
          'Edição de Motivo de Quebra de Fluxo: ${motivoQuebraFluxo.cod} - ${motivoQuebraFluxo.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<MotivoQuebraFluxoPageFrmCubit,
        MotivoQuebraFluxoPageFrmState>(
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
                          checked: motivoQuebraFluxo.ativo,
                          onClick: (value) => motivoQuebraFluxo.ativo = value,
                          text: 'Ativo',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (motivoQuebraFluxo.cod != null &&
                          motivoQuebraFluxo.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              title:
                                  'Motivo de Quebra Fluxo ${motivoQuebraFluxo.cod}',
                              child: HistoricoPage(
                                pk: motivoQuebraFluxo.cod!,
                                termo: 'MOTIVO_QUEBRA_FLUXO',
                              ),
                              context: context,
                            ),
                          ],
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: UpdateButtonWidget(
                          readonly:
                              motivoQuebraFluxo.cod == 0 || motivoQuebraFluxo.cod == null,
                          onPressed: () => {alterarExistente()},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: InsertButtonWidget(
                          onPressed: () => {inserirNovo()},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: CleanButtonWidget(
                          onPressed: () => {
                            setState(() {
                              motivoQuebraFluxo =
                                  MotivoQuebraFluxoModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
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

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
    if (!txtDescricao.valid) return;
    cubit.save(
      novo
          ? motivoQuebraFluxo.copyWith(cod: 0, tstamp: null)
          : motivoQuebraFluxo,
      widget.onSaved,
    );
  }
}
