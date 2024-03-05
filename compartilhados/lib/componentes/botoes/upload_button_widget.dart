import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/functions/image_helper/image_helper.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class UploadButtonWidget extends StatefulWidget {
  const UploadButtonWidget({
    required this.imageSelected,
    this.readonly = false,
    required this.placeholder,
    Key? key,
  });

  final void Function(String base64Image, String fileName)? imageSelected;
  final bool readonly;
  final String placeholder;

  @override
  State<UploadButtonWidget> createState() => _UploadButtonWidgetState();
}

class _UploadButtonWidgetState extends State<UploadButtonWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    double scaleH = MediaQuery.of(context).size.height / 1080;
    double scaleW = MediaQuery.of(context).size.width / 1920;
    return ElevatedButton(
      onHover: (bool hover) => setState(() => hovered = hover),
      style: !hovered
          ? ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Cores.corBotaoArquivo,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Cores.corBotaoArquivoHover,
            ),
      onPressed: !valid || widget.readonly ? null : onPressed,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 12.0 * scaleW,
          vertical: 6.0 * scaleH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: const Icon(
                  Symbols.upload,
                  color: Cores.corIconeBranco,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.placeholder,
                  style: TextStyle(
                    color: Cores.corTextoBranco,
                    fontSize: HelperFunctions.calculaFontSize(context, 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() async {
    if (widget.imageSelected == null) return;
    ImageObjectModel? selectedImage = await ImageHelper.selectImage();
    if (selectedImage == null) return;
    widget.imageSelected!(selectedImage.base64, selectedImage.fileName);
  }
}
