import 'dart:convert';

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/perfil_acesso/perfil_acesso_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_frm/usuario_page_frm_helper.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_frm/usuario_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/alterar_senha_padrao/alterar_senha_padrao_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/alterar_senha_padrao/alterar_senha_padrao_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/list_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_image_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/images/image_memory_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/clipboard/clipboard_helper.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class UsuarioPageFrm extends StatefulWidget {
  const UsuarioPageFrm({
    Key? key,
    required this.usuario,
    required this.onSaved,
    required this.onCancel,
    required this.usuarioAtualPossuiPerfilRestrito,
  }) : super(key: key);

  final UsuarioModel usuario;
  final void Function() onSaved;
  final void Function() onCancel;
  final bool usuarioAtualPossuiPerfilRestrito;

  @override
  State<UsuarioPageFrm> createState() => _UsuarioPageFrmState(usuario: usuario);
}

class _UsuarioPageFrmState extends State<UsuarioPageFrm> {
  _UsuarioPageFrmState({
    required this.usuario,
  });
  late String titulo;
  late final PerfilAcessoCubit perfilAcessoCubit;
  UsuarioModel usuario;
  PerfilAcessoModel? perflAcessoRemover;
  PerfilAcessoModel? perfilAcessoAdicionar;

  late final UsuarioPageFrmCubit cubit = UsuarioPageFrmCubit(
    usuarioModel: usuario,
    service: UsuarioService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      usuario.nome = txtNome.text;
    },
  );

  late final TextFieldStringWidget txtLogin = TextFieldStringWidget(
    placeholder: 'Login *',
    onChanged: (String? str) {
      usuario.login = txtLogin.text;
    },
  );

  late final TextFieldNumberWidget txtRg = TextFieldNumberWidget(
    placeholder: 'RG *',
    onChanged: (String? str) {
      usuario.rg = int.parse(txtRg.text.replaceAll('.', ''));
    },
  );

  late final TextFieldStringWidget txtCodBarra = TextFieldStringWidget(
    placeholder: 'Código de Barra',
    readOnly: true,
    suffixWidget: InkWell(
      onTap: () => ClipboardHelper.copy(
        context: context,
        text: txtCodBarra.text,
      ),
      child: const Icon(Icons.copy),
    ),
  );

  late final TextFieldStringWidget txtNomeEmpresa = TextFieldStringWidget(
    placeholder: 'Nome da Empresa',
    onChanged: (String? str) {
      usuario.nomeEmpresa = txtNomeEmpresa.text;
    },
  );

  late final TextFieldStringWidget txtDocClasse = TextFieldStringWidget(
    placeholder: 'Doc Classe',
    onChanged: (String? str) {
      usuario.docClasse = txtDocClasse.text;
    },
  );

  late final TextFieldStringWidget txtSenha = TextFieldStringWidget(
    placeholder: 'Senha',
    password: true,
    onChanged: (String? str) {
      usuario.senha = txtSenha.text;
    },
  );

  Image? image;

  final ScrollController scroll = ScrollController();

  @override
  void initState() {
    perfilAcessoCubit = PerfilAcessoCubit();
    perfilAcessoCubit.loadAll();

    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 250) {
        return 'Pode ter no máximo 250 caracteres';
      }
      return '';
    });

    txtSenha.addValidator((String str) {
      if (usuario.cod == 0 && str.isEmpty) {
        return 'Obrigatório para novos usuários';
      } else if (str.isNotEmpty && str != '123456' && str.length <= 7) {
        return 'Deve ter no mínimo 8 caracteres';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtLogin.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 20) {
        return 'Pode ter no máximo 20 caracteres';
      }
      return '';
    });

    txtRg.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtDocClasse.addValidator((String str) {
      if (str.length > 25) {
        return 'Pode ter no máximo 25 caracteres';
      }
      return '';
    });

    txtNomeEmpresa.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });
    setFields();
    setUserImage();

    super.initState();
  }

  void setUserImage() {
    image = usuario.foto != null && !usuario.foto!.isEmpty
        ? Image.memory(base64Decode(usuario.foto!))
        : null;
  }

  @override
  void dispose() {
    cubit.close();
    perfilAcessoCubit.close();
    super.dispose();
  }

  void setFields() {
    txtLogin.text = usuario.login?.toString() ?? '';
    txtNome.text = usuario.nome?.toString() ?? '';
    txtSenha.text = usuario.senha?.toString() ?? '';
    txtCodBarra.text = usuario.codBarra == null || usuario.codBarra == 0
        ? ''
        : usuario.codBarra.toString();
    txtDocClasse.text = usuario.docClasse?.toString() ?? '';
    txtNomeEmpresa.text = usuario.nomeEmpresa?.toString() ?? '';
    txtRg.text =
        usuario.rg == 0 || usuario.rg == null ? '' : usuario.rg.toString();

    titulo = 'Cadastro de Usuários';
    if (usuario.cod != 0) {
      titulo = 'Edição de Usuário: ${usuario.cod} - ${usuario.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<UsuarioPageFrmCubit, UsuarioPageFrmState>(
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
                              padding: const EdgeInsets.only(top: 3.0),
                              child: txtNome,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: txtLogin,
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    flex: 6,
                                    child: txtSenha,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: txtRg,
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    flex: 6,
                                    child: txtCodBarra,
                                  ),
                                ],
                              ),
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
                                        checked: usuario.ativo,
                                        onClick: (value) =>
                                            usuario.ativo = value,
                                        text: 'Ativo',
                                        align: MainAxisAlignment.start,
                                      ),
                                      // const Padding(padding: EdgeInsets.only(top: 5.0)),
                                      // CustomCheckboxWidget(
                                      //   checked: usuario.controleGestao,
                                      //   onClick: (value) =>
                                      //       usuario.controleGestao = value,
                                      //   text: 'Controlar Acesso Operacional',
                                      //   align: MainAxisAlignment.start,
                                      // ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                      ),
                                      CustomCheckboxWidget(
                                        checked: usuario.colaborador,
                                        onClick: (value) =>
                                            usuario.colaborador = value,
                                        text:
                                            'Colaborador - Registro de EPI / Manutenção',
                                        align: MainAxisAlignment.start,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: ImageMemoryDisplayWidget(
                                          image: image,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: txtNomeEmpresa,
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    flex: 6,
                                    child: txtDocClasse,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Perfis do Usuário',
                                      style: Fontes.getRoboto(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: Text(
                                      'Perfis Disponíveis',
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
                                        if (perflAcessoRemover != null) {
                                          removerDireitoUsuario();
                                        } else {
                                          ToastUtils.showCustomToastError(
                                            context,
                                            'Nenhum Perfil de Acesso selecionado',
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
                                        if (perfilAcessoAdicionar != null) {
                                          adicionarDireitoUsuario();
                                        } else {
                                          ToastUtils.showCustomToastError(
                                            context,
                                            'Nenhum Perfil de Acesso selecionado',
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
                                    child: BlocBuilder<PerfilAcessoCubit,
                                        List<PerfilAcessoModel>>(
                                      bloc: perfilAcessoCubit,
                                      builder: (context, perfisAcessos) {
                                        List<PerfilAcessoModel>
                                            perfisAcessosAdicionado = [];

                                        if (usuario.usuariosPerfis != null) {
                                          for (final usuarioPerfil
                                              in usuario.usuariosPerfis!) {
                                            final codPerfil =
                                                usuarioPerfil.codPerfil;

                                            if (perfisAcessos.isNotEmpty) {
                                              final perfilAcessoAdicionado =
                                                  perfisAcessos
                                                      .where(
                                                        (perfilAcesso) =>
                                                            perfilAcesso.cod ==
                                                            codPerfil,
                                                      )
                                                      .firstOrNull;
                                              if (perfilAcessoAdicionado !=
                                                  null) {
                                                perfisAcessosAdicionado.add(
                                                  perfilAcessoAdicionado,
                                                );
                                              }
                                            }
                                          }
                                        }

                                        perfisAcessosAdicionado.sort(
                                          (a, b) => a.descricao!
                                              .compareTo(b.descricao!),
                                        );

                                        return ListFieldWidget<
                                            PerfilAcessoModel>(
                                          onDoubleTap: (p0) =>
                                              removerDireitoUsuarioPerfil(p0),
                                          sourceList: perfisAcessosAdicionado,
                                          removeButton: false,
                                          onItemSelected:
                                              (selectedPerfilusuario) {
                                            setState(() {
                                              perflAcessoRemover =
                                                  selectedPerfilusuario;
                                            });
                                          },
                                          itemText: (perfilUsuario) {
                                            return perfilUsuario.descricao!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: BlocBuilder<PerfilAcessoCubit,
                                        List<PerfilAcessoModel>>(
                                      bloc: perfilAcessoCubit,
                                      builder: (context, perfisAcessos) {
                                        if (usuario.usuariosPerfis == null) {
                                          usuario.usuariosPerfis = [];
                                        }

                                        List<PerfilAcessoModel>
                                            perfisAcessosDisponiveis =
                                            perfisAcessos
                                                .where(
                                                  (perfilAcesso) => !usuario
                                                      .usuariosPerfis!
                                                      .any(
                                                    (usuarioPerfil) =>
                                                        usuarioPerfil
                                                            .codPerfil ==
                                                        perfilAcesso.cod,
                                                  ),
                                                )
                                                .toList();

                                        perfisAcessosDisponiveis.sort(
                                          (a, b) => a.descricao!
                                              .compareTo(b.descricao!),
                                        );

                                        return ListFieldWidget<
                                            PerfilAcessoModel>(
                                          onDoubleTap: (p0) =>
                                              adicionarDireitoUsuarioPerfil(p0),
                                          sourceList: perfisAcessosDisponiveis
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
                                              .toList(),
                                          removeButton: false,
                                          ignorarExibicaoItens: (p0) =>
                                              p0.perfilRestrito == true &&
                                              widget.usuarioAtualPossuiPerfilRestrito !=
                                                  true,
                                          onItemSelected:
                                              (selectedPerfilUsuario) {
                                            setState(() {
                                              perfilAcessoAdicionar =
                                                  selectedPerfilUsuario;
                                            });
                                          },
                                          itemText: (perfilUsuario) {
                                            return perfilUsuario.descricao!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 24)),
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
                    CustomPopupItemImageModel.getImageItem(
                      'Anexar Foto',
                      salvarFoto,
                    ),
                    CustomPopupItemModel(
                      text: 'Excluir Foto',
                      onTap: usuario.foto != null ? excluirFoto : null,
                    ),
                    if (usuario.cod != null && usuario.cod != 0)
                      CustomPopupItemModel(
                        text: 'Imprimir Etiqueta',
                        onTap: printTag,
                      ),
                    if (usuario.cod != null && usuario.cod != 0)
                      CustomPopupItemModel(
                        text: 'Resetar Senha',
                        onTap: alterarSenhaParaPadrao,
                      ),
                    if (usuario.cod != null && usuario.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Usuário ${usuario.cod!}',
                        child: HistoricoPage(
                          pk: usuario.cod!,
                          termo: 'USUARIO',
                        ),
                        context: context,
                      ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: UpdateButtonWidget(
                    readonly: usuario.cod == 0 || usuario.cod == null,
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
                        usuario = UsuarioModel.empty();
                        setFields();
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
        );
      },
    );
  }

  void adicionarDireitoUsuario() {
    if (perfilAcessoAdicionar == null) return;
    adicionarDireitoUsuarioPerfil(perfilAcessoAdicionar!);
    perfilAcessoAdicionar = null;
  }

  void adicionarDireitoUsuarioPerfil(PerfilAcessoModel perfil) {
    setState(() {
      if (usuario.usuariosPerfis == null) {
        usuario.usuariosPerfis = [];
      }
      UsuarioPerfilModel usuarioPerfil = UsuarioPerfilModel.empty();
      usuarioPerfil.codPerfil = perfil.cod;
      usuario.usuariosPerfis!.add(usuarioPerfil);
    });
  }

  void removerDireitoUsuario() {
    if (perflAcessoRemover == null) return;
    removerDireitoUsuarioPerfil(perflAcessoRemover!);
    perflAcessoRemover = null;
  }

  void removerDireitoUsuarioPerfil(PerfilAcessoModel perfil) {
    setState(() {
      if (usuario.usuariosPerfis != null) {
        usuario.usuariosPerfis!.removeWhere(
          (element) => element.codPerfil == perfil.cod,
        );
      }
    });
  }

  void salvarFoto(Future<ImageObjectModel?> Function() onSelectImage) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      usuario.foto = imageNew.base64;
      setUserImage();
    });
  }

  void excluirFoto() {
    setState(() {
      usuario.foto = null;
      setUserImage();
    });
  }

  void alterarSenhaParaPadrao() async {
    if (usuario.cod == 0 || usuario.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Usuário precisa estar criado para alterar a senha para a padrão',
      );
      return;
    }
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a alteração da senha do Usuário\n${usuario.cod} - ${usuario.nome} para a senha Padrão 123456?',
      onConfirm: onConfirmResetPasssword,
    );
  }

  void onConfirmResetPasssword() async {
    (String, UsuarioModel)? result =
        await AlterarSenhaPadraoService().changePassword(
      AlterarSenhaPadraoDTO(
        codUsuario: usuario.cod!,
      ),
    );
    if (result == null) return;
    usuario.tstamp = result.$2.tstamp;
    print(result.$2.tstamp);
    ToastUtils.showCustomToastSucess(context, result.$1);
  }

  void printTag() {
    if (usuario.codBarra == null || usuario.nome == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o usuário cadastrado para permitir a impressão da etiqueta',
      );
      return;
    }
    UsuarioPageFrmHelper.printTag(usuario.codBarra!, usuario.nome!, context);
  }

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
    bool nomeValid = txtNome.valid;
    bool loginValid = txtLogin.valid;
    bool rgValid = txtRg.valid;
    bool docClasseValid = txtDocClasse.valid;
    bool senhaValid = txtSenha.valid;
    bool empresaValid = txtNomeEmpresa.valid;
    if (!nomeValid) {
      scroll.jumpTo(0);
    } else if (!loginValid) {
      scroll.jumpTo(40);
    } else if (!rgValid) {
      scroll.jumpTo(90);
    }

    if (!nomeValid ||
        !loginValid ||
        !rgValid ||
        !docClasseValid ||
        !senhaValid ||
        !empresaValid) return;

    final registrarUsuariosPerfis = <UsuarioPerfilModel>[];

    for (final perfilUsuario in usuario.usuariosPerfis!) {
      final usuarioPerfil = UsuarioPerfilModel(
        cod: novo ? 0 : perfilUsuario.cod,
        codInstituicao: perfilUsuario.codInstituicao,
        codPerfil: perfilUsuario.codPerfil,
        codUsuario: novo ? usuario.cod : 0,
        direitos: null,
        tstamp: '',
        ultimaAlteracao: null,
        usuario: null,
      );
      registrarUsuariosPerfis.add(usuarioPerfil);
    }
    usuario.usuariosPerfis = registrarUsuariosPerfis;
    cubit.save(
      novo
          ? usuario.copyWith(
              cod: 0,
              tstamp: null,
              senha: usuario.senha ?? '123456',
            )
          : usuario,
      widget.onSaved,
      context,
    );
  }
}
