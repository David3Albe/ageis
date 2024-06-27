import 'package:ageiscme_admin/app/module/pages/cadastro/tipo_documento/tipo_documento_page_frm/tipo_documento_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/tipo_documento/tipo_documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TipoDocumentoPageFrm extends StatefulWidget {
  const TipoDocumentoPageFrm({
    Key? key,
    required this.tipoDocumento,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final TipoDocumentoModel tipoDocumento;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<TipoDocumentoPageFrm> createState() =>
      _TipoDocumentoPageFrmState(tipoDocumento: tipoDocumento);
}

class _TipoDocumentoPageFrmState extends State<TipoDocumentoPageFrm> {
  _TipoDocumentoPageFrmState({required this.tipoDocumento});
  late String titulo;
  TipoDocumentoModel tipoDocumento;
  late final TipoDocumentoPageFrmCubit cubit = TipoDocumentoPageFrmCubit(
    tipoDocumentoModel: tipoDocumento,
    service: TipoDocumentoService(),
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      tipoDocumento.descricao = txtDescricao.text;
    },
  );

  @override
  void initState() {
    txtDescricao.addValidator((String str) {
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
    txtDescricao.text = tipoDocumento.descricao.toString();
    titulo = 'Cadastro de Tipo de Documento';
    if (tipoDocumento.cod != 0) {
      titulo =
          'Edição de Tipo de Documento: ${tipoDocumento.cod} - ${tipoDocumento.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<TipoDocumentoPageFrmCubit, TipoDocumentoPageFrmState>(
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtDescricao,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomPopupMenuWidget(
                        items: [
                          if (tipoDocumento.cod != null &&
                              tipoDocumento.cod != 0)
                            CustomPopupItemHistoryModel.getHistoryItem(
                              child: HistoricoPage(
                                pk: tipoDocumento.cod!,
                                termo: 'TIPO_DOCUMENTO',
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
                              tipoDocumento = TipoDocumentoModel.empty();
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
    cubit.save(tipoDocumento,widget.onSaved);
  }
}
