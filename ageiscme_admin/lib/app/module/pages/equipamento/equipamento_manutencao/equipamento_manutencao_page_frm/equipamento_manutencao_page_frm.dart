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
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/file_helper/file_object_model.dart';
import 'package:compartilhados/functions/format/number_format_parser.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class EquipamentoManutencaoPageFrm extends StatefulWidget {
  const EquipamentoManutencaoPageFrm({
    Key? key,
    required this.equipamentoManutencao,
    required this.equipamentoCubit,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final EquipamentoManutencaoModel equipamentoManutencao;
  final EquipamentoCubit equipamentoCubit;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<EquipamentoManutencaoPageFrm> createState() =>
      _EquipamentoManutencaoPageFrmState(
        equipamentoManutencao: equipamentoManutencao,
      );
}

class _EquipamentoManutencaoPageFrmState
    extends State<EquipamentoManutencaoPageFrm> {
  _EquipamentoManutencaoPageFrmState({required this.equipamentoManutencao});

  bool pecasExpandidas = false;

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
      equipamentoManutencao.problema = str;
    },
  );

  late final TextFieldStringAreaWidget txtDescricaoServico =
      TextFieldStringAreaWidget(
    placeholder: 'Descrição do Problema *',
    onChanged: (String? str) {
      equipamentoManutencao.descricao = str;
    },
  );

  late final TextFieldStringWidget txtNumNF = TextFieldStringWidget(
    placeholder: 'Num. NF',
    onChanged: (String? str) {
      equipamentoManutencao.numNF = str;
    },
  );

  late final TextFieldStringWidget txtUsuarioRegistro = TextFieldStringWidget(
    placeholder: 'Usuário Registro',
    readOnly: true,
  );

  late final TextFieldNumberWidget txtQtde1 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde1 = str == null ? null : double.parse(str);
    },
  );

  late final TextFieldNumberWidget txtQtde2 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde2 = str == null ? null : double.parse(str);
    },
  );

  late final TextFieldNumberWidget txtQtde3 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde3 = str == null ? null : double.parse(str);
    },
  );

  late final TextFieldNumberWidget txtQtde4 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde4 = str == null ? null : double.parse(str);
    },
  );

  late final TextFieldNumberWidget txtQtde5 = TextFieldNumberWidget(
    placeholder: 'Qtde',
    onChanged: (String? str) {
      equipamentoManutencao.qtde5 = str == null ? null : double.parse(str);
    },
  );

  late final TextFieldNumberFloatWidget txtValor1 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor1 =
          str == null || str == '' ? null : double.parse(str);
    },
  );

  late final TextFieldNumberFloatWidget txtValor2 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor2 =
          str == null || str == '' ? null : double.parse(str);
    },
  );

  late final TextFieldNumberFloatWidget txtValor3 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor3 =
          str == null || str == '' ? null : double.parse(str);
    },
  );

  late final TextFieldNumberFloatWidget txtValor4 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor4 =
          str == null || str == '' ? null : double.parse(str);
    },
  );

  late final TextFieldNumberFloatWidget txtValor5 = TextFieldNumberFloatWidget(
    placeholder: 'Valor',
    onChanged: (String? str) {
      equipamentoManutencao.valor5 =
          str == null || str == '' ? null : double.parse(str);
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
      equipamentoManutencao.serie1 = str;
    },
  );

  late final TextFieldStringWidget txtNumSerie2 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie2 = str;
    },
  );

  late final TextFieldStringWidget txtNumSerie3 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie3 = str;
    },
  );

  late final TextFieldStringWidget txtNumSerie4 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie4 = str;
    },
  );

  late final TextFieldStringWidget txtNumSerie5 = TextFieldStringWidget(
    placeholder: 'N. Série',
    onChanged: (String? str) {
      equipamentoManutencao.serie5 = str;
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
        : null,
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
        : null,
    onTimeSelected: (value) {
      if (equipamentoManutencao.dataParada == null) {
        return;
      }
      equipamentoManutencao.dataParada = DateTime(
        equipamentoManutencao.dataParada!.year,
        equipamentoManutencao.dataParada!.month,
        equipamentoManutencao.dataParada!.day,
        value?.hour ?? 0,
        value?.minute ?? 0,
      );
    },
  );

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  late bool Function() validateTipoServico;
  late bool Function() validateEquipamento;
  late bool Function() validateResultado;
  late bool Function() validateTecnico;
  late void Function() refreshServicosTipoMethod;

  late void Function(EquipamentoModel?) setEquipamento;
  late void Function(ServicoTipoModel?) setServicoTipo;
  late void Function(UsuarioDropDownSearchResponseDTO?) setDetectadoPor;
  late void Function(UsuarioDropDownSearchResponseDTO?) setTecnico;
  late void Function(RegistroServicoResultOption?) setResultado;
  late void Function(PecaModel?) setPeca1;
  late void Function(PecaModel?) setPeca2;
  late void Function(PecaModel?) setPeca3;
  late void Function(PecaModel?) setPeca4;
  late void Function(PecaModel?) setPeca5;
  late void Function(bool) setControlarValidade;

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
            : equipamentoManutencao.qtde1!.round().toString();
    txtQtde2.text =
        equipamentoManutencao.qtde2 == null || equipamentoManutencao.qtde2 == 0
            ? ''
            : equipamentoManutencao.qtde2!.round().toString();
    txtQtde3.text =
        equipamentoManutencao.qtde3 == null || equipamentoManutencao.qtde3 == 0
            ? ''
            : equipamentoManutencao.qtde3!.round().toString();
    txtQtde4.text =
        equipamentoManutencao.qtde4 == null || equipamentoManutencao.qtde4 == 0
            ? ''
            : equipamentoManutencao.qtde4!.round().toString();
    txtQtde5.text =
        equipamentoManutencao.qtde5 == null || equipamentoManutencao.qtde5 == 0
            ? ''
            : equipamentoManutencao.qtde5!.round().toString();

    txtValor1.text = NumberFormatParser.toFixed(
      equipamentoManutencao.valor1,
      2,
    );
    txtValor2.text = NumberFormatParser.toFixed(
      equipamentoManutencao.valor2,
      2,
    );
    txtValor3.text = NumberFormatParser.toFixed(
      equipamentoManutencao.valor3,
      2,
    );
    txtValor4.text = NumberFormatParser.toFixed(
      equipamentoManutencao.valor4,
      2,
    );
    txtValor5.text = NumberFormatParser.toFixed(
      equipamentoManutencao.valor5,
      2,
    );

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
    return BlocBuilder<EquipamentoManutencaoPageFrmCubit,
        EquipamentoManutencaoPageFrmState>(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
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
                                    child: BlocBuilder<EquipamentoCubit,
                                        EquipamentoState>(
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
                                        EquipamentoModel? equipamento =
                                            equipamentos
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      equipamentoManutencao
                                                          .codEquipamento,
                                                )
                                                .firstOrNull;
                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setEquipamento =
                                                  setSelectedItemMethod,
                                          readOnly: equipamentoManutencao.cod !=
                                                  null &&
                                              equipamentoManutencao.cod != 0,
                                          validateBuilder: (
                                            context,
                                            validateMethodBuilder,
                                          ) =>
                                              validateEquipamento =
                                                  validateMethodBuilder,
                                          validator: (val) => val == null
                                              ? 'Obrigatório'
                                              : null,
                                          textFunction: (equipamento) =>
                                              equipamento.EquipamentoNomeText(),
                                          initialValue: equipamento,
                                          sourceList: equipamentos,
                                          onChanged: (value) {
                                            equipamentoManutencao
                                                .codEquipamento = value?.cod;
                                            equipamentoManutencao.equipamento =
                                                value;
                                            servicoTipoCubit.reload();
                                            refreshServicosTipoMethod.call();
                                          },
                                          placeholder: 'Equipamento *',
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: BlocBuilder<ServicoTipoCubit,
                                        ServicoTipoState>(
                                      bloc: servicoTipoCubit,
                                      builder: (context, state) {
                                        if (state.loading) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }
                                        List<ServicoTipoModel> servicosTipos =
                                            state.tiposServico;
                                        equipamentoManutencao.servicoTipo =
                                            servicosTipos
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      equipamentoManutencao
                                                          .codServicosTipo,
                                                )
                                                .firstOrNull;
                                        servicosTipos.sort(
                                          (a, b) => a.nome!.compareTo(b.nome!),
                                        );
                                        List<ServicoTipoModel> servicos =
                                            buscarServicosEquipamento(
                                          servicosTipos,
                                        );
                                        if (state.reloaded == true) {
                                          if (servicos.isNotEmpty &&
                                              !servicos
                                                  .map((e) => e.cod)
                                                  .contains(
                                                    equipamentoManutencao
                                                        .codServicosTipo,
                                                  )) {
                                            equipamentoManutencao.servicoTipo =
                                                null;
                                            equipamentoManutencao
                                                .codServicosTipo = null;
                                          }
                                        }
                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setServicoTipo =
                                                  setSelectedItemMethod,
                                          validateBuilder: (
                                            context,
                                            validateMethodBuilder,
                                          ) =>
                                              validateTipoServico =
                                                  validateMethodBuilder,
                                          refreshSourceListBuilder: (
                                            context,
                                            refreshTipoServicoSourceList,
                                          ) =>
                                              refreshServicosTipoMethod =
                                                  refreshTipoServicoSourceList,
                                          validator: (val) => val == null
                                              ? 'Obrigatório'
                                              : null,
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
                                          initialValue:
                                              equipamentoManutencao.servicoTipo,
                                          sourceList: servicos,
                                          onChanged: (value) =>
                                              equipamentoManutencao
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
                                setSelectedItemBuilder: (
                                  context,
                                  setSelectedItemMethod,
                                ) =>
                                    setDetectadoPor = setSelectedItemMethod,
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
                                    equipamentoManutencao.usuarioDetectadoPor,
                                onChanged: (value) {
                                  equipamentoManutencao.detectadoPor =
                                      value?.cod.toString();
                                  equipamentoManutencao.usuarioDetectadoPor =
                                      value;
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
                                      setSelectedItemBuilder: (
                                        context,
                                        setSelectedItemMethod,
                                      ) =>
                                          setTecnico = setSelectedItemMethod,
                                      validateBuilder:
                                          (context, validateMethodBuilder) =>
                                              validateTecnico =
                                                  validateMethodBuilder,
                                      validator: (val) =>
                                          val == null ? 'Obrigatório' : null,
                                      search: (str) async =>
                                          (await UsuarioService()
                                                  .getDropDownSearch(
                                            UsuarioDropDownSearchDTO(
                                              numeroRegistros: 30,
                                              search: str,
                                            ),
                                          ))
                                              ?.$2 ??
                                          [],
                                      textFunction: (usuario) =>
                                          usuario.NomeText(),
                                      initialValue:
                                          equipamentoManutencao.usuarioTecnico,
                                      onChanged: (value) {
                                        equipamentoManutencao.tecnico =
                                            value?.cod.toString();
                                        equipamentoManutencao.usuarioTecnico =
                                            value;
                                      },
                                      placeholder: 'Técnico *',
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: DropDownSearchWidget<
                                        RegistroServicoResultOption>(
                                      setSelectedItemBuilder: (
                                        context,
                                        setSelectedItemMethod,
                                      ) =>
                                          setResultado = setSelectedItemMethod,
                                      validateBuilder:
                                          (context, validateMethodBuilder) =>
                                              validateResultado =
                                                  validateMethodBuilder,
                                      validator: (obj) =>
                                          obj == null ? 'Obrigatório' : null,
                                      initialValue: RegistroServicoResultOption
                                          .resultOptions
                                          .where(
                                            (element) =>
                                                element.cod ==
                                                equipamentoManutencao.resultado,
                                          )
                                          .firstOrNull,
                                      sourceList: RegistroServicoResultOption
                                          .resultOptions,
                                      onChanged: (value) =>
                                          equipamentoManutencao.resultado =
                                              value?.cod.toString(),
                                      placeholder: 'Resultado *',
                                      textFunction: (p0) =>
                                          p0.GetDropDownText(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    pecasExpandidas = !pecasExpandidas;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      pecasExpandidas
                                          ? Icons.minimize_outlined
                                          : Symbols.add,
                                    ),
                                    const Text('Peças'),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              maintainState: true,
                              visible: pecasExpandidas,
                              child: Padding(
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
                                            (a, b) =>
                                                a.peca!.compareTo(b.peca!),
                                          );
                                          PecaModel? peca = pecas
                                              .where(
                                                (element) =>
                                                    element.cod ==
                                                    equipamentoManutencao
                                                        .codPeca1,
                                              )
                                              .firstOrNull;
                                          return DropDownSearchWidget(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setPeca1 =
                                                    setSelectedItemMethod,
                                            initialValue: peca,
                                            sourceList: pecas,
                                            onChanged: (value) =>
                                                equipamentoManutencao.codPeca1 =
                                                    value?.cod!,
                                            placeholder: 'Peça Trocada',
                                            textFunction: (p0) =>
                                                p0.PecaNomeText(),
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
                            ),
                            Visibility(
                              maintainState: true,
                              visible: pecasExpandidas,
                              child: Padding(
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
                                            (a, b) =>
                                                a.peca!.compareTo(b.peca!),
                                          );
                                          PecaModel? peca = pecas
                                              .where(
                                                (element) =>
                                                    element.cod ==
                                                    equipamentoManutencao
                                                        .codPeca2,
                                              )
                                              .firstOrNull;
                                          return DropDownSearchWidget(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setPeca2 =
                                                    setSelectedItemMethod,
                                            textFunction: (peca) =>
                                                peca.PecaNomeText(),
                                            initialValue: peca,
                                            sourceList: pecas,
                                            onChanged: (value) =>
                                                equipamentoManutencao.codPeca2 =
                                                    value?.cod,
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
                            ),
                            Visibility(
                              maintainState: true,
                              visible: pecasExpandidas,
                              child: Padding(
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
                                            (a, b) =>
                                                a.peca!.compareTo(b.peca!),
                                          );
                                          PecaModel? peca = pecas
                                              .where(
                                                (element) =>
                                                    element.cod ==
                                                    equipamentoManutencao
                                                        .codPeca3,
                                              )
                                              .firstOrNull;
                                          return DropDownSearchWidget(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setPeca3 =
                                                    setSelectedItemMethod,
                                            textFunction: (peca) =>
                                                peca.PecaNomeText(),
                                            initialValue: peca,
                                            sourceList: pecas,
                                            onChanged: (value) =>
                                                equipamentoManutencao.codPeca3 =
                                                    value?.cod,
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
                            ),
                            Visibility(
                              maintainState: true,
                              visible: pecasExpandidas,
                              child: Padding(
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
                                            (a, b) =>
                                                a.peca!.compareTo(b.peca!),
                                          );
                                          PecaModel? peca = pecas
                                              .where(
                                                (element) =>
                                                    element.cod ==
                                                    equipamentoManutencao
                                                        .codPeca4,
                                              )
                                              .firstOrNull;
                                          return DropDownSearchWidget(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setPeca4 =
                                                    setSelectedItemMethod,
                                            textFunction: (peca) =>
                                                peca.PecaNomeText(),
                                            initialValue: peca,
                                            sourceList: pecas,
                                            onChanged: (value) =>
                                                equipamentoManutencao.codPeca4 =
                                                    value?.cod,
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
                            ),
                            Visibility(
                              maintainState: true,
                              visible: pecasExpandidas,
                              child: Padding(
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
                                            (a, b) =>
                                                a.peca!.compareTo(b.peca!),
                                          );
                                          PecaModel? peca = pecas
                                              .where(
                                                (element) =>
                                                    element.cod ==
                                                    equipamentoManutencao
                                                        .codPeca5,
                                              )
                                              .firstOrNull;
                                          return DropDownSearchWidget(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setPeca5 =
                                                    setSelectedItemMethod,
                                            textFunction: (peca) =>
                                                peca.PecaNomeText(),
                                            initialValue: peca,
                                            sourceList: pecas,
                                            onChanged: (value) =>
                                                equipamentoManutencao.codPeca5 =
                                                    value?.cod,
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
                                          setValue: (context, setValueWidget) =>
                                              setControlarValidade =
                                                  setValueWidget,
                                          checked: equipamentoManutencao
                                              .controlarValidade,
                                          onClick: (value) =>
                                              equipamentoManutencao
                                                  .controlarValidade = value,
                                          text: 'Controlar Validade',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    CustomPopupItemFileModel.getFileItem(
                      'Anexar NF',
                      salvarArquivo,
                    ),
                    if (equipamentoManutencao.nfAnexa != null)
                      CustomPopupItemModel(
                        text: 'Excluir NF',
                        onTap: excluirArquivo,
                      ),
                    if (equipamentoManutencao.nfAnexa != null)
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
                        title: 'Manutenção ${equipamentoManutencao.cod}',
                        child: HistoricoPage(
                          pk: equipamentoManutencao.cod!,
                          termo: 'EQUIPAMENTO_MANUTENCAO',
                        ),
                        context: context,
                      ),
                  ],
                ),
                LabelStringWidget(
                  text:
                      '${equipamentoManutencao.nfAnexaNome == null ? '' : 'NF Anexada: ' + equipamentoManutencao.nfAnexaNome.toString()}',
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: UpdateButtonWidget(
                    readonly: equipamentoManutencao.cod == 0 ||
                        equipamentoManutencao.cod == null,
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
                    onPressed: limpar,
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

  void limpar() async {
    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    setState(() {
      equipamentoManutencao.cod = 0;
      equipamentoManutencao.codEquipamento = 0;
      equipamentoManutencao.codServicosTipo = 0;
      equipamentoManutencao.resultado = '';
      equipamentoManutencao.descricao = '';
      equipamentoManutencao.dataInicio = DateTime.now();
      equipamentoManutencao.dataParada = null;
      equipamentoManutencao.imagemDoAnexo = null;
      equipamentoManutencao.codUsuario = auth?.usuario?.cod;
      equipamentoManutencao.codInstituicao = auth?.instituicao?.cod;
      equipamentoManutencao.tecnico = null;
      equipamentoManutencao.usuarioRegistro = auth?.usuario?.nome;
      equipamentoManutencao.dataRegistro = DateTime.now();
      equipamentoManutencao.numNF = '';
      equipamentoManutencao.problema = null;
      equipamentoManutencao.detectadoPor = null;
      equipamentoManutencao.codPeca1 = null;
      equipamentoManutencao.codPeca2 = null;
      equipamentoManutencao.codPeca3 = null;
      equipamentoManutencao.codPeca3 = null;
      equipamentoManutencao.codPeca5 = null;
      equipamentoManutencao.qtde1 = null;
      equipamentoManutencao.qtde2 = null;
      equipamentoManutencao.qtde3 = null;
      equipamentoManutencao.qtde4 = null;
      equipamentoManutencao.qtde5 = null;
      equipamentoManutencao.valor1 = null;
      equipamentoManutencao.valor2 = null;
      equipamentoManutencao.valor3 = null;
      equipamentoManutencao.valor4 = null;
      equipamentoManutencao.valor5 = null;
      equipamentoManutencao.garantia1 = null;
      equipamentoManutencao.garantia2 = null;
      equipamentoManutencao.garantia3 = null;
      equipamentoManutencao.garantia4 = null;
      equipamentoManutencao.garantia5 = null;
      equipamentoManutencao.serie1 = null;
      equipamentoManutencao.serie2 = null;
      equipamentoManutencao.serie3 = null;
      equipamentoManutencao.serie4 = null;
      equipamentoManutencao.serie5 = null;
      equipamentoManutencao.nfAnexa = null;
      equipamentoManutencao.nfAnexaNome = null;
      equipamentoManutencao.validade = null;
      equipamentoManutencao.controlarValidade = false;
      equipamentoManutencao.ultimaAlteracao = null;
      equipamentoManutencao.tstamp = null;
      equipamentoManutencao.equipamento = null;
      equipamentoManutencao.servicoTipo = null;
      equipamentoManutencao.usuario = auth?.usuario;
      equipamentoManutencao.peca = null;
      equipamentoManutencao.peca1 = null;
      equipamentoManutencao.peca2 = null;
      equipamentoManutencao.peca3 = null;
      equipamentoManutencao.peca4 = null;
      equipamentoManutencao.peca5 = null;
    });
    setEquipamento(null);
    setServicoTipo(null);
    dtpDataParada.setValue(null);
    tmpHoraParada.setValue(null);
    dtpDataInicio.setValue(equipamentoManutencao.dataInicio);
    tmpHoraInicio.setValue(
      TimeOfDay.fromDateTime(
        equipamentoManutencao.dataInicio!,
      ),
    );
    dtpDataTermino.setValue(null);
    tmpHoraTermino.setValue(null);
    setDetectadoPor(null);
    setTecnico(null);
    setResultado(null);
    setPeca1(null);
    setPeca2(null);
    setPeca3(null);
    setPeca4(null);
    setPeca5(null);
    dtpGarantia1.setValue(null);
    dtpGarantia2.setValue(null);
    dtpGarantia3.setValue(null);
    dtpGarantia4.setValue(null);
    dtpGarantia5.setValue(null);
    txtUsuarioRegistro.text =
        auth?.usuario?.nome ?? 'Usuário logado não encontrado';
    dtpDataRegistro.setValue(equipamentoManutencao.dataRegistro);
    dtpDataValidade.setValue(null);
    setControlarValidade(false);
    tmpHoraRegistro.setValue(
      TimeOfDay.fromDateTime(
        equipamentoManutencao.dataRegistro!,
      ),
    );
  }

  List<ServicoTipoModel> buscarServicosEquipamento(
    List<ServicoTipoModel> servicosTipos,
  ) {
    List<ServicoTipoModel> servicos = [];
    if (equipamentoManutencao.equipamento != null) {
      servicos = servicosTipos
          .where(
            (element) =>
                equipamentoManutencao.equipamento?.equipamentosServicos
                    ?.where(
                      (eq) => eq.codServico == element.cod,
                    )
                    .firstOrNull !=
                null,
          )
          .toList();
    }
    if (servicos.isEmpty) {
      servicos = servicosTipos
          .where(
            (element) =>
                element.ativo == true && element.servicosEquipamentos == true,
          )
          .toList();
    }
    return servicos;
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

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
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
    } else if (!descricaoServicoValid || !tecnicoValid || !resultadoValid) {
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

    if (equipamentoManutencao.dataTermino != null &&
        equipamentoManutencao.dataInicio != null) {
      if (equipamentoManutencao.dataInicio!
          .isAfter(equipamentoManutencao.dataTermino!)) {
        ToastUtils.showCustomToastWarning(
          context,
          'Data Término não pode ser antes da Data Inicial',
        );
        return;
      }
    }
    if (equipamentoManutencao.resultado == '1' &&
        equipamentoManutencao.dataTermino == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'O Campo Data Término é obrigatório para Resultado = Liberado!',
      );
      return;
    }
    cubit.save(
      novo
          ? equipamentoManutencao.copyWith(cod: 0, tstamp: null)
          : equipamentoManutencao,
      widget.onSaved,
    );
  }
}
