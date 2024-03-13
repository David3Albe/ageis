import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_insumos/equipamento_insumo_page_frm/equipamento_insumo_page_frm_controller.dart';
import 'package:ageiscme_models/dto/equipamento_insumo/equipamento_insumo_save/equipamento_insumo_save_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EquipamentoInsumoPageFrm extends StatefulWidget {
  final EquipamentoInsumoSaveDTO? dto;

  EquipamentoInsumoPageFrm({this.dto});
  @override
  State<EquipamentoInsumoPageFrm> createState() =>
      _EquipamentoInsumoPageFrmState(dto: dto);
}

class _EquipamentoInsumoPageFrmState extends State<EquipamentoInsumoPageFrm> {
  late final EquipamentoInsumoPageFrmController _controller;
  static const double PADDING_TOP_DEFAULT = 5;
  _EquipamentoInsumoPageFrmState({EquipamentoInsumoSaveDTO? dto}) {
    _controller = EquipamentoInsumoPageFrmController(baseDto: dto);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.insumoCubit.close();
    _controller.equipamentoCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: BlocBuilder<EquipamentoCubit, EquipamentoState>(
                bloc: _controller.equipamentoCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(child: LoadingWidget());
                  }
                  _controller.loadEquipamentos(state);
                  return DropDownSearchWidget(
                    initialValue: _controller.equipamento,
                    sourceList: _controller.equipamentos,
                    onChanged: _controller.setEquipamento,
                    placeholder: 'Equipamento',
                  );
                },
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: PADDING_TOP_DEFAULT)),
        Row(
          children: [
            Expanded(
              child: BlocBuilder<InsumoCubit, InsumoState>(
                bloc: _controller.insumoCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(child: LoadingWidget());
                  }
                  _controller.loadInsumos(state);
                  return DropDownSearchWidget(
                    initialValue: _controller.insumo,
                    sourceList: _controller.insumos,
                    onChanged: _controller.setInsumo,
                    placeholder: 'Insumo',
                  );
                },
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: PADDING_TOP_DEFAULT)),
        Row(
          children: [
            Expanded(child: _controller.txtConsumoProcesso),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SaveButtonWidget(
                onPressed: () => _controller.salvar(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CancelButtonUnfilledWidget(
                onPressed: () => _controller.cancelar(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
