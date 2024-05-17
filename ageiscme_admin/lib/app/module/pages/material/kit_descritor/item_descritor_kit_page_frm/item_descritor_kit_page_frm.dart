import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/item_descritor_kit_page_frm/item_descritor_kit_page_frm_state.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_data/services/item_descritor_kit/item_descritor_kit_service.dart';
import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/dto/item_descritor/drop_down_search/item_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemDescritorKitPageFrm extends StatefulWidget {
  const ItemDescritorKitPageFrm({
    Key? key,
    required this.itemDescritorKit,
    required this.onSave,
  }) : super(key: key);

  final ItemDescritorKitModel itemDescritorKit;
  final void Function(ItemDescritorKitModel) onSave;

  @override
  State<ItemDescritorKitPageFrm> createState() =>
      _ItemDescritorKitPageFrmState(itemDescritorKit: itemDescritorKit);
}

class _ItemDescritorKitPageFrmState extends State<ItemDescritorKitPageFrm> {
  _ItemDescritorKitPageFrmState({required this.itemDescritorKit});

  late String titulo;
  ItemDescritorKitModel itemDescritorKit;

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
                      child: DropDownSearchApiWidget<
                          KitDescritorDropDownSearchResponseDTO>(
                        search: (str) async =>
                            (await KitDescritorService().getDropDownSearch(
                              KitDescritorDropDownSearchDTO(
                                numeroRegistros: 30,
                                termoPesquisa: str,
                                apenasAtivos: true,
                              ),
                            ))
                                ?.$2 ??
                            [],
                        textFunction: (kitDescritor) => kitDescritor.Nome(),
                        initialValue: itemDescritorKit.kitDescritor,
                        onChanged: (value) {
                          itemDescritorKit.codDescritorKit = value?.cod;
                          itemDescritorKit.kitDescritor = value;
                        },
                        placeholder: 'Descritor do Kit',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropDownSearchApiWidget<
                          ItemDescritorDropDownSearchResponseDTO>(
                        search: (str) async =>
                            (await ItemDescritorService().getDropDownSearch(
                              ItemDescritorDropDownSearchDTO(
                                numeroRegistros: 30,
                                termoPesquisa: str,
                                apenasAtivos: true,
                              ),
                            ))
                                ?.$2 ??
                            [],
                        textFunction: (itemDescritor) => itemDescritor.Nome(),
                        initialValue: itemDescritorKit.itemDescritor,
                        onChanged: (value) {
                          itemDescritorKit.codDescritorItem = value?.cod;
                          itemDescritorKit.itemDescritor = value;
                        },
                        placeholder: 'Descritor do Item',
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
