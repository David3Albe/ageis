import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/localizacao_arsenal/localizacao_arsenal_page_frm/localizacao_arsenal_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/localizacao_arsenal/localizacao_arsenal_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LocalizacaoArsenalPageFrm extends StatefulWidget {
  const LocalizacaoArsenalPageFrm({
    Key? key,
    required this.localizacaoArsenal,
    required this.onCancel,
    required this.onSaved,
  }) : super(key: key);

  final LocalizacaoArsenalModel localizacaoArsenal;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<LocalizacaoArsenalPageFrm> createState() =>
      _LocalizacaoArsenalPageFrmState(localizacaoArsenal: localizacaoArsenal);
}

class _LocalizacaoArsenalPageFrmState extends State<LocalizacaoArsenalPageFrm> {
  _LocalizacaoArsenalPageFrmState({required this.localizacaoArsenal});
  late final ArsenalEstoqueCubit arsenalEstoqueCubit;
  late String titulo;
  LocalizacaoArsenalModel localizacaoArsenal;
  late final LocalizacaoArsenalPageFrmCubit cubit =
      LocalizacaoArsenalPageFrmCubit(
    localizacaoArsenalModel: localizacaoArsenal,
    service: LocalizacaoArsenalService(),
  );
  late final TextFieldStringWidget txtLocalizacao = TextFieldStringWidget(
    placeholder: 'Localização *',
    onChanged: (String? str) {
      localizacaoArsenal.local = txtLocalizacao.text;
    },
  );
  late final TextFieldNumberWidget txtCodigoBarra = TextFieldNumberWidget(
    placeholder: 'Código de Barras *',
    onChanged: (String str) {
      localizacaoArsenal.codBarra =
          str.isEmpty ? null : int.parse(txtCodigoBarra.text);
    },
  );

  late bool Function() validateEstoque;

  @override
  void initState() {
    arsenalEstoqueCubit = ArsenalEstoqueCubit();
    arsenalEstoqueCubit.loadAll();
    txtLocalizacao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 20) {
        return 'Pode ter no máximo 20 caracteres';
      }
      return '';
    });

    txtCodigoBarra.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 10) {
        return 'Pode ser até no máximo 9999999999';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtLocalizacao.text = localizacaoArsenal.local.toString();
    if (localizacaoArsenal.codBarra == null) {
      txtCodigoBarra.text = '';
    } else {
      txtCodigoBarra.text = localizacaoArsenal.codBarra.toString();
    }
    titulo = 'Cadastro de Localização do Arsenal';
    if (localizacaoArsenal.cod != 0) {
      titulo =
          'Edição de Localização do Arsenal: ${localizacaoArsenal.cod} - ${localizacaoArsenal.local}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<LocalizacaoArsenalPageFrmCubit,
        LocalizacaoArsenalPageFrmState>(
      bloc: cubit,
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child:
                        BlocBuilder<ArsenalEstoqueCubit, ArsenalEstoqueState>(
                      bloc: arsenalEstoqueCubit,
                      builder: (context, arsenaisState) {
                        if (arsenaisState.loading) {
                          return const LoadingWidget();
                        }
                        List<ArsenalEstoqueModel> arsenaisEstoques =
                            arsenaisState.arsenaisEstoques;

                        arsenaisEstoques.sort(
                          (a, b) => a.nome!.compareTo(b.nome!),
                        );
                        ArsenalEstoqueModel? arsenal = arsenaisEstoques
                            .where(
                              (element) =>
                                  element.cod == localizacaoArsenal.codEstoque,
                            )
                            .firstOrNull;
                        return DropDownSearchWidget<ArsenalEstoqueModel>(
                          validateBuilder: (context, validateMethodBuilder) =>
                              validateEstoque = validateMethodBuilder,
                          validator: (val) =>
                              val == null ? 'Obrigatório' : null,
                          initialValue: arsenal,
                          sourceList: arsenaisEstoques
                              .where((element) => element.ativo == true)
                              .toList(),
                          onChanged: (value) =>
                              localizacaoArsenal.codEstoque = value?.cod,
                          placeholder: 'Arsenal *',
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtLocalizacao,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtCodigoBarra,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: localizacaoArsenal.ativo,
                          onClick: (value) => localizacaoArsenal.ativo = value,
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
                          if (localizacaoArsenal.cod != null &&
                              localizacaoArsenal.cod != 0)
                            CustomPopupItemHistoryModel.getHistoryItem(
                              title: 'Localização Arsenal ${localizacaoArsenal.cod!}',
                              child: HistoricoPage(
                                pk: localizacaoArsenal.cod!,
                                termo: 'LOCALIZACAO_ARSENAL',
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
                              localizacaoArsenal =
                                  LocalizacaoArsenalModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: CancelButtonUnfilledWidget(
                          onPressed: widget.onCancel,
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
    bool localizacaoValid = txtLocalizacao.valid;
    bool codigoBarraValid = txtCodigoBarra.valid;
    bool estoqueValid = validateEstoque();
    if (!localizacaoValid || !codigoBarraValid || !estoqueValid) return;
    cubit.save(localizacaoArsenal, widget.onSaved);
  }
}
