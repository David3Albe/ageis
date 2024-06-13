import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/cubits/gerar_licenca_cubit.dart';
import 'package:ageiscme_models/dto/gerar_licenca/gerar_licenca_dto.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class GerarLicencaCamposWidget extends StatelessWidget {
  const GerarLicencaCamposWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GerarLicencaDTO dto = context.watch<GerarLicencaCubit>().state.dto;
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              TextFieldStringWidget(
                placeholder: 'Nome Cliente',
                onChanged: (str) => dto.nomeCliente = str,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
              ),
              TextFieldStringWidget(
                placeholder: 'E-mail Cliente',
                onChanged: (str) => dto.emailCliente = str,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
              ),
              DatePickerWidget(
                placeholder: 'Validade Até:',
                onDateSelected: (str) => dto.validadeAte = str,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
              ),
              TextFieldStringWidget(
                placeholder: 'Servidor Primário',
                onChanged: (str) => dto.servidorPrimario = str,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
              ),
              TextFieldStringWidget(
                placeholder: 'Servidor Secundário',
                onChanged: (str) => dto.servidorSecundario = str,
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(child: const Text('Módulos')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckboxWidget(
                    onClick: (value) => dto.contemRelatorio = value,
                    text: 'Relatórios',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckboxWidget(
                    onClick: (value) => dto.contemAdmin = value,
                    text: 'Administrativo',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckboxWidget(
                    onClick: (value) => dto.contemProcesso = value,
                    text: 'Processo',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckboxWidget(
                    onClick: (value) => dto.contemAdminV2 = value,
                    text: 'Administrativo V2',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckboxWidget(
                    onClick: (value) => dto.contemProcessoV2 = value,
                    text: 'Processo V2',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
