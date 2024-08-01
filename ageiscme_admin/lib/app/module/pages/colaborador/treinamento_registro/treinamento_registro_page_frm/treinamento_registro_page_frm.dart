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
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_hour_minute_widget.dart';
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
    required this.onCancel,
    required this.onSaved,
  }) : super(key: key);

  final TreinamentoRegistroModel treinamentoRegistro;
  final UsuarioCubit usuarioCubit;
  final void Function(String) onSaved;
  final void Function() onCancel;

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
    placeholder: 'Nome *',
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

  late bool Function() dataValidate;
  late final DatePickerWidget dtpData = DatePickerWidget(
    validateBuilder: (context, validateMethodBuilder) =>
        dataValidate = validateMethodBuilder,
    validator: (date) => date == null ? 'Obrigatório' : null,
    placeholder: 'Data *',
    onDateSelected: (value) => treinamentoRegistro.data = value,
    initialValue: treinamentoRegistro.data,
  );

  late TextFieldHourMinuteWidget txtCargaHoraria = TextFieldHourMinuteWidget(
    placeholder: 'Carga Horária (Horas) *',
    initialValue: treinamentoRegistro.cargaHoraria == null
        ? null
        : decimalToString(treinamentoRegistro.cargaHoraria!),
    onComplete: (text) {
      if (text.isEmpty) {
        treinamentoRegistro.cargaHoraria = null;
        return;
      }
      treinamentoRegistro.cargaHoraria = stringToDecimal(text);
    },
  );

  double stringToDecimal(String time) {
    List<String> parts = time.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    return hours + (minutes / 60.0);
  }

  String decimalToString(double decimal) {
    int hours = decimal.truncate();
    int minutes = ((decimal - hours) * 60).round();
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    return '$hoursStr:$minutesStr';
  }

  late final TextFieldStringAreaWidget txtObservacao =
      TextFieldStringAreaWidget(
    placeholder: 'Observação',
    onChanged: (String? str) {
      treinamentoRegistro.observacao = txtObservacao.text;
    },
  );

  final ScrollController scroll = ScrollController();

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
      txtCargaHoraria.text = decimalToString(treinamentoRegistro.cargaHoraria!);
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
    return BlocBuilder<TreinamentoRegistroPageFrmCubit,
        TreinamentoRegistroPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: titulo,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: size.width * .5,
                        minHeight: size.height * .5,
                        maxHeight: size.height * .8,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
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
                                          removerUsuarioTreinamento();
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
                                          adicionarUsuarioTreinamento();
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
                                    child:
                                        BlocBuilder<UsuarioCubit, UsuarioState>(
                                      bloc: widget.usuarioCubit,
                                      builder: (context, usuarioState) {
                                        if (usuarioState.loading) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }
                                        List<UsuarioModel> usuarios =
                                            usuarioState.usuarios;
                                        List<UsuarioModel> usuariosPresentes =
                                            [];
                                        if (treinamentoRegistro
                                                .usuariosTreinamentos !=
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
                                                        usuario.cod ==
                                                        codUsuario,
                                                  )
                                                  .firstOrNull;
                                              if (usuarioPresente != null) {
                                                usuariosPresentes
                                                    .add(usuarioPresente);
                                              }
                                            }
                                          }
                                        }

                                        return ListFieldWidget<UsuarioModel>(
                                          onDoubleTap: (p0) =>
                                              removerUsuarioTreinamentoUsuario(
                                            p0,
                                          ),
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
                                    child:
                                        BlocBuilder<UsuarioCubit, UsuarioState>(
                                      bloc: widget.usuarioCubit,
                                      builder: (context, usuarioState) {
                                        if (usuarioState.loading) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }
                                        List<UsuarioModel> usuarios =
                                            usuarioState.usuarios;
                                        if (treinamentoRegistro
                                                .usuariosTreinamentos ==
                                            null) {
                                          treinamentoRegistro
                                              .usuariosTreinamentos = [];
                                        }
                                        List<UsuarioModel>
                                            colaboradoresAusentes = usuarios
                                                .where(
                                                  (usuario) =>
                                                      !treinamentoRegistro
                                                          .usuariosTreinamentos!
                                                          .any(
                                                    (treinamento) =>
                                                        treinamento
                                                            .codUsuario ==
                                                        usuario.cod,
                                                  ),
                                                )
                                                .toList();
                                        return ListFieldWidget<UsuarioModel>(
                                          onDoubleTap: (p0) =>
                                              adicionarUsuarioTreinamentoUsuario(
                                            p0,
                                          ),
                                          sourceList: colaboradoresAusentes,
                                          removeButton: false,
                                          onItemSelected: (selectedUsuario) {
                                            setState(() {
                                              usuarioAdicionar =
                                                  selectedUsuario;
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
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    if (treinamentoRegistro.cod != null &&
                        treinamentoRegistro.cod != 0)
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
                        title:
                            'Registro de Treinamento ${treinamentoRegistro.cod}',
                        child: HistoricoPage(
                          pk: treinamentoRegistro.cod!,
                          termo: 'TREINAMENTO_REGISTRO',
                        ),
                        context: context,
                      ),
                  ],
                ),
                LabelStringWidget(
                  text:
                      '${treinamentoRegistro.docNome == null ? '' : 'Documento: ' + treinamentoRegistro.docNome.toString()}',
                ),
                const Spacer(),
                Wrap(
                  spacing: 16 * paddingHorizontalScale,
                  runSpacing: 16 * paddingHorizontalScale,
                  alignment: WrapAlignment.end,
                  children: [
                    SaveButtonWidget(
                      onPressed: salvar,
                    ),
                    CleanButtonWidget(
                      onPressed: () => {
                        setState(() {
                          treinamentoRegistro =
                              TreinamentoRegistroModel.empty();
                          dtpData.setValue(null);
                        }),
                      },
                    ),
                    CancelButtonUnfilledWidget(
                      onPressed: widget.onCancel,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void removerUsuarioTreinamento() {
    if (usuarioRemover == null) return;
    removerUsuarioTreinamentoUsuario(usuarioRemover!);
    usuarioRemover = null;
  }

  void removerUsuarioTreinamentoUsuario(UsuarioModel usuario) {
    setState(() {
      if (treinamentoRegistro.usuariosTreinamentos != null) {
        treinamentoRegistro.usuariosTreinamentos!.removeWhere(
          (element) => element.codUsuario == usuarioRemover!.cod,
        );
      }
    });
  }

  void adicionarUsuarioTreinamento() {
    if (usuarioAdicionar == null) return;
    adicionarUsuarioTreinamentoUsuario(usuarioAdicionar!);
    usuarioAdicionar = null;
  }

  void adicionarUsuarioTreinamentoUsuario(UsuarioModel usuario) {
    setState(() {
      if (treinamentoRegistro.usuariosTreinamentos == null) {
        treinamentoRegistro.usuariosTreinamentos = [];
      }
      TreinamentoUsuarioModel treinamentoUsuario =
          TreinamentoUsuarioModel.empty();
      treinamentoUsuario.codUsuario = usuario.cod;
      treinamentoRegistro.usuariosTreinamentos!.add(treinamentoUsuario);
    });
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
    bool nomeValid = txtNome.valid;
    bool descricaoValid = txtDescricaoConteudo.valid;
    bool entidadeValid = txtEntidade.valid;
    bool cargaHorariaValid = txtCargaHoraria.valid;
    bool observacaoValid = txtObservacao.valid;
    bool dataValid = dataValidate();
    if (!nomeValid) {
      scroll.jumpTo(0);
    } else if (!dataValid || !cargaHorariaValid) {
      scroll.jumpTo(220);
    }

    if (!nomeValid ||
        !descricaoValid ||
        !entidadeValid ||
        !cargaHorariaValid ||
        !observacaoValid ||
        !dataValid) {
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
    cubit.save(treinamentoRegistro, widget.onSaved);
  }
}
