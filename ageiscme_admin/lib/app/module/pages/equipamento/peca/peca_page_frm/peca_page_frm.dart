import 'package:ageiscme_admin/app/module/pages/equipamento/peca/peca_page_frm/peca_page_frm_state.dart';
import 'package:ageiscme_data/services/peca/peca_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class PecaPageFrm extends StatefulWidget {
  const PecaPageFrm({
    Key? key,
    required this.peca,
  }) : super(key: key);

  final PecaModel peca;

  @override
  State<PecaPageFrm> createState() => _PecaPageFrmState(peca: peca);
}

class _PecaPageFrmState extends State<PecaPageFrm> {
  _PecaPageFrmState({required this.peca});
  late String titulo;
  PecaModel peca;
  late final PecaPageFrmCubit cubit = PecaPageFrmCubit(
    pecaModel: peca,
    service: PecaService(),
  );
  late final TextFieldStringWidget txtPeca = TextFieldStringWidget(
    placeholder: 'Peça',
    onChanged: (String? str) {
      peca.peca = txtPeca.text;
    },
  );

  @override
  void initState() {
    txtPeca.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 250) {
        return 'Pode ter no máximo 250 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtPeca.text = peca.peca.toString();
    titulo = 'Cadastro de Peça';
    if (peca.cod != 0) {
      titulo = 'Edição de Peça: ${peca.cod} - ${peca.peca}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<PecaPageFrmCubit, PecaPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<PecaPageFrmCubit, PecaPageFrmState>(
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
                        const Spacer(),
                        CloseButtonWidget(
                          onPressed: () =>
                              Navigator.of(context).pop((false, '')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtPeca,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: peca.ativo,
                            onClick: (value) => peca.ativo = value,
                            text: 'Ativo',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
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
                                peca = PecaModel.empty();
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
      ),
    );
  }

  void salvar() {
    if (!txtPeca.valid) return;
    cubit.save(peca);
  }
}
