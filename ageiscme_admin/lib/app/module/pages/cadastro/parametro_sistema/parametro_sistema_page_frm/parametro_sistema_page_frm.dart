import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/gerar_licenca_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/parametro_sistema_page_frm_state.dart';
import 'package:ageiscme_data/services/parametro_sistema/parametro_sistema_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ParametroSistemaPageFrm extends StatefulWidget {
  const ParametroSistemaPageFrm({
    Key? key,
    required this.parametroSistema,
  }) : super(key: key);

  final ParametroSistemaModel parametroSistema;

  @override
  State<ParametroSistemaPageFrm> createState() =>
      _ParametroSistemaPageFrmState(parametroSistema: parametroSistema);
}

class _ParametroSistemaPageFrmState extends State<ParametroSistemaPageFrm> {
  _ParametroSistemaPageFrmState({required this.parametroSistema});
  late String titulo;
  ParametroSistemaModel parametroSistema;
  late final ParametroSistemaPageFrmCubit cubit = ParametroSistemaPageFrmCubit(
    parametroSistemaModel: parametroSistema,
    service: ParametroSistemaService(),
  );
  late final TextFieldStringWidget txtVersaoAtual = TextFieldStringWidget(
    placeholder: 'Versão Atual da Aplicação',
    onChanged: (String? str) {
      parametroSistema.versaoSW = txtVersaoAtual.text;
    },
  );
  late final DatePickerWidget txtDataVersaoAtual = DatePickerWidget(
    placeholder: 'Data da Versão Atual',
    onDateSelected: (value) => parametroSistema.dataVersaoSW = value,
    initialValue: parametroSistema.dataVersaoSW!,
  );

  late final TextFieldStringWidget txtVersaoV2 = TextFieldStringWidget(
    placeholder: 'Versão 2 da Aplicação',
    onChanged: (String? str) {
      parametroSistema.versaoSistemaV2 = str;
    },
  );
  late final DatePickerWidget txtDataVersaoV2 = DatePickerWidget(
    placeholder: 'Data da Versão 2 da Aplicação',
    onDateSelected: (value) => parametroSistema.dataVersaoSistemaV2 = value,
    initialValue: parametroSistema.dataVersaoSistemaV2,
  );

  late final TextFieldNumberWidget txtQtdeMaxProcessosEtiqueta =
      TextFieldNumberWidget(
    placeholder: 'Qtde. Máxima de Processos por Etiqueta',
    onChanged: (String str) {
      parametroSistema.qtdeMaxProcessosEtiqueta =
          str.isEmpty ? null : int.parse(txtQtdeMaxProcessosEtiqueta.text);
    },
  );

  late final TextFieldStringWidget txtControleImpressaoIndicador =
      TextFieldStringWidget(
    placeholder: 'Nr. Controle Impressão Indicador',
    onChanged: (String? str) {
      parametroSistema.indicador =
          int.parse(txtControleImpressaoIndicador.text);
    },
  );
  late final TextFieldStringWidget txtLetraConsignado = TextFieldStringWidget(
    placeholder: 'Letra Para Itens Consignados',
    onChanged: (String? str) {
      parametroSistema.letraConsignado = txtLetraConsignado.text;
    },
  );
  late final TextFieldStringAreaWidget txtLicenca = TextFieldStringAreaWidget(
    placeholder: 'Licença',
    onChanged: (String? str) {
      parametroSistema.licenca = txtLicenca.text;
    },
  );

  @override
  void initState() {
    txtQtdeMaxProcessosEtiqueta.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 10) {
        return 'Pode ser até no máximo 9999999999';
      }
      return '';
    });

    txtVersaoAtual.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 20) {
        return 'Pode ter no máximo 20 caracteres';
      }
      return '';
    });

    txtControleImpressaoIndicador.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 10) {
        return 'Pode ser até no máximo 9999999999';
      }
      return '';
    });

    txtLetraConsignado.addValidator((String str) {
      if (str.length > 1) {
        return 'Pode ter no máximo 1 caracter';
      }
      return '';
    });

    txtLicenca.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 2000) {
        return 'Pode ter no máximo 2000 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtVersaoAtual.text = parametroSistema.versaoSW.toString();
    txtVersaoV2.text = parametroSistema.versaoSistemaV2?.toString() ?? '';
    txtQtdeMaxProcessosEtiqueta.text =
        parametroSistema.qtdeMaxProcessosEtiqueta.toString();
    txtControleImpressaoIndicador.text = parametroSistema.indicador.toString();
    txtLetraConsignado.text = parametroSistema.letraConsignado.toString();
    txtLicenca.text = parametroSistema.licenca.toString();
    titulo = 'CME -Parâmetro da Aplicação';
    if (parametroSistema.cod != 0) {
      titulo =
          'CME -Edição do Parâmetro da Aplicação: ${parametroSistema.versaoSW}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ParametroSistemaPageFrmCubit,
        ParametroSistemaPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      builder: (context, state) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8.0),
          titlePadding: const EdgeInsets.all(8.0),
          actionsPadding: const EdgeInsets.all(8.0),
          title: Row(
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
          content: Container(
            constraints: BoxConstraints(
              minWidth: size.width * .5,
              minHeight: size.height * .5,
              maxHeight: size.height * .8,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(right: 14),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtVersaoAtual,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtDataVersaoAtual,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtVersaoV2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtDataVersaoV2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtQtdeMaxProcessosEtiqueta,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtControleImpressaoIndicador,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtLetraConsignado,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: parametroSistema.zeraEtiquetaRotulado,
                          onClick: (value) =>
                              parametroSistema.zeraEtiquetaRotulado = value,
                          text: 'Zera Etiqueta Rotulado',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtLicenca,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 24)),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                if (parametroSistema.cod != 0 && parametroSistema.cod != null)
                  CustomPopupMenuWidget(
                    items: [
                      CustomPopupItemModel(
                        text: 'Gerar Licença',
                        onTap: gerarLicenca,
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
                  child: CancelButtonUnfilledWidget(
                    onPressed: () => {Navigator.of(context).pop((false, ''))},
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future gerarLicenca() async {
    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const GerarLicencaPage();
      },
    );
    if (result == null || result.$1 != true) return;
    Navigator.of(context).pop(result);
  }

  void salvar() {
    if (!txtControleImpressaoIndicador.valid ||
        !txtLetraConsignado.valid ||
        !txtLicenca.valid ||
        !txtQtdeMaxProcessosEtiqueta.valid ||
        !txtVersaoAtual.valid) return;

    cubit.save(parametroSistema);
  }
}
