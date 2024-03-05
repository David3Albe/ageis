import 'package:ageiscme_admin/app/module/pages/cadastro/imagem/imagem_page_frm/imagem_page_frm_state.dart';
import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/botoes/upload_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
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

  late final TextFieldStringWidget txtIdentificador = TextFieldStringWidget(
    placeholder: 'Identificador',
    onChanged: (String? str) {
      imagem.identificadorImagem = txtIdentificador.text;
    },
  );

  @override
  void initState() {
    txtIdentificador.addValidator((String str) {
      if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtIdentificador.text = imagem.identificadorImagem.toString();

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
                      child: txtIdentificador,
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
                                documentName:
                                    imagem.nomeFoto ?? 'arquivo sem nome.jpg',
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
                    onPressed: () => {Navigator.of(context).pop((false, ''))},
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
    });
  }

  void salvar() {
    if (!txtIdentificador.valid) return;

    cubit.save(imagem);
  }
}
