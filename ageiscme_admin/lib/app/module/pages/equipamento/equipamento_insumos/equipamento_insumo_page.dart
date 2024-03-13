import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento_insumo/equipamento_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_insumos/equipamento_insumo_page_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_consumo_response/equipamento_insumo_consumo_response_dto.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EquipamentoInsumoPage extends StatefulWidget {
  EquipamentoInsumoPage({this.codEquipamento, this.codInsumo});
  final int? codEquipamento;
  final int? codInsumo;

  @override
  State<EquipamentoInsumoPage> createState() => _EquipamentoInsumoPageState(
        codEquipamento: codEquipamento,
        codInsumo: codInsumo,
      );
}

class _EquipamentoInsumoPageState extends State<EquipamentoInsumoPage> {
  late final EquipamentoInsumoPageController _controller;
  int? codEquipamento;
  int? codInsumo;

  _EquipamentoInsumoPageState({required this.codEquipamento, this.codInsumo});

  @override
  void initState() {
    _controller = EquipamentoInsumoPageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.cubit.close();
    _controller.equipamentoCubit.close();
    _controller.insumoCubit.close();
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
                  EquipamentoModel? equipamento = state.objs
                      .where(
                        (element) => element.cod == codEquipamento,
                      )
                      .firstOrNull;

                  List<EquipamentoModel> equipamentos =
                      state.objs.where((e) => e.ativo == true).toList();
                  return DropDownSearchWidget(
                    initialValue: equipamento,
                    sourceList: equipamentos,
                    onChanged: (value) {
                      codEquipamento = value?.cod;
                      _controller.refresh();
                    },
                    placeholder: 'Equipamento',
                  );
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            Expanded(
              child: BlocBuilder<InsumoCubit, InsumoState>(
                bloc: _controller.insumoCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(child: LoadingWidget());
                  }
                  InsumoModel? insumo = state.objs
                      .where(
                        (element) => element.cod == codInsumo,
                      )
                      .firstOrNull;

                  List<InsumoModel> insumos =
                      state.objs.where((e) => e.ativo == true).toList();

                  return DropDownSearchWidget(
                    initialValue: insumo,
                    sourceList: insumos,
                    onChanged: (value) {
                      codInsumo = value?.cod;
                      _controller.refresh();
                    },
                    placeholder: 'Insumo',
                  );
                },
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        AddButtonWidget(
          onPressed: () =>
              _controller.adicionar(context, codEquipamento, codInsumo),
        ),
        BlocBuilder<EquipamentoInsumoCubit, EquipamentoInsumoState>(
          bloc: _controller.cubit,
          builder: (context, state) {
            if (state.loading == true) {
              return const Center(
                child: LoadingWidget(),
              );
            }
            _controller.dto = state.obj;
            List<EquipamentoInsumoConsumoResponseDTO>? consumos =
                _controller.dto?.consumos;
            if (codEquipamento != null) {
              consumos = consumos
                  ?.where((element) => element.codEquipamento == codEquipamento)
                  .toList();
            }
            if (codInsumo != null) {
              consumos = consumos
                  ?.where((element) => element.codInsumo == codInsumo)
                  .toList();
            }
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: PlutoGridWidget(
                  onEdit: (objeto) => _controller.editar(context, objeto),
                  onDelete: (objeto) => _controller.remover(context, objeto),
                  columns: _controller.colunas,
                  items: consumos ?? [],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
