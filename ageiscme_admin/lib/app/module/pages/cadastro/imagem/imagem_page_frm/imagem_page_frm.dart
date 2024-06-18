import 'package:ageiscme_admin/app/module/pages/cadastro/imagem/imagem_page_frm/imagem_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/botoes/upload_button_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/dropdown_search_export.dart';
import 'package:flutter/material.dart';

class ImagemPageFrm extends StatefulWidget {
  const ImagemPageFrm({
    Key? key,
    required this.imagem,
  }) : super(key: key);

  final ImagemModel imagem;

  @override
  State<ImagemPageFrm> createState() => _ImagemPageFrmState(imagem: imagem);
}

class _ImagemPageFrmState extends State<ImagemPageFrm> {
  _ImagemPageFrmState({required this.imagem});
  late String titulo;
  ImagemModel imagem;

  late final ImagemPageFrmCubit cubit = ImagemPageFrmCubit(
    imagemModel: imagem,
    service: ImagemService(),
  );

  @override
  void initState() {
    super.initState();
  }

  void setFields() {
    titulo = 'Cadastro de Imagens';
    if (imagem.cod != 0) {
      titulo = 'Edição da Imagem: ${imagem.cod} - ${imagem.nomeFoto}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<ImagemPageFrmCubit, ImagemPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<ImagemPageFrmCubit, ImagemPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(8.0),
            titlePadding: const EdgeInsets.all(8.0),
            actionsPadding: const EdgeInsets.all(8.0),
            insetPadding: const EdgeInsets.all(50.0),
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
              constraints: const BoxConstraints(
                minWidth: 500,
                minHeight: 500,
                maxHeight: 1000,
                maxWidth: 1200,
              ),
              height: size.height * 0.5,
              width: size.width * 0.5,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropdownSearch<String>(
                        clearButtonProps: const ClearButtonProps(
                          isVisible: true,
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Obrigatório'
                            : null,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        popupProps: const PopupProps.menu(
                          showSearchBox: true,
                        ),
                        itemAsString: (item) => item,
                        items: _getIdentificadores(),
                        onChanged: (item) {
                          imagem.identificadorImagem = item;
                        },
                        selectedItem: imagem.identificadorImagem,
                        filterFn: (identificador, filter) => identificador
                            .toUpperCase()
                            .contains(filter.toUpperCase()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: imagem.ativo,
                            onClick: (value) => imagem.ativo = value,
                            text: 'Ativo',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ImageDisplayWidget(
                        imageBase64: imagem.foto,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            runSpacing: 16 * paddingHorizontalScale,
                            spacing: 16 * paddingHorizontalScale,
                            children: [
                              UploadButtonWidget(
                                placeholder: 'Anexar Imagem',
                                imageSelected: (value1, value2) {
                                  salvarImagem(value1, value2);
                                },
                              ),
                              OpenDocWidget(
                                placeholder: 'Abrir Imagem',
                                documentoString: imagem.foto,
                                documentName: imagem.nomeFoto != null
                                    ? trataImagem(imagem.nomeFoto)!
                                    : 'arquivo sem nome.Webp',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: [
                      if (imagem.cod != null && imagem.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: imagem.cod!,
                            termo: 'IMAGEM',
                          ),
                          context: context,
                        ),
                    ],
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 16 * paddingHorizontalScale,
                    runSpacing: 16 * paddingHorizontalScale,
                    alignment: WrapAlignment.end,
                    children: [
                      SaveButtonWidget(
                        onPressed: () => {salvar()},
                      ),
                      CleanButtonWidget(
                        onPressed: () => {
                          setState(() {
                            imagem = ImagemModel.empty();
                          }),
                        },
                      ),
                      CancelButtonUnfilledWidget(
                        onPressed: () =>
                            {Navigator.of(context).pop((false, ''))},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void salvarImagem(String foto, String nomeFoto) {
    setState(() {
      imagem.foto = foto;
      imagem.nomeFoto = nomeFoto;
      if (imagem.nomeFoto != null) {
        imagem.nomeFoto = trataImagem(imagem.nomeFoto);
      }
      print(imagem.nomeFoto);
    });
  }

  String? trataImagem(String? str) {
    if (str == null) return null;
    if (!str.contains('.')) return str + '.Webp';
    return str.substring(0, str.lastIndexOf('.')) + '.Webp';
  }

  List<String> _getIdentificadores() => [
        'logo_esquerdo',
        'logo_direito',
        'logo_ageis',
        'logo_menu_cima',
        'logo_menu_baixo',
        'logo_impressao_esquerda',
        'logo_impressao_direita',
        'inicio_processo',
      ];

  void salvar() {
    if (imagem.identificadorImagem == null ||
        imagem.identificadorImagem!.isEmpty) return;
    cubit.save(imagem);
  }
}
