import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/peca/peca_subit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/equipamento_manutencao_page_frm/equipamento_manutencao_page_frm_controller.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/equipamento_manutencao_page_frm/equipamento_manutencao_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/equipamento_manutencao/equipamento_manutencao_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/file_helper/file_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class EquipamentoManutencaoPageFrm extends StatefulWidget {
  const EquipamentoManutencaoPageFrm({
    Key? key,
    required this.equipamentoManutencao,
    required this.equipamentoCubit,
  }) : super(key: key);

  final EquipamentoManutencaoModel equipamentoManutencao;
  final EquipamentoCubit equipamentoCubit;

  @override
  State<EquipamentoManutencaoPageFrm> createState() =>
      _EquipamentoManutencaoPageFrmState(
        equipamentoManutencao: equipamentoManutencao,
      );
}

class _EquipamentoManutencaoPageFrmState
    extends State<EquipamentoManutencaoPageFrm> {
  _EquipamentoManutencaoPageFrmState({required this.equipamentoManutencao});

  late String titulo;
  EquipamentoManutencaoModel equipamentoManutencao;
  late DateTime? dataHoraInicioSelecionada;
  late DateTime? dataHoraTerminoSelecionada;
  late DateTime? dataHoraParadaSelecionada;

  late final ServicoTipoCubit servicoTipoCubit;
  late final PecaCubit pecaCubit;
  late final EquipamentoManutencaoPageFrmController _controller;

  late final EquipamentoManutencaoPageFrmCubit cubit =
      EquipamentoManutencaoPageFrmCubit(
    equipamentoManutencaoModel: equipamentoManutencao,
    service: EquipamentoManutencaoService(),
  );

  late final TextFieldStringWidget txtProblema = TextFieldStringWidget(
    placeholder: 'Problema',
    onChanged: (String? str) {
      equipamentoManutencao.problema = txtProblema.text;
    },
  );

  late final TextFieldStringWidget txtDescricaoServico = TextFieldStringWidget(
    placeholder: 'Descrição do Problema *',
    onChanged: (String? str) {
      equipamentoManutencao.descricao = txtDescricaoServico.text;
    },
  );

  late final TextFieldStringWidget txtNumNF = TextFieldStringWidget(
    placeholder: 'Num. NF',
    onChanged: (String? str) {
      equipamentoManutencao.numNF = txtNumNF.text;
    },
  );

  late final TextFieldStringWidget txtUsuarioRegistro = TextFieldStringWidget(
    placeholder: 'Usuário Registro',
    readOnly: true,
  );

  late final TextFieldNumberWidget txtQtde1 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde1 = double.parse(txtQtde1.text);
    },
  );

  late final TextFieldNumberWidget txtQtde2 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde2 = double.parse(txtQtde2.text);
    },
  );

  late final TextFieldNumberWidget txtQtde3 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde3 = double.parse(txtQtde3.text);
    },
  );

  late final TextFieldNumberWidget txtQtde4 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde4 = double.parse(txtQtde4.text);
    },
  );

  late final TextFieldNumberWidget txtQtde5 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde5 = double.parse(txtQtde5.text);
    },
  );

  late final TextFieldNumberFloatWidget txtValor1 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor1 = double.parse(txtValor1.text);
    },
  );

  late final TextFieldNumberFloatWidget txtValor2 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor2 = double.parse(txtValor2.text);
    },
  );

  late final TextFieldNumberFloatWidget txtValor3 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor3 = double.parse(txtValor3.text);
    },
  );

  late final TextFieldNumberFloatWidget txtValor4 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor4 = double.parse(txtValor4.text);
    },
  );

  late final TextFieldNumberFloatWidget txtValor5 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor5 = double.parse(txtValor5.text);
    },
  );

  late final DatePickerWidget dtpGarantia1 = DatePickerWidget(
    placeholder: 'Garantia',
    initialValue: equipamentoManutencao.garantia1,
    onDateSelected: (value) => equipamentoManutencao.garantia1 = value,
  );

  late final DatePickerWidget dtpGarantia2 = DatePickerWidget(
    placeholder: 'Garantia',
    onDateSelected: (value) => equipamentoManutencao.garantia2 = value,
    initialValue: equipamentoManutencao.garantia2,
  );

  late final DatePickerWidget dtpGarantia3 = DatePickerWidget(
    placeholder: 'Garantia',
    onDateSelected: (value) => equipamentoManutencao.garantia3 = value,
    initialValue: equipamentoManutencao.garantia3,
  );

  late final DatePickerWidget dtpGarantia4 = DatePickerWidget(
    placeholder: 'Garantia',
    onDateSelected: (value) => equipamentoManutencao.garantia4 = value,
    initialValue: equipamentoManutencao.garantia4,
  );

  late final DatePickerWidget dtpGarantia5 = DatePickerWidget(
    placeholder: 'Garantia',
    onDateSelected: (value) => equipamentoManutencao.garantia5 = value,
    initialValue: equipamentoManutencao.garantia5,
  );

  late final TextFieldStringWidget txtNumSerie1 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie1 = txtNumSerie1.text;
    },
  );

  late final TextFieldStringWidget txtNumSerie2 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie2 = txtNumSerie2.text;
    },
  );

  late final TextFieldStringWidget txtNumSerie3 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie3 = txtNumSerie3.text;
    },
  );

  late final TextFieldStringWidget txtNumSerie4 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie4 = txtNumSerie4.text;
    },
  );

  late final TextFieldStringWidget txtNumSerie5 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie5 = txtNumSerie5.text;
    },
  );

  late DatePickerWidget dtpDataRegistro = DatePickerWidget(
    placeholder: 'Data Registro',
    readOnly: true,
    onDateSelected: (value) => equipamentoManutencao.dataRegistro = value,
    initialValue: equipamentoManutencao.dataRegistro,
  );

  late final TimePickerWidget tmpHoraRegistro = TimePickerWidget(
    placeholder: 'Hora Registro',
    readOnly: true,
    initialValue: TimeOfDay.fromDateTime(equipamentoManutencao.dataRegistro!),
  );

  late final DatePickerWidget dtpDataValidade = DatePickerWidget(
    placeholder: 'Validade',
    onDateSelected: (value) => equipamentoManutencao.validade = value,
    initialValue: equipamentoManutencao.validade,
  );

  late final DatePickerWidget dtpDataInicio = DatePickerWidget(
    placeholder: 'Data Início',
    onDateSelected: (value) {
      if (value == null) {
        equipamentoManutencao.dataInicio = null;
        return;
      }
      equipamentoManutencao.dataInicio = DateTime(
        value.year,
        value.month,
        value.day,
        equipamentoManutencao.dataInicio?.hour ?? 0,
        equipamentoManutencao.dataInicio?.minute ?? 0,
      );
    },
    initialValue: equipamentoManutencao.dataInicio,
  );

  late final TimePickerWidget tmpHoraInicio = TimePickerWidget(
    placeholder: 'Hora Início',
    initialValue: equipamentoManutencao.dataInicio != null
        ? TimeOfDay.fromDateTime(equipamentoManutencao.dataInicio!)
        : const TimeOfDay(hour: 0, minute: 0),
    onTimeSelected: (value) {
      if (equipamentoManutencao.dataInicio == null) {
        return;
      }
      equipamentoManutencao.dataInicio = DateTime(
        equipamentoManutencao.dataInicio!.year,
        equipamentoManutencao.dataInicio!.month,
        equipamentoManutencao.dataInicio!.day,
        value?.hour ?? 0,
        value?.minute ?? 0,
      );
    },
  );

  late final DatePickerWidget dtpDataTermino = DatePickerWidget(
    placeholder: 'Data Término',
    onDateSelected: (value) {
      if (value == null) {
        equipamentoManutencao.dataTermino = null;
        return;
      }
      equipamentoManutencao.dataTermino = DateTime(
        value.year,
        value.month,
        value.day,
        equipamentoManutencao.dataTermino?.hour ?? 0,
        equipamentoManutencao.dataTermino?.minute ?? 0,
      );
    },
    initialValue: equipamentoManutencao.dataTermino,
  );

  late final TimePickerWidget tmpHoraTermino = TimePickerWidget(
    placeholder: 'Hora Término',
    initialValue: equipamentoManutencao.dataTermino != null
        ? TimeOfDay.fromDateTime(equipamentoManutencao.dataTermino!)
        : const TimeOfDay(hour: 0, minute: 0),
    onTimeSelected: (value) {
      if (equipamentoManutencao.dataTermino == null) {
        return;
      }
      equipamentoManutencao.dataTermino = DateTime(
        equipamentoManutencao.dataTermino!.year,
        equipamentoManutencao.dataTermino!.month,
        equipamentoManutencao.dataTermino!.day,
        value?.hour ?? 0,
        value?.minute ?? 0,
      );
    },
  );

  late final DatePickerWidget dtpDataParada = DatePickerWidget(
    placeholder: 'Data Parada',
    onDateSelected: (value) {
      if (value == null) {
        equipamentoManutencao.dataParada = null;
        return;
      }
      equipamentoManutencao.dataParada = DateTime(
        value.year,
        value.month,
        value.day,
        equipamentoManutencao.dataParada?.hour ?? 0,
        equipamentoManutencao.dataParada?.minute ?? 0,
      );
    },
    initialValue: equipamentoManutencao.dataParada,
  );

  late final TimePickerWidget tmpHoraParada = TimePickerWidget(
    placeholder: 'Hora Parada',
    initialValue: equipamentoManutencao.dataParada != null
        ? TimeOfDay.fromDateTime(equipamentoManutencao.dataParada!)
        : const TimeOfDay(hour: 0, minute: 0),
    onTimeSelected: (value) {
      dataHoraParadaSelecionada = DateTime(
        dataHoraParadaSelecionada!.year,
        dataHoraParadaSelecionada!.month,
        dataHoraParadaSelecionada!.day,
        value?.hour ?? 0,
        value?.minute ?? 0,
      );
      equipamentoManutencao.dataParada = dataHoraParadaSelecionada;
    },
  );

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  late bool Function() validateTipoServico;
  late bool Function() validateEquipamento;
  late bool Function() validateResultado;
  late bool Function() validateTecnico;

  void initState() {
    _controller = EquipamentoManutencaoPageFrmController();
    servicoTipoCubit = ServicoTipoCubit();
    servicoTipoCubit.loadAll();
    pecaCubit = PecaCubit();
    pecaCubit.loadAll();
    dataHoraInicioSelecionada = DateTime(0, 0, 0);
    dataHoraTerminoSelecionada = DateTime(0, 0, 0);
    dataHoraParadaSelecionada = DateTime(0, 0, 0);

    txtDescricaoServico.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtNumNF.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtNumSerie1.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtNumSerie2.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtNumSerie3.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtNumSerie4.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtNumSerie5.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtProblema.addValidator((String str) {
      if (str.length > 500) {
        return 'Pode ter no máximo 500 caracteres';
      }
      return '';
    });

    txtUsuarioRegistro.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    if (equipamentoManutencao.cod == 0) {
      recuperaUsuario().then((value) {
        if (value == null ||
            value.usuario == null ||
            value.usuario!.cod == null) {
          return;
        }
        txtUsuarioRegistro.text = value.usuario!.nome ?? '';
        equipamentoManutencao.codUsuario = value.usuario!.cod;
        equipamentoManutencao.usuarioRegistro = value.usuario!.cod.toString();
      });
    }

    super.initState();
  }

  void setFields() {
    txtDescricaoServico.text = equipamentoManutencao.descricao.toString();
    txtNumNF.text = equipamentoManutencao.numNF.toString();

    if (equipamentoManutencao.cod != 0) {
      txtUsuarioRegistro.text = equipamentoManutencao.usuario!.nome.toString();
    }
    txtProblema.text = equipamentoManutencao.problema ?? '';
    txtNumSerie1.text = equipamentoManutencao.serie1 ?? '';
    txtNumSerie2.text = equipamentoManutencao.serie2 ?? '';
    txtNumSerie3.text = equipamentoManutencao.serie3 ?? '';
    txtNumSerie4.text = equipamentoManutencao.serie4 ?? '';
    txtNumSerie5.text = equipamentoManutencao.serie5 ?? '';
    txtQtde1.text =
        equipamentoManutencao.qtde1 == null || equipamentoManutencao.qtde1 == 0
            ? ''
            : equipamentoManutencao.qtde1.toString();
    txtQtde2.text =
        equipamentoManutencao.qtde2 == null || equipamentoManutencao.qtde2 == 0
            ? ''
            : equipamentoManutencao.qtde2.toString();
    txtQtde3.text =
        equipamentoManutencao.qtde3 == null || equipamentoManutencao.qtde3 == 0
            ? ''
            : equipamentoManutencao.qtde3.toString();
    txtQtde4.text =
        equipamentoManutencao.qtde4 == null || equipamentoManutencao.qtde4 == 0
            ? ''
            : equipamentoManutencao.qtde4.toString();
    txtQtde5.text =
        equipamentoManutencao.qtde5 == null || equipamentoManutencao.qtde5 == 0
            ? ''
            : equipamentoManutencao.qtde5.toString();

    txtValor1.text = equipamentoManutencao.valor1 == null ||
            equipamentoManutencao.valor1 == 0
        ? ''
        : equipamentoManutencao.valor1.toString();
    txtValor2.text = equipamentoManutencao.valor2 == null ||
            equipamentoManutencao.valor2 == 0
        ? ''
        : equipamentoManutencao.valor2.toString();
    txtValor3.text = equipamentoManutencao.valor3 == null ||
            equipamentoManutencao.valor3 == 0
        ? ''
        : equipamentoManutencao.valor3.toString();
    txtValor4.text = equipamentoManutencao.valor4 == null ||
            equipamentoManutencao.valor4 == 0
        ? ''
        : equipamentoManutencao.valor4.toString();
    txtValor5.text = equipamentoManutencao.valor5 == null ||
            equipamentoManutencao.valor5 == 0
        ? ''
        : equipamentoManutencao.valor5.toString();

    titulo = 'Manutenções';

    if (equipamentoManutencao.cod != 0) {
      titulo = 'Edição de Manutenção: ${equipamentoManutencao.cod}';
    }
  }

  final ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<EquipamentoManutencaoPageFrmCubit,
        EquipamentoManutencaoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<EquipamentoManutencaoPageFrmCubit,
          EquipamentoManutencaoPageFrmState>(
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
                minWidth: size.width * .80,
                minHeight: size.height * .5,
                maxHeight: size.height * .95,
              ),
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
                            child:
                                BlocBuilder<EquipamentoCubit, EquipamentoState>(
                              bloc: widget.equipamentoCubit,
                              builder: (context, equipamentoState) {
                                if (equipamentoState.loading) {
                                  return const LoadingWidget();
                                }
                                List<EquipamentoModel> equipamentos =
                                    equipamentoState.objs;
                                equipamentos.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                EquipamentoModel? equipamento = equipamentos
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          equipamentoManutencao.codEquipamento,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  validateBuilder:
                                      (context, validateMethodBuilder) =>
                                          validateEquipamento =
                                              validateMethodBuilder,
                                  validator: (val) =>
                                      val == null ? 'Obrigatório' : null,
                                  textFunction: (equipamento) =>
                                      equipamento.EquipamentoNomeText(),
                                  initialValue: equipamento,
                                  sourceList: equipamentos,
                                  onChanged: (value) => equipamentoManutencao
                                      .codEquipamento = value?.cod,
                                  placeholder: 'Equipamento *',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child:
                                BlocBuilder<ServicoTipoCubit, ServicoTipoState>(
                              bloc: servicoTipoCubit,
                              builder: (context, state) {
                                if (state.loading) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                List<ServicoTipoModel> servicosTipos =
                                    state.tiposServico;

                                servicosTipos.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                ServicoTipoModel? servicoTipo = servicosTipos
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          equipamentoManutencao.codServicosTipo,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  validateBuilder:
                                      (context, validateMethodBuilder) =>
                                          validateTipoServico =
                                              validateMethodBuilder,
                                  validator: (val) =>
                                      val == null ? 'Obrigatório' : null,
                                  textFunction: (p0) => p0.GetDropDownText(),
                                  initialValue: servicoTipo,
                                  sourceList: servicosTipos
                                      .where(
                                        (element) =>
                                            element.ativo == true &&
                                            element.servicosEquipamentos ==
                                                true,
                                      )
                                      .toList(),
                                  onChanged: (value) => equipamentoManutencao
                                      .codServicosTipo = value?.cod,
                                  placeholder: 'Tipo do Serviço *',
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
                            child: dtpDataInicio,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: tmpHoraInicio,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: dtpDataTermino,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: tmpHoraTermino,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: dtpDataParada,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: tmpHoraParada,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtNumNF,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: txtProblema,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropDownSearchApiWidget<
                          UsuarioDropDownSearchResponseDTO>(
                        search: (str) async =>
                            (await UsuarioService().getDropDownSearch(
                              UsuarioDropDownSearchDTO(
                                numeroRegistros: 30,
                                search: str,
                              ),
                            ))
                                ?.$2 ??
                            [],
                        textFunction: (usuario) => usuario.NomeText(),
                        initialValue: equipamentoManutencao.usuarioDetectadoPor,
                        onChanged: (value) {
                          equipamentoManutencao.detectadoPor =
                              value?.cod.toString();
                          equipamentoManutencao.usuarioDetectadoPor = value;
                        },
                        placeholder: 'Detectado por',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtDescricaoServico,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropDownSearchApiWidget<
                                UsuarioDropDownSearchResponseDTO>(
                              validateBuilder:
                                  (context, validateMethodBuilder) =>
                                      validateTecnico = validateMethodBuilder,
                              validator: (val) =>
                                  val == null ? 'Obrigatório' : null,
                              search: (str) async =>
                                  (await UsuarioService().getDropDownSearch(
                                    UsuarioDropDownSearchDTO(
                                      numeroRegistros: 30,
                                      search: str,
                                    ),
                                  ))
                                      ?.$2 ??
                                  [],
                              textFunction: (usuario) => usuario.NomeText(),
                              initialValue:
                                  equipamentoManutencao.usuarioTecnico,
                              onChanged: (value) {
                                equipamentoManutencao.tecnico =
                                    value?.cod.toString();
                                equipamentoManutencao.usuarioTecnico = value;
                              },
                              placeholder: 'Técnico *',
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: DropDownSearchWidget<
                                RegistroServicoResultOption>(
                              validateBuilder:
                                  (context, validateMethodBuilder) =>
                                      validateResultado = validateMethodBuilder,
                              validator: (obj) =>
                                  obj == null ? 'Obrigatório' : null,
                              initialValue:
                                  RegistroServicoResultOption.resultOptions
                                      .where(
                                        (element) =>
                                            element.cod ==
                                            equipamentoManutencao.resultado,
                                      )
                                      .firstOrNull,
                              sourceList:
                                  RegistroServicoResultOption.resultOptions,
                              onChanged: (value) => equipamentoManutencao
                                  .resultado = value?.cod.toString(),
                              placeholder: 'Resultado *',
                              textFunction: (p0) => p0.GetDropDownText(),
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
                            flex: 2,
                            child: BlocBuilder<PecaCubit, PecaState>(
                              bloc: pecaCubit,
                              builder: (context, state) {
                                if (state.loading == true) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                List<PecaModel> pecas = state.pecas;
                                pecas.sort(
                                  (a, b) => a.peca!.compareTo(b.peca!),
                                );
                                PecaModel? peca = pecas
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          equipamentoManutencao.codPeca1,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  initialValue: peca,
                                  sourceList: pecas,
                                  onChanged: (value) => equipamentoManutencao
                                      .codPeca1 = value?.cod!,
                                  placeholder: 'Peça Trocada',
                                  textFunction: (p0) => p0.PecaNomeText(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtQtde1,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtValor1,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 120,
                            child: dtpGarantia1,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 200,
                            child: txtNumSerie1,
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
                            child: BlocBuilder<PecaCubit, PecaState>(
                              bloc: pecaCubit,
                              builder: (context, state) {
                                if (state.loading == true) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                List<PecaModel> pecas = state.pecas;
                                pecas.sort(
                                  (a, b) => a.peca!.compareTo(b.peca!),
                                );
                                PecaModel? peca = pecas
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          equipamentoManutencao.codPeca2,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (peca) => peca.PecaNomeText(),
                                  initialValue: peca,
                                  sourceList: pecas,
                                  onChanged: (value) => equipamentoManutencao
                                      .codPeca2 = value?.cod,
                                  placeholder: 'Peça Trocada',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtQtde2,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtValor2,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 120,
                            child: dtpGarantia2,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 200,
                            child: txtNumSerie2,
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
                            child: BlocBuilder<PecaCubit, PecaState>(
                              bloc: pecaCubit,
                              builder: (context, state) {
                                if (state.loading == true) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                List<PecaModel> pecas = state.pecas;
                                pecas.sort(
                                  (a, b) => a.peca!.compareTo(b.peca!),
                                );
                                PecaModel? peca = pecas
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          equipamentoManutencao.codPeca3,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (peca) => peca.PecaNomeText(),
                                  initialValue: peca,
                                  sourceList: pecas,
                                  onChanged: (value) => equipamentoManutencao
                                      .codPeca3 = value?.cod,
                                  placeholder: 'Peça Trocada',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtQtde3,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtValor3,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 120,
                            child: dtpGarantia3,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 200,
                            child: txtNumSerie3,
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
                            child: BlocBuilder<PecaCubit, PecaState>(
                              bloc: pecaCubit,
                              builder: (context, state) {
                                if (state.loading == true) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                List<PecaModel> pecas = state.pecas;
                                pecas.sort(
                                  (a, b) => a.peca!.compareTo(b.peca!),
                                );
                                PecaModel? peca = pecas
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          equipamentoManutencao.codPeca4,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (peca) => peca.PecaNomeText(),
                                  initialValue: peca,
                                  sourceList: pecas,
                                  onChanged: (value) => equipamentoManutencao
                                      .codPeca4 = value?.cod,
                                  placeholder: 'Peça Trocada',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtQtde4,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtValor4,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 120,
                            child: dtpGarantia4,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 200,
                            child: txtNumSerie4,
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
                            child: BlocBuilder<PecaCubit, PecaState>(
                              bloc: pecaCubit,
                              builder: (context, state) {
                                if (state.loading == true) {
                                  return const Center(
                                    child: LoadingWidget(),
                                  );
                                }
                                List<PecaModel> pecas = state.pecas;
                                pecas.sort(
                                  (a, b) => a.peca!.compareTo(b.peca!),
                                );
                                PecaModel? peca = pecas
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          equipamentoManutencao.codPeca5,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (peca) => peca.PecaNomeText(),
                                  initialValue: peca,
                                  sourceList: pecas,
                                  onChanged: (value) => equipamentoManutencao
                                      .codPeca5 = value?.cod,
                                  placeholder: 'Peça Trocada',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtQtde5,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 100,
                            child: txtValor5,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 120,
                            child: dtpGarantia5,
                          ),
                          const SizedBox(width: 50.0),
                          Container(
                            width: 200,
                            child: txtNumSerie5,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtUsuarioRegistro,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: dtpDataRegistro,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: tmpHoraRegistro,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: dtpDataValidade,
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: Row(
                              children: [
                                CustomCheckboxWidget(
                                  checked:
                                      equipamentoManutencao.controlarValidade,
                                  onClick: (value) => equipamentoManutencao
                                      .controlarValidade = value,
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
                      child: LabelStringWidget(
                        text:
                            'Documento Anexado: ${equipamentoManutencao.nfAnexa == null ? 'Nenhum Documento Encontrado' : equipamentoManutencao.nfAnexaNome}',
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
                      CustomPopupItemFileModel.getFileItem(
                        'Anexar NF',
                        salvarArquivo,
                      ),
                      CustomPopupItemModel(
                        text: 'Excluir NF',
                        onTap: excluirArquivo,
                      ),
                      CustomPopupItemOpenDocModel.getOpenDocItem(
                        'Abrir NF',
                        context,
                        equipamentoManutencao.nfAnexa,
                        equipamentoManutencao.nfAnexaNome ??
                            'arquivo sem nome.WebP',
                      ),
                      CustomPopupItemModel(
                        text: 'Imprimir Etiqueta',
                        onTap: () => _controller.printTag(
                          context,
                          equipamentoManutencao,
                        ),
                      ),
                      if (equipamentoManutencao.cod != null &&
                          equipamentoManutencao.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: equipamentoManutencao.cod!,
                            termo: 'EQUIPAMENTO_MANUTENCAO',
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
                          equipamentoManutencao =
                              EquipamentoManutencaoModel.empty();
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

  void salvarArquivo(Future<FileObjectModel?> Function() onSelectFile) async {
    FileObjectModel? fileNew = await onSelectFile();
    if (fileNew == null) return;
    setState(() {
      equipamentoManutencao.nfAnexa = fileNew.base64;
      equipamentoManutencao.nfAnexaNome = fileNew.fileName;
    });
  }

  void excluirArquivo() {
    setState(() {
      equipamentoManutencao.nfAnexa = null;
      equipamentoManutencao.nfAnexaNome = null;
    });
  }

  void salvar() {
    bool descricaoServicoValid = txtDescricaoServico.valid;
    bool numNfValid = txtNumNF.valid;
    bool numSerie1Valid = txtNumSerie1.valid;
    bool numSerie2Valid = txtNumSerie2.valid;
    bool numSerie3Valid = txtNumSerie3.valid;
    bool numSerie4Valid = txtNumSerie4.valid;
    bool numSerie5Valid = txtNumSerie5.valid;
    bool problemaValid = txtProblema.valid;
    bool qtde1Valid = txtQtde1.valid;
    bool qtde2Valid = txtQtde2.valid;
    bool qtde3Valid = txtQtde3.valid;
    bool qtde4Valid = txtQtde4.valid;
    bool qtde5Valid = txtQtde5.valid;
    bool usuarioRegistroValid = txtUsuarioRegistro.valid;
    bool valor1Valid = txtValor1.valid;
    bool valor2Valid = txtValor2.valid;
    bool valor3Valid = txtValor3.valid;
    bool valor4Valid = txtValor4.valid;
    bool valor5Valid = txtValor5.valid;
    bool resultadoValid = validateResultado();
    bool tecnicoValid = validateTecnico();
    bool tipoServicoValid = validateTipoServico();
    bool equipamentoValid = validateEquipamento();
    if (!equipamentoValid || !tipoServicoValid) {
      scroll.jumpTo(0.0);
    }
    else if(!descricaoServicoValid || !tecnicoValid || !resultadoValid){
      scroll.jumpTo(250.0);
    }

    if (!descricaoServicoValid ||
        !numNfValid ||
        !numSerie1Valid ||
        !numSerie2Valid ||
        !numSerie3Valid ||
        !numSerie4Valid ||
        !numSerie5Valid ||
        !problemaValid ||
        !qtde1Valid ||
        !qtde2Valid ||
        !qtde3Valid ||
        !qtde4Valid ||
        !qtde5Valid ||
        !usuarioRegistroValid ||
        !valor1Valid ||
        !valor2Valid ||
        !valor3Valid ||
        !valor4Valid ||
        !valor5Valid ||
        !resultadoValid ||
        !tecnicoValid ||
        !tipoServicoValid ||
        !equipamentoValid) {
      return;
    }
    cubit.save(equipamentoManutencao);
  }
}
