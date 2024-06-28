import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page_frm/instituicao_page_frm_impressao/instituicao_page_frm_impressao.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page_frm/instituicao_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/local_instituicao/local_instituicao_page_frm/local_instituicao_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class InstituicaoPageFrm extends StatefulWidget {
  const InstituicaoPageFrm({
    Key? key,
    required this.instituicao,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final InstituicaoModel instituicao;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<InstituicaoPageFrm> createState() =>
      _InstituicaoPageFrmState(instituicao: instituicao);
}

class _InstituicaoPageFrmState extends State<InstituicaoPageFrm> {
  _InstituicaoPageFrmState({required this.instituicao});

  late String titulo;
  InstituicaoModel instituicao;
  late final LocalInstituicaoCubit localInstituicaoCubit;

  late final InstituicaoPageFrmCubit cubit = InstituicaoPageFrmCubit(
    instituicaoModel: instituicao,
    service: InstituicaoService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      instituicao.nome = txtNome.text;
    },
  );

  late final TextFieldStringWidget txtCnpj = TextFieldStringWidget(
    placeholder: 'CNPJ',
    onChanged: (String? str) {
      instituicao.cnpj = txtCnpj.text;
    },
  );

  late final TextFieldStringAreaWidget txtEndereco = TextFieldStringAreaWidget(
    placeholder: 'Endereço',
    onChanged: (String? str) {
      instituicao.endereco = txtEndereco.text;
    },
  );

  late final TextFieldStringWidget txtFoneCme = TextFieldStringWidget(
    placeholder: 'Fone CME',
    onChanged: (String? str) {
      instituicao.foneCme = txtFoneCme.text;
    },
  );

  late final TextFieldStringWidget txtFoneResponsavel = TextFieldStringWidget(
    placeholder: 'Fone Resposável',
    onChanged: (String? str) {
      instituicao.foneResponsavel = txtFoneResponsavel.text;
    },
  );

  late final TextFieldNumberWidget txtTempoDescartarItemEstoque =
      TextFieldNumberWidget(
    placeholder: 'Tempo Descartar Item no Estoque (Dias)',
    onChanged: (String str) {
      instituicao.tempoDescartarItemEstoque =
          str.isEmpty ? null : int.parse(str);
    },
  );

  late final TextFieldStringWidget txtMensagemDescartarItemEstoque =
      TextFieldStringWidget(
    placeholder: 'Mensagem Descartar Item no Estoque',
    onChanged: (String? str) {
      instituicao.mensagemDescartarItemEstoque = str;
    },
  );

  late final TextFieldStringWidget txtMensagemDescartarItemKitEstoque =
      TextFieldStringWidget(
    placeholder: 'Mensagem Descartar Item de Kit no Estoque',
    onChanged: (String? str) {
      instituicao.mensagemDescartarItemKitEstoque = str;
    },
  );

  late final TextFieldNumberWidget txtTempoDescartarKitEstoque =
      TextFieldNumberWidget(
    placeholder: 'Tempo Descartar Kit no Estoque (Dias)',
    onChanged: (String str) {
      instituicao.tempoDescartarKitEstoque =
          str.isEmpty ? null : int.parse(str);
    },
  );

  late final TextFieldStringWidget txtMensagemDescartarKitEstoque =
      TextFieldStringWidget(
    placeholder: 'Mensagem Descartar Kit no Estoque',
    onChanged: (String? str) {
      instituicao.mensagemDescartarKitEstoque = str;
    },
  );

  late final TextFieldNumberWidget txtTempoDescartarItemForaEstoque =
      TextFieldNumberWidget(
    placeholder: 'Tempo Descartar Item Fora do Estoque (Dias)',
    onChanged: (String str) {
      instituicao.tempoDescartarItemForaEstoque =
          str.isEmpty ? null : int.parse(str);
    },
  );

  late final TextFieldStringWidget txtMensagemDescartarItemForaEstoque =
      TextFieldStringWidget(
    placeholder: 'Mensagem Descartar Item Fora do Estoque',
    onChanged: (String? str) {
      instituicao.mensagemDescartarItemForaEstoque = str;
    },
  );

  late final TextFieldStringWidget txtMensagemDescartarItemKitForaEstoque =
      TextFieldStringWidget(
    placeholder: 'Mensagem Descartar Item de Kit Fora do Estoque',
    onChanged: (String? str) {
      instituicao.mensagemDescartarItemKitForaEstoque = str;
    },
  );

  late final TextFieldNumberWidget txtTempoDescartarKitForaEstoque =
      TextFieldNumberWidget(
    placeholder: 'Tempo Descartar Kit Fora do Estoque (Dias)',
    onChanged: (String str) {
      instituicao.tempoDescartarKitForaEstoque =
          str.isEmpty ? null : int.parse(str);
    },
  );

  late final TextFieldStringWidget txtMensagemDescartarKitForaEstoque =
      TextFieldStringWidget(
    placeholder: 'Mensagem Descartar Kit Fora do Estoque',
    onChanged: (String? str) {
      instituicao.mensagemDescartarKitForaEstoque = str;
    },
  );

  late final TextFieldStringWidget txtResponsavel = TextFieldStringWidget(
    placeholder: 'Responsável',
    onChanged: (String? str) {
      instituicao.responsavel = txtResponsavel.text;
    },
  );

  late final TextFieldNumberWidget txtDebugLevel = TextFieldNumberWidget(
    placeholder: 'Debug Level',
    onChanged: (String str) {
      instituicao.debugLevel =
          str.isEmpty ? null : int.parse(txtDebugLevel.text);
    },
  );

  late final TextFieldNumberWidget txtTempoMin = TextFieldNumberWidget(
    placeholder: 'Tempo Tela CME Processo (Min)',
    onChanged: (String str) {
      instituicao.tempoMin = str.isEmpty ? null : int.parse(txtTempoMin.text);
    },
  );

  late final TextFieldNumberFloatWidget txtEscalaFonte =
      TextFieldNumberFloatWidget(
    placeholder: 'Escala Fonte',
    onChanged: (String str) {
      instituicao.escalaFonte = str.isEmpty ? null : double.parse(str);
    },
  );

  late final TextFieldStringAreaWidget txtLocais = TextFieldStringAreaWidget(
    placeholder: 'Locais',
    readOnly: true,
  );

  @override
  void initState() {
    localInstituicaoCubit = LocalInstituicaoCubit();
    localInstituicaoCubit.loadFilter(
      LocalInstituicaoFilter(
        codInstituicao: instituicao.cod,
        ordenarPorNomeCrescente: true,
        apenasAtivos: true,
      ),
    );

    txtMensagemDescartarItemEstoque.addValidator((str) {
      if (str.length > 200) {
        return 'Pode ter no máximo 200 caracteres';
      }
      return '';
    });

    txtEscalaFonte.addValidator((str) {
      if (str.isEmpty) {
        return '';
      }
      String doubleStr = str.replaceAll(',', '.');
      double? parse = double.tryParse(doubleStr);
      if (parse == null) return 'Valor inválido';
      if (parse > 1.5) return 'Não pode passar de 1,5';
      return '';
    });

    txtMensagemDescartarItemForaEstoque.addValidator((str) {
      if (str.length > 200) {
        return 'Pode ter no máximo 200 caracteres';
      }
      return '';
    });

    txtMensagemDescartarItemKitEstoque.addValidator((str) {
      if (str.length > 200) {
        return 'Pode ter no máximo 200 caracteres';
      }
      return '';
    });

    txtMensagemDescartarItemKitForaEstoque.addValidator((str) {
      if (str.length > 200) {
        return 'Pode ter no máximo 200 caracteres';
      }
      return '';
    });

    txtMensagemDescartarKitEstoque.addValidator((str) {
      if (str.length > 200) {
        return 'Pode ter no máximo 200 caracteres';
      }
      return '';
    });

    txtMensagemDescartarKitForaEstoque.addValidator((str) {
      if (str.length > 200) {
        return 'Pode ter no máximo 200 caracteres';
      }
      return '';
    });

    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 150) {
        return 'Pode ter no máximo 150 caracteres';
      }
      return '';
    });

    txtEndereco.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtResponsavel.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNome.text = instituicao.nome?.toString() ?? '';
    txtEndereco.text = instituicao.endereco?.toString() ?? '';
    txtResponsavel.text = instituicao.responsavel?.toString() ?? '';
    txtDebugLevel.text = instituicao.debugLevel?.toString() ?? '';
    txtTempoMin.text = instituicao.tempoMin?.toString() ?? '';
    txtCnpj.text = instituicao.cnpj?.toString() ?? '';
    txtFoneCme.text = instituicao.foneCme?.toString() ?? '';
    txtFoneResponsavel.text = instituicao.foneResponsavel?.toString() ?? '';
    txtEscalaFonte.text =
        instituicao.escalaFonte?.toString().replaceAll('.', ',') ?? '';
    txtTempoDescartarItemEstoque.text =
        instituicao.tempoDescartarItemEstoque?.toString() ?? '';
    txtTempoDescartarKitEstoque.text =
        instituicao.tempoDescartarKitEstoque?.toString() ?? '';
    txtTempoDescartarItemForaEstoque.text =
        instituicao.tempoDescartarItemForaEstoque?.toString() ?? '';
    txtTempoDescartarKitForaEstoque.text =
        instituicao.tempoDescartarKitForaEstoque?.toString() ?? '';
    txtMensagemDescartarItemEstoque.text =
        instituicao.mensagemDescartarItemEstoque?.toString() ?? '';
    txtMensagemDescartarItemKitEstoque.text =
        instituicao.mensagemDescartarItemKitEstoque?.toString() ?? '';
    txtMensagemDescartarKitEstoque.text =
        instituicao.mensagemDescartarKitEstoque?.toString() ?? '';
    txtMensagemDescartarItemForaEstoque.text =
        instituicao.mensagemDescartarItemForaEstoque?.toString() ?? '';
    txtMensagemDescartarItemKitForaEstoque.text =
        instituicao.mensagemDescartarItemKitForaEstoque?.toString() ?? '';
    txtMensagemDescartarKitForaEstoque.text =
        instituicao.mensagemDescartarKitForaEstoque?.toString() ?? '';

    titulo = 'Cadastro de Instituições';
    if (instituicao.cod != 0) {
      titulo =
          'Edição da Instituição: ${instituicao.cod} - ${instituicao.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<InstituicaoPageFrmCubit, InstituicaoPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                TitleWidget(
                  text: titulo,
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 400,
                        maxWidth: 1800,
                        minHeight: 600,
                        maxHeight: 1000,
                      ),
                      height: size.height * 0.9,
                      width: size.width * 0.9,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtNome,
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: txtCnpj,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: txtEndereco,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtFoneCme,
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: txtFoneResponsavel,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: txtResponsavel,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked: instituicao.ativo,
                                        onClick: (value) =>
                                            instituicao.ativo = value,
                                        text: 'Ativo',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked: instituicao.imprimeQrCode,
                                        onClick: (value) =>
                                            instituicao.imprimeQrCode = value,
                                        text: 'Imprime',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked:
                                            instituicao.calculadoraRotulados,
                                        onClick: (value) => instituicao
                                            .calculadoraRotulados = value,
                                        text: 'Calculadora',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked: instituicao.fluxoAlternado,
                                        onClick: (value) =>
                                            instituicao.fluxoAlternado = value,
                                        text: 'Permite Fluxo Alternado',
                                        align: MainAxisAlignment.start,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked: instituicao.embalagemKit,
                                        onClick: (value) =>
                                            instituicao.embalagemKit = value,
                                        text: 'Embalagem - Kit',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked: instituicao.embalagemItem,
                                        onClick: (value) =>
                                            instituicao.embalagemItem = value,
                                        text: 'Embalagem - Item',
                                        align: MainAxisAlignment.start,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked:
                                            instituicao.naoAlertarKitIncompleto,
                                        onClick: (value) => instituicao
                                            .naoAlertarKitIncompleto = value,
                                        text:
                                            'Não Alertar Kit Incompleto (Preparo)',
                                        align: MainAxisAlignment.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtDebugLevel,
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: txtTempoMin,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtEscalaFonte,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: txtTempoDescartarItemEstoque,
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    flex: 6,
                                    child: txtMensagemDescartarItemEstoque,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  const Spacer(flex: 2),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    flex: 6,
                                    child: txtMensagemDescartarItemKitEstoque,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: txtTempoDescartarKitEstoque,
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    flex: 6,
                                    child: txtMensagemDescartarKitEstoque,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: txtTempoDescartarItemForaEstoque,
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    flex: 6,
                                    child: txtMensagemDescartarItemForaEstoque,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  const Spacer(flex: 2),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    flex: 6,
                                    child:
                                        txtMensagemDescartarItemKitForaEstoque,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: txtTempoDescartarKitForaEstoque,
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    flex: 6,
                                    child: txtMensagemDescartarKitForaEstoque,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<LocalInstituicaoCubit,
                                  LocalInstituicaoState>(
                                bloc: localInstituicaoCubit,
                                builder: (context, locaisState) {
                                  if (locaisState.loading) {
                                    return const LoadingWidget();
                                  }
                                  List<LocalInstituicaoModel> locais =
                                      locaisState.locaisInstituicoes;

                                  final localizacoesText = locais
                                      .map((localizacao) => localizacao.nome)
                                      .join('\n');

                                  if (locais.isNotEmpty) {
                                    txtLocais.text =
                                        localizacoesText.toString();
                                    return txtLocais;
                                  }
                                  txtLocais.text = ' ';
                                  return txtLocais;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    CustomPopupItemModel(
                      text: 'Locais',
                      onTap: _selectLocal,
                    ),
                    CustomPopupItemModel(
                      text: 'Imprimir Locais',
                      onTap: _imprimir,
                    ),
                    if (instituicao.cod != null && instituicao.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: instituicao.cod!,
                          termo: 'INSTITUICAO',
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
                  child: CancelButtonUnfilledWidget(
                    onPressed: widget.onCancel,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _imprimir() {
    showDialog(
      context: context,
      builder: (context) =>
          BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
        bloc: localInstituicaoCubit,
        builder: (context, state) {
          return InstituicaoPageFrmImpressao(
            instituicao: instituicao,
            locais: state.locaisInstituicoes,
            onCancel: () => onCancelImpressao(context),
            onPrinted: () => onPrinted(context),
          );
        },
      ),
    );
  }

  void onPrinted(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onCancelImpressao(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _selectLocal() {
    showDialog<bool>(
      context: context,
      builder: (context) => LocalInstituicaoPageFrm(
        onSaved: (str) => onSaved(str, context),
        onCancel: () => onCancel(context),
        localInstituicao: LocalInstituicaoModel(
          cod: 0,
          ativo: true,
          codBarra: '',
          codInstituicao: 0,
          centroCusto: null,
          codCentroCusto: null,
          contato: '',
          exigeProntuario: false,
          localConferencia: false,
          localizacao: '',
          nome: '',
          responsavel: '',
          ultimaAlteracao: null,
          tstamp: '',
        ),
      ),
    );
  }

  void onSaved(String message, BuildContext context) {
    Navigator.of(context).pop();
    ToastUtils.showCustomToastSucess(context, message);
  }

  void onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void salvar() {
    bool nomeValid = txtNome.valid;
    bool enderecoValid = txtEndereco.valid;
    bool responsavelValid = txtResponsavel.valid;
    bool debugLevelValid = txtDebugLevel.valid;
    bool tempoMinimoValid = txtTempoMin.valid;
    bool escalaFonteValid = txtEscalaFonte.valid;
    if (!nomeValid ||
        !enderecoValid ||
        !responsavelValid ||
        !debugLevelValid ||
        !tempoMinimoValid ||
        !escalaFonteValid) return;

    cubit.save(instituicao, widget.onSaved, context);
  }
}
