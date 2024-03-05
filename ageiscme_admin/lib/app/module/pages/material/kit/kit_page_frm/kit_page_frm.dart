import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_cor/kit_cor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_descritor/kit_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm_state.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitPageFrm extends StatefulWidget {
  const KitPageFrm({
    Key? key,
    required this.kit,
    required this.kitCorCubit,
  }) : super(key: key);

  final KitModel kit;
  final KitCorCubit kitCorCubit;

  @override
  State<KitPageFrm> createState() => _KitPageFrmState(kit: kit);
}

class _KitPageFrmState extends State<KitPageFrm> {
  _KitPageFrmState({required this.kit});

  late String titulo;
  KitModel kit;
  late final KitDescritorCubit kitDescritorCubit;

  late final KitPageFrmCubit cubit = KitPageFrmCubit(
    kitModel: kit,
    service: KitService(),
  );

  late final TextFieldStringWidget txtCodBarra = TextFieldStringWidget(
    placeholder: 'Código de Barras',
    readOnly: true,
  );

  late final TextFieldStringWidget txtRestricao = TextFieldStringWidget(
    placeholder: 'Restrição',
    onChanged: (String? str) {
      kit.restricao = txtRestricao.text;
    },
  );

  late final TextFieldStringWidget txtConjuntoAtual = TextFieldStringWidget(
    placeholder: 'Conjunto Atual',
    readOnly: true,
  );

  late final TextFieldNumberWidget txtPreparo = TextFieldNumberWidget(
    placeholder: 'Sit. Preparo',
    readOnly: true,
    onChanged: (String? str) {
      kit.preparo = txtPreparo.text;
    },
  );

  late final TextFieldNumberWidget txtCodEmbalagem = TextFieldNumberWidget(
    placeholder: 'Embalagem',
    readOnly: true,
    onChanged: (String? str) {
      kit.codEmbalagem = int.parse(txtCodEmbalagem.text);
    },
  );

  late final TextFieldNumberWidget txtProcessoLeitura = TextFieldNumberWidget(
    placeholder: 'Leitura',
    readOnly: true,
    onChanged: (String? str) {
      kit.codProcessoLeitura = int.parse(txtProcessoLeitura.text);
    },
  );

  @override
  void initState() {
    kitDescritorCubit = KitDescritorCubit();
    kitDescritorCubit.loadAll();

    txtRestricao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtCodBarra.text = kit.codBarra.toString();
    txtPreparo.text = kit.preparo.toString();

    if (kit.codEmbalagem == null) {
      txtCodEmbalagem.text = '';
    } else {
      txtCodEmbalagem.text = kit.codEmbalagem.toString();
    }

    if (kit.codConjunto == null) {
      txtConjuntoAtual.text = '';
    } else {
      txtConjuntoAtual.text = kit.codConjunto.toString();
    }

    if (kit.codProcessoLeitura == null) {
      txtProcessoLeitura.text = '';
    } else {
      txtProcessoLeitura.text = kit.codProcessoLeitura.toString();
    }

    if (kit.restricao == null) {
      txtRestricao.text = '';
    } else {
      txtRestricao.text = kit.restricao.toString();
    }

    titulo = 'Cadastro de Kits';
    if (kit.cod != 0) {
      titulo = 'Edição do Kit: ${kit.cod} - ${kit.codBarra}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<KitPageFrmCubit, KitPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<KitPageFrmCubit, KitPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(8.0),
            titlePadding: const EdgeInsets.all(8.0),
            actionsPadding: const EdgeInsets.all(8.0),
            title: Row(
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
            content: Container(
              constraints: BoxConstraints(
                minWidth: size.width * .5,
                minHeight: size.height * .5,
                maxHeight: size.height * .8,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<KitDescritorCubit,
                                KitDescritorState>(
                              bloc: kitDescritorCubit,
                              builder: (context, kitsDescritoresState) {
                                if (kitsDescritoresState.loading) {
                                  return const Center(
                                    child: const LoadingWidget(),
                                  );
                                }
                                List<KitDescritorModel> kitsDescritores =
                                    kitsDescritoresState.kitDescritores;
                                kitsDescritores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitDescritorModel? kitDescritor =
                                    kitsDescritores
                                        .where(
                                          (element) =>
                                              element.cod ==
                                              kit.codDescritorKit,
                                        )
                                        .firstOrNull;

                                kitsDescritores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );

                                return DropDownSearchWidget(
                                  textFunction: (kitDescritor) =>
                                      kitDescritor.KitDescritorText(),
                                  initialValue: kitDescritor,
                                  sourceList: kitsDescritores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codDescritorKit = value?.cod,
                                  placeholder: 'Descritor do Kit',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtCodBarra,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const Center(
                                    child: const LoadingWidget(),
                                  );
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;

                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor1,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor1 = value?.cod,
                                  placeholder: 'Cor 1',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;
                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor2,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor2 = value?.cod,
                                  placeholder: 'Cor 2',
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
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const LoadingWidget();
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;
                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor3,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor3 = value?.cod,
                                  placeholder: 'Cor 3',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const LoadingWidget();
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;
                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor4,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor4 = value?.cod,
                                  placeholder: 'Cor 4',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropDownWidget<KitSituacaoOption>(
                        initialValue: KitSituacaoOption.situacaoOptions
                            .where(
                              (element) => element.cod == kit.status,
                            )
                            .firstOrNull,
                        sourceList: KitSituacaoOption.situacaoOptions,
                        onChanged: (value) => kit.status = value.cod.toString(),
                        placeholder: 'Situação',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtRestricao,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtConjuntoAtual,
                    ),
                    if (kit.itens!.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Itens deste Kit',
                          style: Fontes.getRoboto(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Builder(
                          builder: (context) {
                            List<ItemModel>? itens = [];

                            itens.addAll(kit.itens!);

                            return ListFieldWidget<ItemModel>(
                              sourceList: itens,
                              removeButton: false,
                              onItemSelected: (value) {},
                              itemText: (value) {
                                return '${value.descricao}, ${value.idEtiqueta}';
                              },
                            );
                          },
                        ),
                      ),
                    },
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtPreparo,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtCodEmbalagem,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtProcessoLeitura,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
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
                          kit = KitModel.empty();
                        }),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: CancelButtonUnfilledWidget(
                      onPressed: () => {Navigator.of(context).pop((false, ''))},
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void salvar() {
    if (!txtRestricao.valid) return;
    cubit.save(kit);
  }
}
