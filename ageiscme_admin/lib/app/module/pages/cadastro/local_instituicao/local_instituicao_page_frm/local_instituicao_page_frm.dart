import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/centro_custo/centro_custo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/local_instituicao/local_instituicao_page_frm/local_instituicao_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/local_instituicao/local_instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LocalInstituicaoPageFrm extends StatefulWidget {
  const LocalInstituicaoPageFrm({
    Key? key,
    required this.localInstituicao,
  }) : super(key: key);

  final LocalInstituicaoModel localInstituicao;

  @override
  State<LocalInstituicaoPageFrm> createState() =>
      _LocalInstituicaoPageFrmState(localInstituicao: localInstituicao);
}

class _LocalInstituicaoPageFrmState extends State<LocalInstituicaoPageFrm> {
  _LocalInstituicaoPageFrmState({required this.localInstituicao});
  late final CentroCustoCubit centroCustoCubit;
  late String titulo;
  LocalInstituicaoModel localInstituicao;
  late final LocalInstituicaoPageFrmCubit cubit = LocalInstituicaoPageFrmCubit(
    localInstituicaoModel: localInstituicao,
    service: LocalInstituicaoService(),
  );
  late final TextFieldStringWidget txtNomeLocal = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      localInstituicao.nome = txtNomeLocal.text;
    },
  );
  late final TextFieldStringWidget txtCodBarra = TextFieldStringWidget(
    placeholder: 'Código de Barras',
    readOnly: true,
    onChanged: (String? str) {
      localInstituicao.codBarra = txtCodBarra.text;
    },
  );
  late final TextFieldStringWidget txtContato = TextFieldStringWidget(
    placeholder: 'Contato',
    onChanged: (String? str) {
      localInstituicao.contato = txtContato.text;
    },
  );
  late final TextFieldStringWidget txtLocalizacaoFisica = TextFieldStringWidget(
    placeholder: 'Localização Física',
    onChanged: (String? str) {
      localInstituicao.localizacao = txtLocalizacaoFisica.text;
    },
  );
  late final TextFieldStringWidget txtResponsavel = TextFieldStringWidget(
    placeholder: 'Responsável',
    onChanged: (String? str) {
      localInstituicao.responsavel = txtResponsavel.text;
    },
  );

  @override
  void initState() {
    centroCustoCubit = CentroCustoCubit();
    centroCustoCubit.loadAll();
    txtNomeLocal.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 150) {
        return 'Pode ter no máximo 150 caracteres';
      }
      return '';
    });

    txtContato.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 150) {
        return 'Pode ter no máximo 150 caracteres';
      }
      return '';
    });

    txtLocalizacaoFisica.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtResponsavel.addValidator((String str) {
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
    txtNomeLocal.text = localInstituicao.nome.toString();
    txtCodBarra.text = localInstituicao.codBarra.toString();
    txtContato.text = localInstituicao.contato.toString();
    txtLocalizacaoFisica.text = localInstituicao.localizacao.toString();
    txtResponsavel.text = localInstituicao.responsavel.toString();
    titulo = 'Cadastro de Local da Instituição';
    if (localInstituicao.cod != 0) {
      titulo =
          'Edição de Local da Instituição: ${localInstituicao.cod} - ${localInstituicao.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<LocalInstituicaoPageFrmCubit,
        LocalInstituicaoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<LocalInstituicaoPageFrmCubit,
          LocalInstituicaoPageFrmState>(
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
                      child: txtNomeLocal,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtCodBarra,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtContato,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtLocalizacaoFisica,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtResponsavel,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child:
                          BlocBuilder<CentroCustoCubit, List<CentroCustoModel>>(
                        bloc: centroCustoCubit,
                        builder: (context, centrosCusto) {
                          centrosCusto.sort(
                            (a, b) => a.centroCusto!.compareTo(b.centroCusto!),
                          );
                          CentroCustoModel? centroCusto = centrosCusto
                              .where(
                                (element) =>
                                    element.cod ==
                                    localInstituicao.codCentroCusto,
                              )
                              .firstOrNull;

                          return DropDownWidget<CentroCustoModel>(
                            initialValue: centroCusto,
                            sourceList: centrosCusto
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) =>
                                localInstituicao.codCentroCusto = value.cod!,
                            placeholder: 'Centro de Custo',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: localInstituicao.ativo,
                            onClick: (value) => localInstituicao.ativo = value,
                            text: 'Ativo',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: localInstituicao.exigeProntuario,
                            onClick: (value) =>
                                localInstituicao.exigeProntuario = value,
                            text: 'Exige Prontuário na Recepção',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: localInstituicao.localConferencia,
                            onClick: (value) =>
                                localInstituicao.localConferencia = value,
                            text:
                                'Local Conferência \n(Não atualizar o status do item na etapa de Recepção)',
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: [
                      if (localInstituicao.cod != null && localInstituicao.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: localInstituicao.cod!,
                            termo: 'LOCAL_INSTITUICAO',
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
                          localInstituicao = LocalInstituicaoModel.empty();
                        }),
                      },
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

  void salvar() {
    if (!txtNomeLocal.valid ||
        !txtContato.valid ||
        !txtLocalizacaoFisica.valid ||
        !txtResponsavel.valid) return;

    cubit.save(localInstituicao);
  }
}
