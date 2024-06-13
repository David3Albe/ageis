import 'dart:convert';

import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ImagemPrintingServiceHelper {
  static Image? loadImagem(ImagemModel? imagem) {
    if (imagem?.foto == null) return null;
    String imageBase64 = imagem!.foto!;
    final bytes = base64Decode(imageBase64);
    return Image(MemoryImage(bytes));
  }

  static Future<Image?> loadImagemNetwork(String identificador) async {
    ImagemModel? imagem = await ImagemService().getLogoIdentificador(identificador: identificador);
    return loadImagem(imagem);
  }
}
