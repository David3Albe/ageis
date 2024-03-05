import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm_state.dart';
import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:flutter/material.dart';

class RegistroServicePageFrmController {
  final RegistroServicoModel registroServico;
  late final RegistroServicoPageFrmCubit cubit;
  late final ServicoTipoCubit servicoTipoCubit;
  late final TextEditingController usuarioRegistroController;
  late DateTime? dataHoraInicioSelecionada;
  late DateTime? dataHoraTerminoSelecionada;
  late final TextFieldStringWidget txtLote;
  late final TextFieldStringAreaWidget txtDescricaoServico;
  late final TextFieldStringWidget txtUsuarioRegistro;
  late final TextFieldNumberWidget txtTemperatura;
  late final TextFieldNumberWidget txtTemperaturaMax;
  late final TextFieldNumberWidget txtTemperaturaMin;
  late final TextFieldNumberWidget txtUmidade;
  late final TextFieldNumberWidget txtUmidadeMax;
  late final TextFieldNumberWidget txtUmidadeMin;
  late final DatePickerWidget dtpDataValidade;
  late final DatePickerWidget dtpDataRegistro;
  late final DatePickerWidget dtpDataInicio;
  late final TimePickerWidget tmpHoraInicio;
  late final DatePickerWidget dtpDataTermino;
  late final TimePickerWidget tmpHoraTermino;
  late String titulo;

  RegistroServicePageFrmController({required this.registroServico});

  void setFields() {
    txtDescricaoServico.text = registroServico.descricao.toString();
    txtUsuarioRegistro.text = registroServico.usuario?.nome?.toString() ?? '';
    txtLote.text = registroServico.lote?.toString() ?? '';
    txtTemperatura.text = registroServico.temperatura?.toString() ?? '';
    txtTemperaturaMax.text = registroServico.temperaturaMax?.toString() ?? '';
    txtTemperaturaMin.text = registroServico.temperaturaMin?.toString() ?? '';
    txtUmidade.text = registroServico.umidade?.toString() ?? '';
    txtUmidadeMax.text = registroServico.umidadeMax?.toString() ?? '';
    txtUmidadeMin.text = registroServico.umidadeMin?.toString() ?? '';

    titulo = 'Monitoramento';
    if (registroServico.cod != 0) {
      titulo = 'Edição do Monitoramento: ${registroServico.cod}';
    }
  }

  void initialize() {
    cubit = RegistroServicoPageFrmCubit(
      registroServicoModel: registroServico,
      service: RegistroServicoService(),
    );

    servicoTipoCubit = ServicoTipoCubit();
    servicoTipoCubit.loadAll();

    _criaTxts();

    usuarioRegistroController = TextEditingController();
    dataHoraInicioSelecionada = DateTime(0, 0, 0);
    dataHoraTerminoSelecionada = DateTime(0, 0, 0);
    txtUsuarioRegistro.text = usuarioRegistroController.text;
    registroServico.indicador = 'zerado';
    _criaValidators();
    setFields();
  }

