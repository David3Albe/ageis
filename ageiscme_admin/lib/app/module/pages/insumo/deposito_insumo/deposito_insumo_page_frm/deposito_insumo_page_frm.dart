import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/deposito_insumo/deposito_insumo_page_frm/deposito_insumo_page_frm_state.dart';
import 'package:ageiscme_data/services/deposito_insumo/deposito_insumo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/widgets.dart';

class DepositoInsumoPageFrm extends StatefulWidget {
  const DepositoInsumoPageFrm({
    Key? key,
    required this.depositoInsumo,
  }) : super(key: key);

  final DepositoInsumoModel depositoInsumo;

  @override
  State<DepositoInsumoPageFrm> createState() =>
      _DepositoInsumoPageFrmState(depositoInsumo: depositoInsumo);
}

class _DepositoInsumoPageFrmState extends State<DepositoInsumoPageFrm> {
  _DepositoInsumoPageFrmState({required this.depositoInsumo});
  late final LocalInstituicaoCubit localInstituicaoCubit;
  late final DepositoInsumoStatusOption situacaoOption;
  late String titulo;
  DepositoInsumoModel depositoInsumo;
  late final DepositoInsumoPageFrmCubit cubit = DepositoInsumoPageFrmCubit(
    depositoInsumoModel: depositoInsumo,
    service: DepositoInsumoService(),
  );
  late final TextFieldStringWidget txtNomeDeposito = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      depositoInsumo.nome = txtNomeDeposito.text;
    },
  );
  late final TextFieldNumberWidget txtCodigoBarra = TextFieldNumberWidget(
    placeholder: 'Código de Barras',
    onChanged: (String? str) {
      depositoInsumo.codBarra = int.parse(txtCodigoBarra.text);
    },
  );

  @override
  void initState() {
    localInstituicaoCubit = LocalInstituicaoCubit();
    localInstituicaoCubit.loadAll();

    txtNomeDeposito.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtCodigoBarra.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigátorio';
      } else if (str.length > 10) {
        return 'Pode ser até no máximo 9999999999';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtNomeDeposito.text = depositoInsumo.nome.toString();
    if (depositoInsumo.codBarra == null) {
      txtCodigoBarra.text = '';
    } else {
      txtCodigoBarra.text = depositoInsumo.codBarra.toString();
    }
    titulo = 'Cadastro de Depósito de Insumo';
    if (depositoInsumo.cod != 0) {
      titulo =
          'Edição do Depósito de Insumo: ${depositoInsumo.cod} - ${depositoInsumo.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<DepositoInsumoPageFrmCubit, DepositoInsumoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(
            minWidth: size.width * .5,
            minHeight: size.height * .5,
            maxHeight: size.height * .8,
          ),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: txtNomeDeposito,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: txtCodigoBarra,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: BlocBuilder<LocalInstituicaoCubit,
                        LocalInstituicaoState>(
                      bloc: localInstituicaoCubit,
                      builder: (context, locaisState) {
                        if (locaisState.loading) {
                          return const LoadingWidget();
                        }
                        List<LocalInstituicaoModel> locaisInstituicao =
                            locaisState.locaisInstituicoes;

                        locaisInstituicao.sort(
                          (a, b) => a.nome.compareTo(b.nome),
                        );
                        LocalInstituicaoModel? local = locaisInstituicao
                            .where(
                              (element) =>
                                  element.cod == depositoInsumo.codLocal,
                            )
                            .firstOrNull;
                        return DropDownWidget<LocalInstituicaoModel>(
                          initialValue: local,
                          sourceList: locaisInstituicao
                              .where((element) => element.ativo == true)
                              .toList(),
                          onChanged: (value) =>
                              depositoInsumo.codLocal = value.cod,
                          placeholder: 'Local',
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: DropDownWidget<DepositoInsumoStatusOption>(
                      initialValue: DepositoInsumoStatusOption.situacaoOptions
                          .where(
                            (element) => element.cod == depositoInsumo.status,
                          )
                          .firstOrNull,
                      sourceList: DepositoInsumoStatusOption.situacaoOptions,
                      onChanged: (value) =>
                          depositoInsumo.status = value.cod.toString(),
                      placeholder: 'Situação',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: depositoInsumo.ativo,
                          onClick: (value) => depositoInsumo.ativo = value,
                          text: 'Ativo',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomPopupMenuWidget(
                        items: [
                          if (depositoInsumo.cod != null &&
                              depositoInsumo.cod != 0)
                            CustomPopupItemHistoryModel.getHistoryItem(
                              child: HistoricoPage(
                                pk: depositoInsumo.cod!,
                                termo: 'DEPOSITO_INSUMO',
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
                              depositoInsumo = DepositoInsumoModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: CancelButtonUnfilledWidget(
                          onPressed: () =>
                              {Navigator.of(context).pop((false, ''))},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void salvar() {
    if (!txtNomeDeposito.valid || !txtCodigoBarra.valid) return;
    cubit.save(depositoInsumo);
  }
}
