import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/form_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/form/widgets/grid_items_widget.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/form/widgets/solicitacao_usuarios_widget.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/form_state.dart'
    as form;
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/default_button_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  FormWidget({
    required this.cod,
    required this.onSaved,
    required this.onCancel,
    Key? key,
  });
  final void Function(String) onSaved;
  final void Function() onCancel;

  final int cod;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  void initState() {
    context.read<FormCubit>().carregar(widget.cod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    form.FormState formState = context.watch<FormCubit>().state;
    SolicitacaoMaterialModel? solicitacao = formState.response?.solicitacao;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TitleWidget(
                text: 'Solicitação de Material: ${solicitacao?.cod ?? ''}',
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 500,
                    minWidth: 500,
                  ),
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Builder(
                    builder: (context) {
                      if (formState.loading == true) {
                        return const Center(child: LoadingWidget());
                      }
                      return Column(
                        children: [
                          GridItemsWidget(),
                          const SolicitacaoUsuariosWidget(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Spacer(),
            DefaultButtonWidget(
              readonly: context.watch<FormCubit>().botaoRecebimentoReadonly,
              cor: Colors.lightBlue,
              corHovered: Colors.lightBlue.shade800,
              icon: Symbols.call_received,
              text: 'Recebido Por',
              onPressed: () => context.read<FormCubit>().receber(context),
            ),
            const Padding(padding: EdgeInsets.only(left: 16)),
            DefaultButtonWidget(
              readonly: context.watch<FormCubit>().botaoAutorizadoReadonly,
              cor: Colors.lightBlue,
              corHovered: Colors.lightBlue.shade800,
              icon: Symbols.perm_identity,
              text: 'Autorizar',
              onPressed: () => context.read<FormCubit>().autorizar(context),
            ),
            const Padding(padding: EdgeInsets.only(left: 16)),
            CancelButtonUnfilledWidget(
              onPressed: widget.onCancel,
            ),
          ],
        ),
      ],
    );
  }
}
