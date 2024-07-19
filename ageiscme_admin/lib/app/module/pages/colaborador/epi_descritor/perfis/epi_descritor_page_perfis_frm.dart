// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_data/services/epi_perfil/epi_perfil_service.dart';
import 'package:ageiscme_models/dto/epi_perfil/insert/epi_perfil_insert_dto.dart';
import 'package:ageiscme_models/dto/epi_perfil/remove/epi_perfil_remove_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/find_by_epi/perfis/epi_perfil_find_by_epi_perfil_response_dto.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/insert/epi_perfil_insert_response_dto.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/remove/epi_perfil_remove_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/list_button_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:flutter/material.dart';

class EpiDescritorPagePerfisFrm extends StatefulWidget {
  const EpiDescritorPagePerfisFrm({
    required this.perfisAcesso,
    required this.perfisVinculados,
    required this.codDescritor,
    required this.onClose,
    Key? key,
  }) : super(key: key);

  final List<PerfilAcessoModel> perfisAcesso;
  final List<EpiPerfilFindByEpiPerfilResponseDTO> perfisVinculados;
  final int codDescritor;
  final void Function() onClose;

  @override
  State<EpiDescritorPagePerfisFrm> createState() =>
      _EpiDescritorPagePerfisFrmState(
        perfisAcesso: perfisAcesso,
        perfisVinculados: perfisVinculados,
      );
}

class _EpiDescritorPagePerfisFrmState extends State<EpiDescritorPagePerfisFrm> {
  _EpiDescritorPagePerfisFrmState({
    required this.perfisAcesso,
    required this.perfisVinculados,
  });
  List<PerfilAcessoModel> perfisAcesso;
  List<EpiPerfilFindByEpiPerfilResponseDTO> perfisVinculados;
  int? codPerfilIncluir;
  int? codRemover;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: TitleWidget(
                text: 'Vinculação De Perfis a Descritor de EPI',
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
                    minWidth: size.width * 0.5,
                    maxWidth: size.width * 0.8,
                    minHeight: 400,
                    maxHeight: 2000,
                  ),
                  height: size.height * 0.8,
                  child: SingleChildScrollView(
                    controller: scroll,
                    padding: const EdgeInsets.only(right: 14),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Perfis do EPI',
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
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListButtonWidget(
                                        text: 'Remover Perfil',
                                        icon: Icons.arrow_forward,
                                        onPressed: () {
                                          if (codRemover != null) {
                                            removePerfil(codRemover!);
                                          } else {
                                            ToastUtils.showCustomToastError(
                                              context,
                                              'Nenhum Perfil selecionado',
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25.0),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListButtonWidget(
                                        text: 'Incluir Perfil',
                                        icon: Icons.arrow_back,
                                        onPressed: () {
                                          if (codPerfilIncluir != null) {
                                            includePerfil(codPerfilIncluir!);
                                          } else {
                                            ToastUtils.showCustomToastError(
                                              context,
                                              'Nenhum Perfil selecionado',
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
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
                                child: Builder(
                                  builder: (context) {
                                    List<EpiPerfilFindByEpiPerfilResponseDTO>
                                        perfis = perfisVinculados;

                                    return ListFieldWidget<
                                        EpiPerfilFindByEpiPerfilResponseDTO>(
                                      sourceList: perfis,
                                      removeButton: false,
                                      onDoubleTap: (p0) => removePerfil(p0.cod),
                                      onItemSelected: (selected) {
                                        setState(() {
                                          codRemover = selected?.cod;
                                        });
                                      },
                                      itemText: (perfil) {
                                        String descricao =
                                            'Sem perfil cadastrado';
                                        PerfilAcessoModel? acesso =
                                            widget.perfisAcesso
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      perfil.codPerfil,
                                                )
                                                .firstOrNull;
                                        if (acesso != null) {
                                          descricao = acesso.descricao ??
                                              'Perfil sem descrição';
                                        }
                                        return descricao;
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 25.0),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    List<PerfilAcessoModel> perfisAtivos =
                                        perfisAcesso
                                            .where(
                                              (element) =>
                                                  element.ativo == true &&
                                                  !perfisVinculados
                                                      .map((e) => e.codPerfil)
                                                      .contains(element.cod),
                                            )
                                            .toList();

                                    return ListFieldWidget<PerfilAcessoModel>(
                                      onDoubleTap: (p0) =>
                                          includePerfil(p0.cod!),
                                      sourceList: perfisAtivos,
                                      removeButton: false,
                                      onItemSelected: (selected) {
                                        codPerfilIncluir = selected?.cod;
                                      },
                                      itemText: (direito) {
                                        return direito.descricao!;
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
            const Spacer(),
            CancelButtonUnfilledWidget(
              onPressed: fechar,
              text: 'Fechar',
            ),
          ],
        ),
      ],
    );
  }

  void fechar() {
    widget.onClose();
  }

  Future includePerfil(int codPerfil) async {
    (String, EpiPerfilInsertResponseDTO)? result =
        await EpiPerfilService().insert(
      EpiPerfilInsertDTO(
        codDescritor: widget.codDescritor,
        codPerfil: codPerfil,
      ),
    );
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    setState(() {
      perfisVinculados.add(
        EpiPerfilFindByEpiPerfilResponseDTO(
          cod: result.$2.cod,
          codPerfil: codPerfil,
        ),
      );
    });
  }

  Future removePerfil(int cod) async {
    (String, EpiPerfilRemoveResponseDTO)? result =
        await EpiPerfilService().remove(
      EpiPerfilRemoveDTO(
        cod: cod,
      ),
    );
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    setState(() {
      perfisVinculados.removeWhere(
        (item) => item.cod == cod,
      );
    });
  }
}
