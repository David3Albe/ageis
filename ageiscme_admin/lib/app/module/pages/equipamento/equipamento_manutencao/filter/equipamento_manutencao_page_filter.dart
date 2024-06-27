import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/cubits/equipamento_manutencao_filter_cubit.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/equipamento/equipamento_service.dart';
import 'package:ageiscme_data/services/servico_tipo/servico_tipo_service.dart';
import 'package:ageiscme_models/dto/equipamento/drop_down_search/equipamento_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/servico_tipo/drop_down_search/servico_tipo_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/equipamento_manutencao/equipamento_manutencao_filter.dart';
import 'package:ageiscme_models/response_dto/equipamento/drop_down_search/equipamento_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/servico_tipo/drop_down_search/servico_tipo_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EquipamentoManutencaoPageFilter extends StatelessWidget {
  EquipamentoManutencaoPageFilter({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    EquipamentoManutencaoFilter dto =
        context.watch<EquipamentoManutencaoFilterCubit>().state;
    return FilterDialogWidget(
      child: Column(
        children: [
          DropDownSearchApiWidget<EquipamentoDropDownSearchResponseDTO?>(
            initialValue: dto.equipamento,
            textFunction: (p0) => p0?.getNome() ?? '',
            search: (str) async =>
                (await EquipamentoService().getDropDownSearch(
                  EquipamentoDropDownSearchDTO(
                    numeroRegistros: 30,
                    search: str,
                  ),
                ))
                    ?.$2 ??
                [],
            placeholder: 'Equipamento',
            onChanged: (EquipamentoDropDownSearchResponseDTO? equip) {
              dto.codEquipamento = equip?.cod;
              dto.equipamento = equip;
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          DropDownSearchApiWidget<ServicoTipoDropDownSearchResponseDTO?>(
            textFunction: (p0) => p0?.getNome() ?? '',
            search: (str) async =>
                (await ServicoTipoService().getDropDownSearch(
                  ServicoTipoDropDownSearchDTO(
                    numeroRegistros: 30,
                    search: str,
                  ),
                ))
                    ?.$2 ??
                [],
            initialValue: dto.servicoTipo,
            placeholder: 'Tipo Serviço',
            onChanged: (serv) {
              dto.servicoTipo = serv;
              dto.codTipoServico = serv?.cod;
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          TextFieldNumberWidget(
            startValue: dto.numeroRegistros,
            placeholder: 'Número Registros',
            onChanged: (str) => {
              dto.numeroRegistros = str.isEmpty ? null : int.parse(str),
            },
          ),
        ],
      ),
    );
  }
}
