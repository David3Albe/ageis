import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page_frm/instituicao_page_frm_impressao/instituicao_page_frm_impressao.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page_frm/instituicao_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/local_instituicao/local_instituicao_page_frm/local_instituicao_page_frm.dart';
import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
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
  }) : super(key: key);

  final InstituicaoModel instituicao;

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

  late final TextFieldStringWidget txtResponsavel = TextFieldStringWidget(
    placeholder: 'Responsável',
    onChanged: (String? str) {
      instituicao.responsavel = txtResponsavel.text;
    },
  );

  late final TextFieldNumberWidget txtDebugLevel = TextFieldNumberWidget(
    placeholder: 'Debug Level',
    onChanged: (String? str) {
      instituicao.debugLevel = int.parse(txtDebugLevel.text);
    },
  );

  late final TextFieldNumberWidget txtTempoMin = TextFieldNumberWidget(
    placeholder: 'Tempo Tela CME Processo (Min)',
    onChanged: (String? str) {
      instituicao.tempoMin = int.parse(txtTempoMin.text);
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
    txtNome.text = instituicao.nome.toString();
    txtEndereco.text = instituicao.endereco.toString();
    txtResponsavel.text = instituicao.responsavel.toString();
    txtDebugLevel.text = instituicao.debugLevel.toString();
    txtTempoMin.text = instituicao.tempoMin.toString();
    txtCnpj.text = instituicao.cnpj.toString();
    txtFoneCme.text = instituicao.foneCme.toString();
    txtFoneResponsavel.text = instituicao.foneResponsavel.toString();

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
    return BlocListener<InstituicaoPageFrmCubit, InstituicaoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<InstituicaoPageFrmCubit, InstituicaoPageFrmState>(
        bloc: cubit,
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
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              CustomCheckboxWidget(
                                checked: instituicao.ativo,
                                onClick: (value) => instituicao.ativo = value,
                                text: 'Ativo',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              CustomCheckboxWidget(
                                checked: instituicao.imprimeQrCode,
                                onClick: (value) =>
                                    instituicao.imprimeQrCode = value,
                                text: 'Imprime',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              CustomCheckboxWidget(
                                checked: instituicao.calculadoraRotulados,
                                onClick: (value) =>
                                    instituicao.calculadoraRotulados = value,
                                text: 'Calculadora',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
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
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              CustomCheckboxWidget(
                                checked: instituicao.embalagemKit,
                                onClick: (value) =>
                                    instituicao.embalagemKit = value,
                                text: 'Embalagem - Kit',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              CustomCheckboxWidget(
                                checked: instituicao.embalagemItem,
                                onClick: (value) =>
                                    instituicao.embalagemItem = value,
                                text: 'Embalagem - Item',
                                align: MainAxisAlignment.start,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              CustomCheckboxWidget(
                                checked: instituicao.naoAlertarKitIncompleto,
                                onClick: (value) =>
                                    instituicao.naoAlertarKitIncompleto = value,
                                text: 'Não Alertar Kit Incompleto (Preparo)',
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
                      child: BlocBuilder<LocalInstituicaoCubit,
                          LocalInstituicaoState>(
                        bloc: localInstituicaoCubit,
                        builder: (context, locaisState) {
                          if (locaisState.loading) return const LoadingWidget();
                          List<LocalInstituicaoModel> locais =
                              locaisState.locaisInstituicoes;

                          final localizacoesText = locais
                              .map((localizacao) => localizacao.nome)
                              .join('\n');

                          if (locais.isNotEmpty) {
                            txtLocais.text = localizacoesText.toString();
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
            actions: [
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
                      CustomPopupItemHistoryModel.getHistoryItem(),
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
      ),
    );
  }

  void _imprimir() async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
          bloc: localInstituicaoCubit,
          builder: (context, state) {
            return InstituicaoPageFrmImpressao(
              instituicao: instituicao,
              locais: state.locaisInstituicoes,
            );
          },
        );
      },
    );
  }

  void _selectLocal() {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return LocalInstituicaoPageFrm(
          localInstituicao: LocalInstituicaoModel(
            cod: 0,
            ativo: true,
            codBarra: '',
            codInstituicao: 0,
            centroCusto: null,
            codCentroCusto: 0,
            contato: '',
            exigeProntuario: false,
            localConferencia: false,
            localizacao: '',
            nome: '',
            responsavel: '',
            ultimaAlteracao: null,
            tstamp: '',
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(
        context,
        result.$2,
      );
    });
  }

  void salvar() {
    if (!txtNome.valid ||
        !txtEndereco.valid ||
        !txtResponsavel.valid ||
        !txtDebugLevel.valid ||
        !txtTempoMin.valid) return;

    cubit.save(instituicao);
  }
}
