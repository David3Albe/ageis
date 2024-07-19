import 'dart:convert';

import 'package:ageiscme_mixins/mixins/image/image_mixin.dart';
import 'package:ageiscme_mixins/mixins/image/image_service_mixin.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ImagemPrintingServiceHelper {
  static Image? loadImagem({
    required ImagemMixin? imagem,
  }) {
    if (imagem?.foto == null) return null;
    String imageBase64 = imagem!.foto!;
    final bytes = base64Decode(imageBase64);
    return Image(MemoryImage(bytes));
  }

  static Future<Widget?> loadDefaultWidgetIdentificador({
    required String identificador,
  }) async {
    Image? image = await loadImagemNetwork(identificador: identificador);
    if (image == null) return null;
    return Container(
      height: 35,
      child: image,
    );
  }

  static Future<Image?> loadImagemNetwork({
    required String identificador,
  }) async {
    print('tentou');
    ImagemMixin? imagem = await Modular.get<ImageServiceMixin>()
        .getLogoIdentificador(identificador: identificador);
        print('imagem');
        print(imagem);
    return loadImagem(imagem: imagem);
  }
}
