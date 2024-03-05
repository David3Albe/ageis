import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/item_descritor/item_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_descritor/kit_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/item_descritor_kit_page_frm/item_descritor_kit_page_frm_state.dart';
import 'package:ageiscme_data/services/item_descritor_kit/item_descritor_kit_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemDescritorKitPageFrm extends StatefulWidget {
  const ItemDescritorKitPageFrm({
    Key? key,
    required this.itemDescritorKit,
    required this.onSave,
    required this.itemDescritorCubit,
  }) : super(key: key);

  final ItemDescritorKitModel itemDescritorKit;
  final void Function(ItemDescritorKitModel) onSave;
  final ItemDescritorCubit itemDescritorCubit;

  @override
  State<ItemDescritorKitPageFrm> createState() =>
      _ItemDescritorKitPageFrmState(itemDescritorKit: itemDescritorKit);
}

class _ItemDescritorKitPageFrmState extends State<ItemDescritorKitPageFrm> {
  _ItemDescritorKitPageFrmState({required this.itemDescritorKit});

  late String titulo;
  ItemDescritorKitModel itemDescritorKit;
  late final KitDescritorCubit kitDescritorCubit;

  late final ItemDescritorKitPageFrmCubit cubit = ItemDescritorKitPageFrmCubit(
    service: ItemDescritorKitService(),
    itemDescritorKitModel: itemDescritorKit,
  );

  late final TextFieldNumberWidget txtQuantidade = TextFieldNumberWidget(
    placeholder: 'Quantidade',
    onChanged: (String? str) {
      itemDescritorKit.quantidade = int.parse(txtQuantidade.text);
    },
  );

  @override
  void initState() {
    kitDescritorCubit = KitDescritorCubit();
    kitDescritorCubit.loadAll();

    txtQuantidade.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    if (itemDescritorKit.quantidade == null) {
      txtQuantidade.text = '';
    } else {
      txtQuantidade.text = itemDescritorKit.quantidade.toString();
    }

    titulo = 'Cadastro de Descritor de Kits - Itens';

    if (itemDescritorKit.cod != 0) {
      titulo = 'Edição do Descritor de Kits - Itens: ${itemDescritorKit.cod}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<ItemDescritorKitPageFrmCubit,
        ItemDescritorKitPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<ItemDescritorKitPageFrmCubit,
          ItemDescritorKitPageFrmState>(
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
                        const Spacer(),
                        CloseButtonWidget(
                          onPressed: () =>
                              Navigator.of(context).pop((false, '')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<KitDescritorCubit, KitDescritorState>(
                        bloc: kitDescritorCubit,
                        builder: (context, kitsDescritoresState) {
                          if (kitsDescritoresState.loading) {
                            return const LoadingWidget();
                          }
                          List<KitDescritorModel> kitsDescritores =
                              kitsDescritoresState.kitDescritores;
                          KitDescritorModel? kitDescritor = kitsDescritores
                              .where(
                                (element) =>
                                    element.cod ==
                                    itemDescritorKit.codDescritorKit,
                              )
                              .firstOrNull;

                          kitsDescritores.sort(
                            (a, b) => a.nome!.compareTo(b.nome!),
                          );
                          return DropDownWidget(
                            initialValue: kitDescritor,
                            sourceList: kitsDescritores,
                            onChanged: (value) =>
                                itemDescritorKit.codDescritorKit = value.cod!,
                            placeholder: 'Descritor de Kit',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child:
                          BlocBuilder<ItemDescritorCubit, ItemDescritorState>(
                        bloc: widget.itemDescritorCubit,
                        builder: (context, itensDescritorState) {
                          if (itensDescritorState.loading) {
                            return const LoadingWidget();
                          }
                          List<ItemDescritorModel> itensDescritores =
                              itensDescritorState.itensDescritores;

                          ItemDescritorModel? itemDescritor = itensDescritores
                              .where(
                                (element) =>
                                    element.cod ==
                                    itemDescritorKit.codDescritorItem,
                              )
                              .firstOrNull;
                          itensDescritores.sort(
                            (a, b) =>
                                a.descricaoCurta!.compareTo(b.descricaoCurta!),
                          );
                          return DropDownSearchWidget(
                            textFunction: (itemDescritor) =>
                                itemDescritor.ItemDescritorText(),
                            initialValue: itemDescritor,
                            sourceList: itensDescritores,
                            onChanged: (value) =>
                                itemDescritorKit.codDescritorItem = value?.cod,
                            placeholder: 'Descritor de Item',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtQuantidade,
                    ),
                    const Spacer(),
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
                                itemDescritorKit =
                                    ItemDescritorKitModel.empty();
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
      ),
    );
  }

  Future salvar() async {
    if (!txtQuantidade.valid) return;
    await cubit.save(itemDescritorKit);
    widget.onSave(itemDescritorKit);
  }
}