  void _criaTxts() {
    txtLote = TextFieldStringWidget(
      placeholder: 'Lote',
      onChanged: (String? str) => registroServico.lote = txtLote.text,
    );
    txtDescricaoServico = TextFieldStringAreaWidget(
      placeholder: 'Descrição do Serviço',
      onChanged: (String? str) =>
          registroServico.descricao = txtDescricaoServico.text,
    );
    txtUsuarioRegistro = TextFieldStringWidget(
      placeholder: 'Usuário Registro',
      readOnly: true,
    );
    txtTemperatura = TextFieldNumberWidget(
      placeholder: 'Temperatura',
      onChanged: (String? str) =>
          registroServico.temperatura = double.parse(txtTemperatura.text),
    );
    txtTemperaturaMax = TextFieldNumberWidget(
      placeholder: 'Temperatura Max.',
      onChanged: (String? str) =>
          registroServico.temperaturaMax = double.parse(txtTemperaturaMax.text),
    );
    txtTemperaturaMin = TextFieldNumberWidget(
      placeholder: 'Temperatura Min.',
      onChanged: (String? str) =>
          registroServico.temperaturaMin = double.parse(txtTemperaturaMin.text),
    );
    txtUmidade = TextFieldNumberWidget(
      placeholder: 'Umidade',
      onChanged: (String? str) =>
          registroServico.umidade = double.parse(txtUmidade.text),
    );
    txtUmidadeMax = TextFieldNumberWidget(
      placeholder: 'Umidade Máx.',
      onChanged: (String? str) =>
          registroServico.umidadeMax = double.parse(txtUmidadeMax.text),
    );
    txtUmidadeMin = TextFieldNumberWidget(
      placeholder: 'Umidade Min.',
      onChanged: (String? str) =>
          registroServico.umidadeMin = double.parse(txtUmidadeMin.text),
    );
    dtpDataValidade = DatePickerWidget(
      placeholder: 'Data Validade',
      onDateSelected: (value) => registroServico.dataValidade = value,
      initialValue: registroServico.dataValidade,
    );
    dtpDataRegistro = DatePickerWidget(
      placeholder: 'Data Registro',
      readOnly: true,
      onDateSelected: (value) => registroServico.dataRegistro = value,
      initialValue: registroServico.dataRegistro,
    );
    dtpDataInicio = DatePickerWidget(
      placeholder: 'Data Início',
      onDateSelected: (value) {
        if (value == null) {
          dataHoraInicioSelecionada = null;
          return;
        }
        dataHoraInicioSelecionada = DateTime(
          value.year,
          value.month,
          value.day,
          dataHoraInicioSelecionada?.hour ?? 0,
          dataHoraInicioSelecionada?.minute ?? 0,
        );
        registroServico.dataInicio = dataHoraInicioSelecionada;
      },
      initialValue: registroServico.dataInicio,
    );
    tmpHoraInicio = TimePickerWidget(
      placeholder: 'Hora Início',
      onTimeSelected: (value) {
        if (dataHoraInicioSelecionada == null) return;
        dataHoraInicioSelecionada = DateTime(
          dataHoraInicioSelecionada!.year,
          dataHoraInicioSelecionada!.month,
          dataHoraInicioSelecionada!.day,
          value.hour,
          value.minute,
        );
        registroServico.dataInicio = dataHoraInicioSelecionada;
      },
      initialValue: TimeOfDay.fromDateTime(registroServico.dataInicio!),
    );
    dtpDataTermino = DatePickerWidget(
      placeholder: 'Data Término',
      onDateSelected: (value) {
        if (value == null) {
          dataHoraTerminoSelecionada = null;
          return;
        }
        dataHoraTerminoSelecionada = DateTime(
          value.year,
          value.month,
          value.day,
          dataHoraTerminoSelecionada?.hour ?? 0,
          dataHoraTerminoSelecionada?.minute ?? 0,
        );
        registroServico.dataTermino = dataHoraTerminoSelecionada;
      },
      initialValue: registroServico.dataTermino,
    );
    tmpHoraTermino = TimePickerWidget(
      placeholder: 'Hora Término',
      onTimeSelected: (value) {
        if (dataHoraInicioSelecionada == null) return;
        dataHoraTerminoSelecionada = DateTime(
          dataHoraTerminoSelecionada!.year,
          dataHoraTerminoSelecionada!.month,
          dataHoraTerminoSelecionada!.day,
          value.hour,
          value.minute,
        );
        registroServico.dataTermino = dataHoraTerminoSelecionada;
      },
      initialValue: registroServico.dataTermino != null
          ? TimeOfDay.fromDateTime(registroServico.dataTermino!)
          : const TimeOfDay(hour: 0, minute: 0),
    );
  }

  void _criaValidators() {
    txtDescricaoServico.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtLote.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtUsuarioRegistro.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });
  }

  List<ServicoTipoModel> buscarServicosEquipamento(
    List<ServicoTipoModel> servicosTipos,
  ) {
    List<ServicoTipoModel> servicos = [];
    if (registroServico.equipamento != null) {
      servicos = servicosTipos
          .where(
            (element) =>
                registroServico.equipamento?.equipamentosServicos
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
            (element) => element.ativo == true && element.monitoramento == true,
          )
          .toList();
    }
    return servicos;
  }
}
