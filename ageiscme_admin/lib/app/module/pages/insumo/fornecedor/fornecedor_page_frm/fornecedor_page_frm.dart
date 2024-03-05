import 'package:ageiscme_admin/app/module/pages/insumo/fornecedor/fornecedor_page_frm/fornecedor_page_frm_state.dart';
import 'package:ageiscme_data/services/fornecedor/fornecedor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FornecedorPageFrm extends StatefulWidget {
  const FornecedorPageFrm({
    Key? key,
    required this.fornecedor,
  }) : super(key: key);

  final FornecedorModel fornecedor;

  @override
  State<FornecedorPageFrm> createState() =>
      _FornecedorPageFrmState(fornecedor: fornecedor);
}

class _FornecedorPageFrmState extends State<FornecedorPageFrm> {
  _FornecedorPageFrmState({required this.fornecedor});
  late String titulo;
  FornecedorModel fornecedor;
  late final FornecedorPageFrmCubit cubit = FornecedorPageFrmCubit(
    fornecedorModel: fornecedor,
    service: FornecedorService(),
  );
  late final TextFieldStringWidget txtFornecedor = TextFieldStringWidget(
    placeholder: 'Fornecedor',
    onChanged: (String? str) {
      fornecedor.nome = txtFornecedor.text;
    },
  );

  @override
  void initState() {
    txtFornecedor.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtFornecedor.text = fornecedor.nome.toString();
    titulo = 'Cadastro de Fornecedor';
    if (fornecedor.cod != 0) {
      titulo = 'Edição de Fornecedor: ${fornecedor.cod} - ${fornecedor.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<FornecedorPageFrmCubit, FornecedorPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<FornecedorPageFrmCubit, FornecedorPageFrmState>(
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
                      child: txtFornecedor,
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
                                fornecedor = FornecedorModel.empty();
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
    if (!txtFornecedor.valid) return;
    cubit.save(fornecedor);
  }
}
