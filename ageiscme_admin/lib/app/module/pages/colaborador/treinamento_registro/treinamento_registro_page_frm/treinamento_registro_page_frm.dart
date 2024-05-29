import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/treinamento_registro_page_frm/treinamento_registro_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/treinamento_registro/treinamento_registro_service.dart';
import 'package:ageiscme_impressoes/dto/training_record/training_record_print_dto.dart';
import 'package:ageiscme_impressoes/dto/training_record/user/training_record_user_print_dto.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/training_record_printer_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/treinamento_usuario/treinamento_usuario_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_save_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/componentes/botoes/list_button_widget.dart';
import 'package:compartilhados/functions/file_helper/file_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TreinamentoRegistroPageFrm extends StatefulWidget {
  const TreinamentoRegistroPageFrm({
    Key? key,
    required this.treinamentoRegistro,
    required this.usuarioCubit,
  }) : super(key: key);

  final TreinamentoRegistroModel treinamentoRegistro;
  final UsuarioCubit usuarioCubit;

  @override
  State<TreinamentoRegistroPageFrm> createState() =>
      _TreinamentoRegistroPageFrmState(
        treinamentoRegistro: treinamentoRegistro,
      );
}

class _TreinamentoRegistroPageFrmState
    extends State<TreinamentoRegistroPageFrm> {
  _TreinamentoRegistroPageFrmState({required this.treinamentoRegistro});

  late String titulo;
  TreinamentoRegistroModel treinamentoRegistro;

  UsuarioModel? usuarioRemover;
  UsuarioModel? usuarioAdicionar;

  late final TreinamentoRegistroPageFrmCubit cubit =
      TreinamentoRegistroPageFrmCubit(
    treinamentoRegistroModel: treinamentoRegistro,
    service: TreinamentoRegistroService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      treinamentoRegistro.nome = txtNome.text;
    },
  );

  late final TextFieldStringAreaWidget txtDescricaoConteudo =
      TextFieldStringAreaWidget(
    placeholder: 'Descrição do Conteúdo',
    onChanged: (String? str) {
      treinamentoRegistro.descricao = txtDescricaoConteudo.text;
    },
  );

  late final TextFieldStringWidget txtEntidade = TextFieldStringWidget(
    placeholder: 'Entidade',
    onChanged: (String? str) {
      treinamentoRegistro.entidade = txtEntidade.text;
    },
  );

  late final DatePickerWidget dtpData = DatePickerWidget(
    placeholder: 'Data',
    onDateSelected: (value) => treinamentoRegistro.data = value,
    initialValue: treinamentoRegistro.data,
  );

  late TextFieldNumberFloatWidget txtCargaHoraria = TextFieldNumberFloatWidget(
    placeholder: 'Carga Horária (hs)',
    onChanged: (String? str) {
      treinamentoRegistro.cargaHoraria = double.parse(txtCargaHoraria.text);
    },
  );

  late final TextFieldStringWidget txtObservacao = TextFieldStringWidget(
    placeholder: 'Observação',
    onChanged: (String? str) {
      treinamentoRegistro.observacao = txtObservacao.text;
    },
  );

  @override
  void initState() {
    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });

    txtDescricaoConteudo.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtCargaHoraria.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtObservacao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtEntidade.addValidator((String str) {
      if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNome.text = treinamentoRegistro.nome.toString();
    txtDescricaoConteudo.text = treinamentoRegistro.descricao.toString();
    txtEntidade.text = treinamentoRegistro.entidade.toString();
    txtObservacao.text = treinamentoRegistro.observacao.toString();

    if (treinamentoRegistro.cargaHoraria == null) {
      txtCargaHoraria.text = '';
    } else {
      txtCargaHoraria.text = treinamentoRegistro.cargaHoraria.toString();
    }

    titulo = 'Registros de Treinamentos';
    if (treinamentoRegistro.cod != 0) {
      titulo =
          'Edição de Registro de Treinamento: ${treinamentoRegistro.cod} - ${treinamentoRegistro.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<TreinamentoRegistroPageFrmCubit,
        TreinamentoRegistroPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<TreinamentoRegistroPageFrmCubit,
          TreinamentoRegistroPageFrmState>(
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
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtNome,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtDescricaoConteudo,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtEntidade,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: dtpData,
                          ),
                          const SizedBox(width: 25.0),
                          Expanded(
                            child: txtCargaHoraria,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtObservacao,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: LabelStringWidget(
                        text:
                            'Documento Anexado: ${treinamentoRegistro.docNome == null ? 'Nenhum Documento foi Encontrado' : treinamentoRegistro.docNome}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Lista de Presença',
                              style: Fontes.getRoboto(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 25.0),
                          Expanded(
                            child: Text(
                              'Colaboradores',
                              style: Fontes.getRoboto(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListButtonWidget(
                              text: 'Remover',
                              icon: Icons.arrow_forward,
                              onPressed: () {
                                if (usuarioRemover != null) {
                                  setState(() {
                                    if (treinamentoRegistro
                                            .usuariosTreinamentos !=
                                        null) {
                                      treinamentoRegistro.usuariosTreinamentos!
                                          .removeWhere(
                                        (element) =>
                                            element.codUsuario ==
                                            usuarioRemover!.cod,
                                      );
                                    }
                                  });
                                } else {
                                  ToastUtils.showCustomToastError(
                                    context,
                                    'Nenhum Colaborador selecionado',
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 25.0),
                          Expanded(
                            child: ListButtonWidget(
                              text: 'Adicionar',
                              icon: Icons.arrow_back,
                              onPressed: () {
                                if (usuarioAdicionar != null) {
                                  setState(() {
                                    if (treinamentoRegistro
                                            .usuariosTreinamentos ==
                                        null) {
                                      treinamentoRegistro.usuariosTreinamentos =
                                          [];
                                    }
                                    TreinamentoUsuarioModel treinamentoUsuario =
                                        TreinamentoUsuarioModel.empty();
                                    treinamentoUsuario.codUsuario =
                                        usuarioAdicionar!.cod;
                                    treinamentoRegistro.usuariosTreinamentos!
                                        .add(treinamentoUsuario);

                                    usuarioAdicionar = null;
                                  });
                                } else {
                                  ToastUtils.showCustomToastError(
                                    context,
                                    'Nenhum Colaborador selecionado',
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<UsuarioCubit, UsuarioState>(
                              bloc: widget.usuarioCubit,
                              builder: (context, usuarioState) {
                                if (usuarioState.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<UsuarioModel> usuarios =
                                    usuarioState.usuarios;
                                List<UsuarioModel> usuariosPresentes = [];
                                if (treinamentoRegistro.usuariosTreinamentos !=
                                    null) {
                                  for (final treinamentoUsuario
                                      in treinamentoRegistro
                                          .usuariosTreinamentos!) {
                                    final codUsuario =
                                        treinamentoUsuario.codUsuario;

                                    if (usuarios.isNotEmpty) {
                                      final usuarioPresente = usuarios
                                          .where(
                                            (usuario) =>
                                                usuario.cod == codUsuario,
                                          )
                                          .firstOrNull;
                                      if (usuarioPresente != null) {
                                        usuariosPresentes.add(usuarioPresente);
                                      }
                                    }
                                  }
                                }

                                return ListFieldWidget<UsuarioModel>(
                                  sourceList: usuariosPresentes,
                                  removeButton: false,
                                  onItemSelected: (selectedUsuario) {
                                    setState(() {
                                      usuarioRemover = selectedUsuario;
                                    });
                                  },
                                  itemText: (usuario) {
                                    return usuario.nome!;
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 25.0),
                          Expanded(
                            child: BlocBuilder<UsuarioCubit, UsuarioState>(
                              bloc: widget.usuarioCubit,
                              builder: (context, usuarioState) {
                                if (usuarioState.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<UsuarioModel> usuarios =
                                    usuarioState.usuarios;
                                if (treinamentoRegistro.usuariosTreinamentos ==
                                    null) {
                                  treinamentoRegistro.usuariosTreinamentos = [];
                                }
                                List<UsuarioModel> colaboradoresAusentes =
                                    usuarios
                                        .where(
                                          (usuario) => !treinamentoRegistro
                                              .usuariosTreinamentos!
                                              .any(
                                            (treinamento) =>
                                                treinamento.codUsuario ==
                                                usuario.cod,
                                          ),
                                        )
                                        .toList();
                                return ListFieldWidget<UsuarioModel>(
                                  sourceList: colaboradoresAusentes,
                                  removeButton: false,
                                  onItemSelected: (selectedUsuario) {
                                    setState(() {
                                      usuarioAdicionar = selectedUsuario;
                                    });
                                  },
                                  itemText: (usuario) {
                                    return usuario.nome!;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
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
                        text: 'Imprimir',
                        onTap: print,
                      ),
                      CustomPopupItemFileModel.getFileItem(
                        'Anexar DOC',
                        salvarDoc,
                      ),
                      if (treinamentoRegistro.docNome != null &&
                          treinamentoRegistro.doc != null)
                        CustomPopupItemModel(
                          text: 'Excluir DOC',
                          onTap: excluirDoc,
                        ),
                      if (treinamentoRegistro.docNome != null &&
                          treinamentoRegistro.doc != null)
                        CustomPopupItemSaveFileModel.getOpenDocItem(
                          text: 'Abrir DOC',
                          context: context,
                          docName: treinamentoRegistro.docNome,
                          docString: treinamentoRegistro.doc,
                        ),
                      if (treinamentoRegistro.cod != null &&
                          treinamentoRegistro.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: treinamentoRegistro.cod!,
                            termo: 'TREINAMENTO_REGISTRO',
                          ),
                          context: context,
                        ),
                    ],
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 16 * paddingHorizontalScale,
                    runSpacing: 16 * paddingHorizontalScale,
                    alignment: WrapAlignment.end,
                    children: [
                      SaveButtonWidget(
                        onPressed: () => {salvar()},
                      ),
                      CleanButtonWidget(
                        onPressed: () => {
                          setState(() {
                            treinamentoRegistro =
                                TreinamentoRegistroModel.empty();
                          }),
                        },
                      ),
                      CancelButtonUnfilledWidget(
                        onPressed: () =>
                            {Navigator.of(context).pop((false, ''))},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future print() async {
    if (treinamentoRegistro.cod == null || treinamentoRegistro.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o registro salvo para realizar a impressao',
      );
      return;
    }
    List<TrainingRecordUserPrintDTO> users = [];
    if (treinamentoRegistro.usuariosTreinamentos == null) {
      return;
    }
    for (TreinamentoUsuarioModel usuario
        in treinamentoRegistro.usuariosTreinamentos!) {
      String? nomeUsuario = widget.usuarioCubit.state.usuarios
          .where((element) => element.cod == usuario.codUsuario)
          .firstOrNull
          ?.nome;
      if (nomeUsuario != null) {
        users.add(
          TrainingRecordUserPrintDTO(
            userName: nomeUsuario,
          ),
        );
      }
    }
    TrainingRecordPrintDTO dto = TrainingRecordPrintDTO(
      name: treinamentoRegistro.nome ?? '',
      description: treinamentoRegistro.descricao ?? '',
      date: treinamentoRegistro.data,
      entity: treinamentoRegistro.entidade ?? '',
      workload: treinamentoRegistro.cargaHoraria ?? 0.0,
      users: users,
    );
    await TrainingRecordPrinterController(
      context: context,
      dto: dto,
    ).print();
  }

  void salvarDoc(Future<FileObjectModel?> Function() onSelectFile) async {
    FileObjectModel? fileNew = await onSelectFile();
    if (fileNew == null) return;
    setState(() {
      treinamentoRegistro.doc = fileNew.base64;
      treinamentoRegistro.docNome = fileNew.fileName;
    });
  }

  void excluirDoc() {
    setState(() {
      treinamentoRegistro.doc = null;
      treinamentoRegistro.docNome = null;
    });
  }

  void salvar() {
    if (!txtNome.valid ||
        !txtDescricaoConteudo.valid ||
        !txtEntidade.valid ||
        !txtCargaHoraria.valid ||
        !txtObservacao.valid) {
      return;
    }

    final registrarUsuariosTreinamento = <TreinamentoUsuarioModel>[];

    for (final usuario in treinamentoRegistro.usuariosTreinamentos!) {
      final treinamentoUsuario = TreinamentoUsuarioModel(
        cod: usuario.cod,
        codInstituicao: usuario.codInstituicao,
        codRegistroTreinamento: treinamentoRegistro.cod,
        codUsuario: usuario.codUsuario,
        tstamp: '',
        ultimaAlteracao: null,
      );
      registrarUsuariosTreinamento.add(treinamentoUsuario);
    }
    treinamentoRegistro.usuariosTreinamentos = registrarUsuariosTreinamento;
    cubit.save(treinamentoRegistro);
  }
}
