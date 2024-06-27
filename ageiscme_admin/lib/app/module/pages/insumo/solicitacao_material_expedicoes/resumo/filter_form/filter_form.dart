import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_models/dto/solicitacao_material/search/solicitacao_material_search_dto.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FilterForm extends StatelessWidget {
  FilterForm({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    SolicitacaoMaterialSearchDTO dto = context.watch<FilterCubit>().state.dto;
    return FilterDialogWidget(
      child: Column(
        children: [
          TextFieldNumberWidget(
            startValue: dto.cod,
            placeholder: 'Código Solicitação',
            onChanged: (str) => {dto.cod = int.parse(str)},
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          TextFieldNumberWidget(
            startValue: dto.numeroRegistros,
            placeholder: 'Número Registros',
            onChanged: (str) => {dto.numeroRegistros = int.parse(str)},
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          CustomCheckboxWidget(
            align: MainAxisAlignment.start,
            checked: dto.apenasPendentes,
            text: 'Somente Pendentes',
            onClick: (val) => dto.apenasPendentes = val,
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          CustomCheckboxWidget(
            align: MainAxisAlignment.start,
            checked: dto.apenasAutorizados,
            text: 'Somente Autorizados',
            onClick: (val) => dto.apenasAutorizados = val,
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          CustomCheckboxWidget(
            align: MainAxisAlignment.start,
            checked: dto.apenasEntregues,
            text: 'Somente Entregues',
            onClick: (val) => dto.apenasEntregues = val,
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          CustomCheckboxWidget(
            align: MainAxisAlignment.start,
            checked: dto.apenasNaoAutorizados,
            text: 'Somente Não Autorizados',
            onClick: (val) => dto.apenasNaoAutorizados = val,
          ),
        ],
      ),
    );
  }
}
