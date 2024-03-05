import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_service_page_frm_controller.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm_state.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/alert_dialog/form_alert_dialog_widget.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/delete_image_button_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/botoes/upload_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class RegistroServicoPageFrm extends StatefulWidget {
  const RegistroServicoPageFrm({
    Key? key,
    required this.registroServico,
    required this.equipamentoCubit,
    required this.usuarioCubit,
    required this.itemFilter,
    this.equipamentoReadOnly,
    this.itemReadOnly,
  }) : super(key: key);

  final RegistroServicoModel registroServico;
  final EquipamentoCubit equipamentoCubit;
  final ItemFilter itemFilter;
  final UsuarioCubit usuarioCubit;
  final bool? equipamentoReadOnly;
  final bool? itemReadOnly;

  @override
  State<RegistroServicoPageFrm> createState() =>
      _RegistroServicoPageFrmState(registroServico: registroServico);
}

class _RegistroServicoPageFrmState extends State<RegistroServicoPageFrm> {
  _RegistroServicoPageFrmState({required this.registroServico});
  RegistroServicoModel registroServico;

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  late final RegistroServicePageFrmController controller;

  void initState() {
    controller = RegistroServicePageFrmController(
      registroServico: registroServico,
    );
    controller.initialize();

    if (registroServico.cod == 0) {
      recuperaUsuario().then((value) {
        if (value == null ||
            value.usuario == null ||
            value.usuario!.cod == null) {
          return;
        }
        controller.txtUsuarioRegistro.text = value.usuario!.nome ?? '';
        registroServico.usuarioRegistro = value.usuario!.cod.toString();
        registroServico.codUsuario = value.usuario!.cod;
      });
    }

    super.initState();
  }

