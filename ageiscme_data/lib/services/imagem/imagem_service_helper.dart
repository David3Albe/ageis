import 'dart:convert';

import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:flutter/material.dart';

class ImagemServiceHelper {
  static Image? loadImagem({
    required ImagemModel? imagem,

  }) {
    if (imagem?.foto == null) return null;
    String imageBase64 = imagem?.foto == null ? '' : imagem!.foto!;
    final bytes = base64Decode(imageBase64);
    Image image = Image.memory(
      bytes,
    );
    return image;
  }
}
