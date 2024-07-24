import 'package:ageiscme_admin/app/module/pages/cadastro/imagem/imagem_page_frm/imagem_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_image_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ImagemPageFrm extends StatefulWidget {
  const ImagemPageFrm({
    Key? key,
    required this.imagem,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final ImagemModel imagem;
  final void Function(String) onSaved;
  final void Function() onCancel;

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

  late bool Function() validateIdentificador;

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ImagemPageFrmCubit, ImagemPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: titulo,
                  ),
                ),
                const Spacer(),
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
                              child: DropDownSearchWidget<String>(
                                placeholder: 'Identificador',
                                initialValue: imagem.identificadorImagem,
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    validateIdentificador =
                                        validateMethodBuilder,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Obrigatório'
                                        : null,
                                textFunction: (p0) => p0,
                                sourceList: _getIdentificadores(),
                                onChanged: (item) {
                                  imagem.identificadorImagem = item;
                                },
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
                            const Padding(padding: EdgeInsets.only(top: 24)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    CustomPopupItemImageModel.getImageItem(
                      'Anexar Imagem',
                      salvarImagem,
                    ),
                    CustomPopupItemOpenDocModel.getOpenDocItem(
                      'Abrir Imagem',
                      context,
                      imagem.foto,
                      imagem.nomeFoto != null
                          ? trataImagem(imagem.nomeFoto)!
                          : 'arquivo sem nome.Webp',
                    ),
                    if (imagem.cod != null && imagem.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Imagem ${imagem.cod!}',
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
                      onPressed: widget.onCancel,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void salvarImagem(Future<ImageObjectModel?> Function() onSelectImage) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      imagem.foto = imageNew.base64;
      imagem.nomeFoto = imageNew.fileName;
      if (imagem.nomeFoto != null) {
        imagem.nomeFoto = trataImagem(imagem.nomeFoto);
      }
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
    bool identificadorValido = validateIdentificador();
    if (!identificadorValido) return;
    if (imagem.foto == null || imagem.foto!.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário anexar uma imagem nas ações extras para salvar',
      );
      return;
    }
    cubit.save(imagem, widget.onSaved);
  }
}
