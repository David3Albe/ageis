import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/destino_residuo/destino_residuo_page_frm/destino_residuo_page_frm_state.dart';
import 'package:ageiscme_data/services/destino_residuo/destino_residuo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class DestinoResiduoPageFrm extends StatefulWidget {
  const DestinoResiduoPageFrm({
    Key? key,
    required this.destinoResiduo,
  }) : super(key: key);

  final DestinoResiduoModel destinoResiduo;

  @override
  State<DestinoResiduoPageFrm> createState() =>
      _DestinoResiduoPageFrmState(destinoResiduo: destinoResiduo);
}

class _DestinoResiduoPageFrmState extends State<DestinoResiduoPageFrm> {
  _DestinoResiduoPageFrmState({required this.destinoResiduo});
  late String titulo;
  DestinoResiduoModel destinoResiduo;
  late final DestinoResiduoPageFrmCubit cubit = DestinoResiduoPageFrmCubit(
    destinoResiduoModel: destinoResiduo,
    service: DestinoResiduoService(),
  );
  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      destinoResiduo.nome = txtNome.text;
    },
  );

  @override
  void initState() {
    txtNome.addValidator((String str) {
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
    txtNome.text = destinoResiduo.nome.toString();
    titulo = 'Cadastro de Destino de Resíduo';
    if (destinoResiduo.cod != 0) {
      titulo =
          'Edição de Destino de Resíduo: ${destinoResiduo.cod} - ${destinoResiduo.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<DestinoResiduoPageFrmCubit, DestinoResiduoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
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
                      const Spacer(),
                      CloseButtonWidget(
                        onPressed: () => Navigator.of(context).pop((false, '')),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtNome,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: destinoResiduo.ativo,
                          onClick: (value) => destinoResiduo.ativo = value,
                          text: 'Ativo',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomPopupMenuWidget(
                        items: [
                          if (destinoResiduo.cod != null &&
                              destinoResiduo.cod != 0)
                            CustomPopupItemHistoryModel.getHistoryItem(
                              child: HistoricoPage(
                                pk: destinoResiduo.cod!,
                                termo: 'DESTINO_RESIDUO',
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
                              destinoResiduo = DestinoResiduoModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: CancelButtonUnfilledWidget(
                          onPressed: () =>
                              {Navigator.of(context).pop((false, ''))},
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
    if (!txtNome.valid) return;
    cubit.save(destinoResiduo);
  }
}
