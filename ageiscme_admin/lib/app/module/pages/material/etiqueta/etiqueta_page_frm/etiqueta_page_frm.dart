import 'package:ageiscme_admin/app/module/pages/material/etiqueta/etiqueta_page_frm/etiqueta_page_frm_state.dart';
import 'package:ageiscme_data/services/etiqueta/etiqueta_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EtiquetaPageFrm extends StatefulWidget {
  const EtiquetaPageFrm({
    Key? key,
    required this.etiqueta,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final EtiquetaModel etiqueta;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<EtiquetaPageFrm> createState() =>
      _EtiquetaPageFrmState(etiqueta: etiqueta);
}

class _EtiquetaPageFrmState extends State<EtiquetaPageFrm> {
  _EtiquetaPageFrmState({required this.etiqueta});
  late String titulo;
  EtiquetaModel etiqueta;
  late final EtiquetaPageFrmCubit cubit = EtiquetaPageFrmCubit(
    etiquetaModel: etiqueta,
    service: EtiquetaService(),
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      etiqueta.descricao = txtDescricao.text;
    },
  );
  late final TextFieldNumberWidget txtLimiteProcesso = TextFieldNumberWidget(
    placeholder: 'Limite Processo',
    onChanged: (String? str) {
      etiqueta.limiteProcessos = int.parse(txtLimiteProcesso.text);
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

    txtLimiteProcesso.addValidator((String str) {
      if (str.length > 10) {
        return 'Pode ser até no máximo 9999999999';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtDescricao.text = etiqueta.descricao.toString();
    if (etiqueta.descricao == '' && etiqueta.limiteProcessos == null) {
      txtLimiteProcesso.text = '';
    } else if (etiqueta.descricao != '' && etiqueta.limiteProcessos == null) {
      txtLimiteProcesso.text = '';
    } else {
      txtLimiteProcesso.text = etiqueta.limiteProcessos.toString();
    }

    titulo = 'Cadastro de etiqueta';
    if (etiqueta.cod != 0) {
      titulo = 'Edição de Etiqueta: ${etiqueta.cod} - ${etiqueta.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EtiquetaPageFrmCubit, EtiquetaPageFrmState>(
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
                    child: txtLimiteProcesso,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: etiqueta.ativo,
                          onClick: (value) => etiqueta.ativo = value,
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
                        padding: const EdgeInsets.only(left: 6.0),
                        child: UpdateButtonWidget(
                          readonly: etiqueta.cod == 0 || etiqueta.cod == null,
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
                              etiqueta = EtiquetaModel.empty();
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
    bool descricaoValid = txtDescricao.valid;
    bool limiteProcessoValid = txtLimiteProcesso.valid;
    if (!descricaoValid || !limiteProcessoValid) return;
    cubit.save(
      novo ? etiqueta.copyWith(cod: 0, tstamp: null) : etiqueta,
      widget.onSaved,
    );
  }
}