  late void Function() refreshServicosTipoMethod;
  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    Size size = MediaQuery.of(context).size;
    return BlocListener<RegistroServicoPageFrmCubit,
        RegistroServicoPageFrmState>(
      bloc: controller.cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child:
          BlocBuilder<RegistroServicoPageFrmCubit, RegistroServicoPageFrmState>(
        bloc: controller.cubit,
        builder: (context, state) {
          return FormAlertDialogWidget(
            title: Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: controller.titulo,
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
                            child:
                                BlocBuilder<EquipamentoCubit, EquipamentoState>(
                              bloc: widget.equipamentoCubit,
                              builder: (context, equipamentoState) {
                                if (equipamentoState.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<EquipamentoModel> equipamentos =
                                    equipamentoState.objs;
                                equipamentos.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                return DropDownSearchWidget(
                                  readOnly: widget.equipamentoReadOnly ?? false,
                                  textFunction: (equipamento) =>
                                      equipamento.EquipamentoNomeText(),
                                  initialValue: registroServico.equipamento,
                                  sourceList: equipamentos
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) {
                                    registroServico.codEquipamento =
                                        value?.cod!;
                                    registroServico.equipamento = value;
                                    controller.servicoTipoCubit.reload();
                                    refreshServicosTipoMethod.call();
                                  },
                                  placeholder: 'Equipamento',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: controller.txtLote,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropDownSearchApiWidget(
                              readOnly: widget.itemReadOnly ?? false,
                              textFunction: (item) =>
                                  item.EtiquetaDescricaoText(),
                              initialValue: registroServico.item,
                              search: (str) => ItemService().Filter(
                                widget.itemFilter.copyWith(
                                  termoPesquisa: str,
                                  numeroRegistros: 30,
                                ),
                              ),
                              onChanged: (value) {
                                registroServico.codItem = value?.cod;
                                registroServico.item = value;
                              },
                              placeholder: 'Item',
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child:
                                BlocBuilder<ServicoTipoCubit, ServicoTipoState>(
                              bloc: controller.servicoTipoCubit,
                              builder: (context, state) {
                                List<ServicoTipoModel> servicosTipos =
                                    state.tiposServico;

                                servicosTipos.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                List<ServicoTipoModel> servicos = controller
                                    .buscarServicosEquipamento(servicosTipos);

                                return DropDownSearchWidget<ServicoTipoModel>(
                                  refreshSourceListBuilder:
                                      (context, refreshTipoServicoSourceList) =>
                                          refreshServicosTipoMethod =
                                              refreshTipoServicoSourceList,
                                  initialValue: registroServico.servicoTipo,
                                  sourceList: servicos
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) {
                                    registroServico.servicoTipo = value;
                                    registroServico.codServicosTipos =
                                        value?.cod;
                                  },
                                  placeholder: 'Tipo do Serviço',
                                );
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
                            child: controller.dtpDataInicio,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: controller.tmpHoraInicio,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: controller.dtpDataTermino,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: controller.tmpHoraTermino,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: controller.txtDescricaoServico,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: controller.txtTemperatura,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: controller.txtTemperaturaMax,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: controller.txtTemperaturaMin,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: controller.txtUmidade,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: controller.txtUmidadeMax,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: controller.txtUmidadeMin,
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

                                UsuarioModel? usuario = usuarios
                                    .where(
                                      (element) =>
                                          element.cod.toString() ==
                                          registroServico.tecnico,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (usuario) =>
                                      usuario.CodBarraNomeText(),
                                  initialValue: usuario,
                                  sourceList: usuarios,
                                  onChanged: (value) => registroServico
                                      .tecnico = value?.cod!.toString(),
                                  placeholder: 'Responsável',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: DropDownWidget<RegistroServicoResultOption>(
                              initialValue:
                                  RegistroServicoResultOption.resultOptions
                                      .where(
                                        (element) =>
                                            element.cod ==
                                            registroServico.resultado,
                                      )
                                      .firstOrNull,
                              sourceList:
                                  RegistroServicoResultOption.resultOptions,
                              onChanged: (value) => registroServico.resultado =
                                  value.cod.toString(),
                              placeholder: 'Resultado',
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
                            child: controller.dtpDataValidade,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Row(
                              children: [
                                CustomCheckboxWidget(
                                  checked: registroServico.controlarValidade,
                                  onClick: (value) =>
                                      registroServico.controlarValidade = value,
                                  text: 'Controlar Validade',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: controller.txtUsuarioRegistro,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: controller.dtpDataRegistro,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: LabelStringWidget(
                        text:
                            'Documento Anexado: ${registroServico.docAnexaNome == null ? 'Nenhum Documento Encontrado' : registroServico.docAnexaNome}',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            runSpacing: 16 * paddingHorizontalScale,
                            spacing: 16 * paddingHorizontalScale,
                            children: [
                              UploadButtonWidget(
                                placeholder: 'Anexar DOC',
                                imageSelected: (value1, value2) {
                                  salvarArquivo(value1, value2);
                                },
                              ),
                              DeleteImageButtonWidget(
                                placeholder: 'Excluir DOC',
                                onPressed: registroServico.docAnexa == null
                                    ? null
                                    : () => {excluirArquivo()},
                              ),
                              OpenDocWidget(
                                placeholder: 'Abrir DOC',
                                documentoString: registroServico.docAnexa,
                                documentName: registroServico.docAnexaNome ??
                                    'arquivo sem nome.jpg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 14.0)),
                  ],
                ),
              ),
            ),
            actions: [
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
                        registroServico = RegistroServicoModel.empty();
                        controller.setFields();
                      }),
                    },
                  ),
                  CancelButtonUnfilledWidget(
                    onPressed: () => {Navigator.of(context).pop((false, ''))},
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void salvarArquivo(String value1, String value2) {
    setState(() {
      registroServico.docAnexa = value1;
      registroServico.docAnexaNome = value2;
    });
  }

  void excluirArquivo() {
    setState(() {
      registroServico.docAnexa = null;
      registroServico.docAnexaNome = null;
    });
  }

  void salvar() {
    if (!controller.txtDescricaoServico.valid ||
        !controller.txtLote.valid ||
        !controller.txtUsuarioRegistro.valid) return;

    if (registroServico.codItem == null &&
        registroServico.codEquipamento == null) {
      ErrorUtils.showErrorDialog(
        context,
        ['Deve ser informado um Equipamento ou Item'],
      );
      return;
    }

    if (registroServico.codItem != null &&
        registroServico.codEquipamento != null) {
      ErrorUtils.showErrorDialog(
        context,
        ['Item ou Equipamento, apenas um pode ser informado'],
      );
      return;
    }
    controller.cubit.save(registroServico);
  }
}
