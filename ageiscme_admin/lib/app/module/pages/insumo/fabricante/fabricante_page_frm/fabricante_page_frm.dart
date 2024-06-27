import 'package:ageiscme_admin/app/module/pages/insumo/fabricante/fabricante_page_frm/fabricante_page_frm_state.dart';
import 'package:ageiscme_data/services/fabricante/fabricante_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FabricantePageFrm extends StatefulWidget {
  const FabricantePageFrm({
    Key? key,
    required this.fabricante,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final FabricanteModel fabricante;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<FabricantePageFrm> createState() =>
      _FabricantePageFrmState(fabricante: fabricante);
}

class _FabricantePageFrmState extends State<FabricantePageFrm> {
  _FabricantePageFrmState({required this.fabricante});
  late String titulo;
  FabricanteModel fabricante;
  late final FabricantePageFrmCubit cubit = FabricantePageFrmCubit(
    fabricanteModel: fabricante,
    service: FabricanteService(),
  );
  late final TextFieldStringWidget txtFabricante = TextFieldStringWidget(
    placeholder: 'Fabricante *',
    onChanged: (String? str) {
      fabricante.nome = txtFabricante.text;
    },
  );

  @override
  void initState() {
    txtFabricante.addValidator((String str) {
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
    txtFabricante.text = fabricante.nome.toString();
    titulo = 'Cadastro de Fabricante';
    if (fabricante.cod != 0) {
      titulo = 'Edição de Fabricante: ${fabricante.cod} - ${fabricante.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FabricantePageFrmCubit, FabricantePageFrmState>(
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
                    child: txtFabricante,
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
                              fabricante = FabricanteModel.empty();
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
    if (!txtFabricante.valid) return;
    cubit.save(fabricante, widget.onSaved);
  }
}
