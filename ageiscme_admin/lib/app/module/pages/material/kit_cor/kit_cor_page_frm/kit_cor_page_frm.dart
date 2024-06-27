import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_cor/kit_cor_page_frm/kit_cor_page_frm_state.dart';
import 'package:ageiscme_data/services/kit_cor/kit_cor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitCorPageFrm extends StatefulWidget {
  const KitCorPageFrm({
    Key? key,
    required this.kitCor,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final KitCorModel kitCor;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<KitCorPageFrm> createState() => _KitCorPageFrmState(kitCor: kitCor);
}

class _KitCorPageFrmState extends State<KitCorPageFrm> {
  _KitCorPageFrmState({required this.kitCor});
  late String titulo;
  KitCorModel kitCor;
  late final KitCorPageFrmCubit cubit = KitCorPageFrmCubit(
    kitCorModel: kitCor,
    service: KitCorService(),
  );
  late final TextFieldStringWidget txtNomeCor = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      kitCor.nome = txtNomeCor.text;
    },
  );
  late final TextFieldNumberWidget txtCorRed = TextFieldNumberWidget(
    placeholder: 'Red *',
    onChanged: (String str) {
      kitCor.red = str.isEmpty ? null : int.parse(str);
    },
  );
  late final TextFieldNumberWidget txtCorGreen = TextFieldNumberWidget(
    placeholder: 'Green *',
    onChanged: (String str) {
      kitCor.green = str.isEmpty ? null : int.parse(str);
    },
  );
  late final TextFieldNumberWidget txtCorBlue = TextFieldNumberWidget(
    placeholder: 'Blue *',
    onChanged: (String str) {
      kitCor.blue = str.isEmpty ? null : int.parse(str);
    },
  );

  @override
  void initState() {
    txtNomeCor.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 20) {
        return 'Pode ter no máximo 20 caracteres';
      }
      return '';
    });

    txtCorRed.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (int.parse(str) > 255) {
        return 'Red deve ser no máximo 255';
      } else if (int.parse(str) < 0) {
        return 'Red deve ser no mínimo 0';
      }
      return '';
    });

    txtCorGreen.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (int.parse(str) > 255) {
        return 'Green deve ser no máximo 255';
      } else if (int.parse(str) < 0) {
        return 'Green deve ser no mínimo 0';
      }
      return '';
    });

    txtCorBlue.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (int.parse(str) > 255) {
        return 'Blue deve ser no máximo 255';
      } else if (int.parse(str) < 0) {
        return 'Blue deve ser no mínimo 0';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtNomeCor.text = kitCor.nome.toString();
    if (kitCor.red == null) {
      txtCorRed.text = '';
    } else {
      txtCorRed.text = kitCor.red.toString();
    }
    if (kitCor.green == null) {
      txtCorGreen.text = '';
    } else {
      txtCorGreen.text = kitCor.green.toString();
    }
    if (kitCor.blue == null) {
      txtCorBlue.text = '';
    } else {
      txtCorBlue.text = kitCor.blue.toString();
    }
    titulo = 'Cadastro de Cor de Kit';
    if (kitCor.cod != 0) {
      titulo = 'Edição de Cor de Kit: ${kitCor.cod} - ${kitCor.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<KitCorPageFrmCubit, KitCorPageFrmState>(
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
                    padding: const EdgeInsets.only(top: 7.0),
                    child: txtNomeCor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: txtCorRed,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: txtCorGreen,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: txtCorBlue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: kitCor.ativo,
                          onClick: (value) => kitCor.ativo = value,
                          text: 'Ativo',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (kitCor.cod != null && kitCor.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              child: HistoricoPage(
                                pk: kitCor.cod!,
                                termo: 'KIT_COR',
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
                              kitCor = KitCorModel.empty();
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
    bool nomeCorValid = txtNomeCor.valid;
    bool corGreenValid = txtCorGreen.valid;
    bool corRedValid = txtCorRed.valid;
    bool corBlueValid = txtCorBlue.valid;
    if (!nomeCorValid || !corGreenValid || !corRedValid || !corBlueValid) {
      return;
    }
    cubit.save(kitCor, widget.onSaved);
  }
}
